# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=openmpi-slurm
pkgver=1.8.4
pkgrel=1
pkgdesc='High performance message passing library (MPI)'
arch=(i686 x86_64)
url='http://www.open-mpi.org'
license=(custom)
depends=(libltdl slurm-llnl)
makedepends=(inetutils valgrind gcc-fortran)
optdepends=('gcc-fortran: fortran support')
options=(staticlibs)
source=(http://www.open-mpi.org/software/ompi/v1.8/downloads/openmpi-${pkgver}.tar.bz2
        system_ltdl.patch)
sha1sums=('88ae39850fcf0db05ac20e35dd9e4cacc75bde4d'
          'd5f8a3d463f1a1f29ca4725d6fb3b9f8c40799dc')

prepare() {
   cd openmpi-$pkgver

   # Make sure we use the system ltdl library rather than the ones in the tarball
   rm -r opal/libltdl
   patch -p1 < ../system_ltdl.patch
   ./autogen.pl
}

build() {
   cd openmpi-$pkgver

   ./configure --prefix=/usr \
               --sysconfdir=/etc/openmpi \
               --enable-mpi-fortran=all \
               --libdir=/usr/lib/openmpi \
               --with-threads=posix \
               --enable-smp-locks \
               --with-valgrind \
               --enable-memchecker \
               --enable-pretty-print-stacktrace \
               --with-slurm \
               --with-hwloc=/usr \
               --with-libltdl=/usr  \
               FC=/usr/bin/gfortran \
               LDFLAGS="$LDFLAGS -Wl,-z,noexecstack"

   make
}

check() {
   cd openmpi-$pkgver

   make check
}

package() {
   cd openmpi-$pkgver
   make DESTDIR="$pkgdir" install

   # FS#28583
   install -d -m 755 "$pkgdir"/usr/lib/pkgconfig
   for i in ompi-c.pc ompi-cxx.pc ompi-f77.pc ompi-f90.pc ompi.pc; do
      ln -sf /usr/lib/openmpi/pkgconfig/$i "$pkgdir"/usr/lib/pkgconfig/
   done

   # Openmpi's otfinfo conflicts with the one from texlive
   mv "$pkgdir"/usr/bin/otfinfo{,mpi}

   # Remove dangling symlink and useless file
   rm "$pkgdir"/usr/share/vampirtrace/config.log

   install -d -m 755 "$pkgdir"/etc/ld.so.conf.d
   echo "/usr/lib/openmpi" > "$pkgdir"/etc/ld.so.conf.d/openmpi.conf

   install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
