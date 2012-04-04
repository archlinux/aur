# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
pkgname=openmpi
pkgver=1.5.5
pkgrel=2
pkgdesc="High performance message passing library (MPI)"
arch=('i686' 'x86_64')
url="http://www.open-mpi.org"
license=('custom')
depends=('gcc' 'gcc-fortran' 'openssh' 'valgrind' 'libtool' 'hwloc')
makedepends=('inetutils')
options=(!libtool)
source=(http://www.open-mpi.org/software/ompi/v1.5/downloads/${pkgname}-${pkgver}.tar.bz2
        openmpi-1.5.4-fix-fakeroot-execution.patch)
sha1sums=('206e555f6d376443f2342f721d944e67dd1a04ef'
          'ec46abb6f9e01daca910e4079b9abc036db9ed20')

build() {
   cd "${srcdir}/${pkgname}-${pkgver}"

   # Fix fakeroot problem (FS#28644)
   patch -Np1 -i ../openmpi-1.5.4-fix-fakeroot-execution.patch

   ./configure --prefix=/usr \
               --sysconfdir=/etc/${pkgname} \
               --mandir=/usr/share/man \
               --enable-mpi-f90 \
               --libdir=/usr/lib/${pkgname} \
               --with-threads=posix \
               --enable-smp-locks \
               --with-valgrind \
               --enable-memchecker \
               --enable-debug \
               --enable-pretty-print-stacktrace \
               --without-slurm \
               --with-hwloc=/usr \
               --with-libltdl=/usr \
               FC=/usr/bin/gfortran \
               LDFLAGS="$LDFLAGS -Wl,-z,noexecstack"

   make
}

package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   make DESTDIR="${pkgdir}" install

   # FS#28583
   install -d -m 755 "${pkgdir}"/usr/lib/pkgconfig
   for i in ompi-c.pc ompi-cxx.pc ompi-f77.pc ompi-f90.pc ompi.pc; do
      ln -sf /usr/lib/openmpi/pkgconfig/$i "${pkgdir}"/usr/lib/pkgconfig/
   done

   # Openmpi's otfinfo conflicts with the one from texlive
   mv "${pkgdir}"/usr/bin/otfinfo{,mpi}

   # Openmpi's otfdump conflicts with the one from libotf
   mv "${pkgdir}"/usr/bin/otfdump{,ompi}

   # Remove dangling symlink
   rm "${pkgdir}"/usr/share/man/man1/orteCC.1

   install -d -m 755 "${pkgdir}"/etc/ld.so.conf.d
   echo "/usr/lib/${pkgname}" > "${pkgdir}"/etc/ld.so.conf.d/${pkgname}.conf

   install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
