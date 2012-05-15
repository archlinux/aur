# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
pkgname=openmpi
pkgver=1.6
pkgrel=1
pkgdesc="High performance message passing library (MPI)"
arch=('i686' 'x86_64')
url="http://www.open-mpi.org"
license=('custom')
depends=('gcc-fortran' 'openssh' 'valgrind' 'libltdl' 'hwloc')
makedepends=('inetutils')
options=(!libtool)
source=(http://www.open-mpi.org/software/ompi/v1.6/downloads/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('8b81eea712bb8f8120468003b5f29baecedf2367')

build() {
   cd "${srcdir}/${pkgname}-${pkgver}"

   # Make sure we use the system ltdl librariry rather than the ones in the tarball
   rm -r opal/libltdl

   # Search for openmpi-default-hostfile in /etc/openmpi
   sed -i "s|%s/etc/openmpi-default-hostfile|/etc/openmpi/openmpi-default-hostfile|" orte/runtime/orte_mca_params.c

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
               --with-libltdl=/usr  \
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
      ln -sf /usr/lib/openmpi/pkgconfig/${i} "${pkgdir}"/usr/lib/pkgconfig/
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
