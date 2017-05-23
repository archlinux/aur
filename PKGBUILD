# Maintainer: ABDULLATIF Mouhamadi <bourou01dev@gmail.com>

pkgname=binutils-avr-tinyos
pkgver=2.17
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files for the avr architecture, with TinyOS patches"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils/"
license=('GPL')
depends=('glibc>=2.12-5' 'zlib')
makedepends=('subversion')
provides=('binutils-avr')
options=('staticlibs' '!libtool' '!distcc' '!ccache')

source=("http://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2"
        "30-binutils-2.17-avr-size.patch"
        "31-binutils-2.17-avr-coff.patch"
        "50-binutils-2.17-atmega256x.patch"
        "51-binutils-2.17-newdevices.patch"
        "dollarsign.patch"
        "makeinfo411.patch"
        "rfa1-newdevice.patch"
        "rfa1-size.patch")


sha1sums=('0f5c10d155d7ef67c5eb1261f84e70e2b92293fa'
          '2b5d2e59f69062e12cfcdec05c7a7c1605548b8d'
          '9c7428e902e5064540e0ed51c4c4d39e7516232c'
          'a44eb430bc0209b9f1e4d97353de6b3db12748bd'
          '5718008fd59182f828b65fde20d78559a700c5f5'
          'cf6f21fc4fc99c5b3ca5a065145619a3ed85960c'
          '04f713709af32d149b77216b6e1419289f57c971'
          '99a0e9ad9206c98b02602bc23dce78238e67399b'
          '87d2de4f04199a8dcd1c10cd3f31a7d8ddfd058b')

prepare() {
	cd "${srcdir}/binutils-${pkgver}"

  (cd "${srcdir}/binutils-${pkgver}" &&
    patch -p0 < "${srcdir}/30-binutils-2.17-avr-size.patch" &&
    patch -p0 < "${srcdir}/31-binutils-2.17-avr-coff.patch" &&
    patch -p0 < "${srcdir}/50-binutils-2.17-atmega256x.patch" &&
    patch -p0 < "${srcdir}/51-binutils-2.17-newdevices.patch" &&
    patch -p0 < "${srcdir}/dollarsign.patch" &&
    patch -p0 < "${srcdir}/makeinfo411.patch" &&
    patch -p0 < "${srcdir}/rfa1-newdevice.patch" &&
    patch -p0 < "${srcdir}/rfa1-size.patch" &&
    for patch in ${_patches[@]} ; do
      msg "Applying ${patch}"
      patch -p1 < "${srcdir}/${patch}"
    done)

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS" - credits to jck
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}


build() {
	cd "${srcdir}/binutils-${pkgver}"

  export MAKEINFO=${srcdir}/usr/bin/makeinfo

  install -d build
  cd build
  export CC="gcc -L$(pwd)/bfd/.libs/"

  if [ "${CARCH}" = "x86_64" ]; then
    ../configure --build=$(../config.guess) \
                 --disable-multilib \
                 --disable-nls \
                 --enable-64-bit-bfd \
                 --enable-install-libbfd \
                 --includedir=/usr/$(../config.guess)/include \
                 --infodir=/usr/share/info \
                 --libdir=/usr/lib \
                 --mandir=/usr/share/man \
                 --prefix=/usr \
                 --target=avr \
                 --disable-werror
  else
    ../configure --build=$(../config.guess) \
                 --disable-nls \
                 --enable-install-libbfd \
                 --includedir=/usr/$(../config.guess)/include \
                 --infodir=/usr/share/info \
                 --libdir=/usr/lib \
                 --mandir=/usr/share/man \
                 --prefix=/usr \
                 --target=avr \
                 --disable-werror
  fi

  # This checks the host environment and makes sure all the necessary tools are available to compile Binutils.
  make configure-host || return 1

  make tooldir=/usr || return 1
}

package() {
  cd ${srcdir}/binutils-${pkgver}

  cd build
  make DESTDIR=${pkgdir} tooldir=/usr install || return 1

  rm -f ${pkgdir}/usr/lib/libiberty.a

  for bin in addr2line ar as c++filt gprof ld nm objcopy objdump ranlib readelf size strings strip ; do
    rm -f ${pkgdir}/usr/bin/${bin} || return 1
  done

  for info in as bfd binutils configure ld standards; do
    mv ${pkgdir}/usr/share/info/${info}.info ${pkgdir}/usr/share/info/avr-${info}.info || return 1
  done
}

# vim:set ts=2 sw=2 et:
