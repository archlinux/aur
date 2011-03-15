# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
pkgname=openmpi
pkgver=1.5.2
pkgrel=1
pkgdesc="High performance message passing library (MPI)"
arch=('i686' 'x86_64')
url="http://www.open-mpi.org"
license=('custom')
depends=('gcc' 'gcc-fortran' 'openssh' 'valgrind' 'libtool' 'hwloc')
options=(!libtool)
source=(http://www.open-mpi.org/software/ompi/v1.5/downloads/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('a09361c5b2abe46c58641205ff93d7a19fa458f7')

build() {
   cd "${srcdir}/${pkgname}-${pkgver}"

   ./configure --prefix=/usr \
               --sysconfdir=/etc/${pkgname} \
               --mandir=/usr/share/man \
               --enable-mpi-f90 \
               --libdir=/usr/lib/${pkgname} \
               --with-threads=posix \
               --enable-mpi-threads \
               --enable-smp-locks \
               --with-valgrind \
               --enable-pretty-print-stacktrace \
               --without-slurm \
               --with-hwloc=external \
               --with-libltdl=/usr \
               FC=/usr/bin/gfortran \
               LDFLAGS='-Wl,-z,noexecstack'

   make
}

package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   make DESTDIR="${pkgdir}" install

   # Openmpi's otfinfo conflicts with the one from texlive
   mv "${pkgdir}"/usr/bin/otfinfo "${pkgdir}"/usr/bin/otfinfompi

   # Openmpi's otfdump conflicts with the one from libotf
   mv "${pkgdir}"/usr/bin/otfdump "${pkgdir}"/usr/bin/otfdumpompi

   # Symlink points to non-existing ortec++.1
   rm "${pkgdir}"/usr/share/man/man1/orteCC.1

   install -d -m 755 "${pkgdir}"/etc/ld.so.conf.d
   echo "/usr/lib/${pkgname}" > "${pkgdir}"/etc/ld.so.conf.d/${pkgname}.conf

   install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
