# Maintainer: epitron <chris@ill-logic.com>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgname=openmpi-cuda
_pkgname=openmpi
pkgver=1.10.6
pkgrel=1
pkgdesc='High performance message passing library (MPI) with CUDA support'
arch=(i686 x86_64)
url='http://www.open-mpi.org'
license=(custom)
depends=(libltdl hwloc)
provides=(openmpi)
conflicts=(openmpi)
makedepends=(inetutils valgrind gcc-fortran)
optdepends=('gcc-fortran: fortran support')
options=(staticlibs)
source=(http://www.open-mpi.org/software/ompi/v${pkgver%.*}/downloads/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('65606184a084a0eda6102b01e5a36a8f02d3195d15e91eabbb63e898bd110354')

build() {
   cd $_pkgname-$pkgver

   ./autogen.pl
   ./configure --prefix=/usr \
               --sysconfdir=/etc/${_pkgname} \
               --enable-mpi-fortran=all \
               --libdir=/usr/lib/${_pkgname} \
               --with-threads=posix \
               --enable-smp-locks \
               --with-valgrind \
               --enable-memchecker \
               --enable-pretty-print-stacktrace \
               --without-slurm \
               --with-hwloc=/usr \
               --with-libltdl=/usr \
               --with-cuda=/opt/cuda \
               FC=/usr/bin/gfortran \
               LDFLAGS="$LDFLAGS -Wl,-z,noexecstack"

   make
}

check() {
   cd $_pkgname-$pkgver

   make check
}

package() {
   cd $_pkgname-$pkgver
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
   echo "/usr/lib/$_pkgname" > "$pkgdir"/etc/ld.so.conf.d/$_pkgname.conf

   install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
