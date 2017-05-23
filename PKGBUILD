# Maintainer: ABDULLATIF Mouhamadi <bourou01dev@gmail.com>

pkgname=gcc-avr-tinyos
pkgver=4.1.2
pkgrel=1
pkgdesc="The GNU avr Compiler Collection with TinyOS patches"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'custom')
url="http://gcc.gnu.org/"
depends=('binutils-avr-tinyos' 'gcc-libs' 'libmpc')
provides=('gcc-avr')
options=('staticlibs' '!ccache' '!distcc' '!emptydirs' '!libtool' '!strip')
source=("http://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
        "10-gcc-4.1.2-c-incpath.patch"
        "11-gcc-4.1.2-exec-prefix.patch"
        "20-gcc-4.1.2-libiberty-Makefile.in.patch"
        "30-gcc-4.1.2-binary-constants.patch"
        "31-gcc-4.1.2-isr-alias.patch"
        "40-gcc-4.1.2-bug-28902.patch"
        "42-gcc-4.1.2-bug-31137.patch"
        "43-gcc-4.1.2-bug-19087.patch"
        "44-gcc-4.1.2-bug-30289.patch"
        "45-gcc-4.1.2-bug-18989.patch"
        "46-gcc-4.1.2-bug-30483.patch"
        "50-gcc-4.1.2-newdevices.patch"
        "51-gcc-4.1.2-atmega256x.patch"
        "rfa1.patch")

md5sums=('a4a3eb15c96030906d8494959eeda23c'
          '61116f5b61b3bbec9af326fd3b460281'
          'a69568f43093e4fde729b562c46d5ba0' 
          '802a403cf49540df0e27c5aa8d00e749'
          '97f3b27945783b93c9e681e5d874c056' 
          'e70f0e54d7492f0e82813fe75764d356' 
          '2344927824632eaecb7176156b20c1c8' 
          '3442ea03c04e626088c51f31af3329cf' 
          '137de4bfd8b94c96ac546b8967964aa8' 
          'c3835d0d0229c0b2fb14d097afe19a16' 
          'e3e5916ce4a286e03ec6275035f19dfd' 
          '42a8f2a38f9570dba800a179b5d55b43' 
          '3f4fc9108b63ffa9ccda033ff139883a' 
          '5be152a40f9e27832590482f7cb5e5de' 
          'f068e5b046bcf07715306f38b1e3c9a2')

prepare() {

  cd "${srcdir}/gcc-${pkgver}"

  (cd "${srcdir}/gcc-${pkgver}" &&
    patch -p0 < "${srcdir}/10-gcc-4.1.2-c-incpath.patch" &&
    patch -p0 < "${srcdir}/11-gcc-4.1.2-exec-prefix.patch" &&
    patch -p0 < "${srcdir}/20-gcc-4.1.2-libiberty-Makefile.in.patch" &&
    patch -p0 < "${srcdir}/30-gcc-4.1.2-binary-constants.patch" &&
    patch -p0 < "${srcdir}/31-gcc-4.1.2-isr-alias.patch" &&
    patch -p0 < "${srcdir}/40-gcc-4.1.2-bug-28902.patch" &&
    patch -p0 < "${srcdir}/42-gcc-4.1.2-bug-31137.patch" &&
    patch -p0 < "${srcdir}/43-gcc-4.1.2-bug-19087.patch" &&
    patch -p0 < "${srcdir}/44-gcc-4.1.2-bug-30289.patch" &&
    patch -p0 < "${srcdir}/45-gcc-4.1.2-bug-18989.patch" &&
    patch -p0 < "${srcdir}/46-gcc-4.1.2-bug-30483.patch" &&
    patch -p0 < "${srcdir}/50-gcc-4.1.2-newdevices.patch" &&
    patch -p0 < "${srcdir}/51-gcc-4.1.2-atmega256x.patch" &&
    patch -p0 < "${srcdir}/rfa1.patch" &&
    for patch in ${_patches[@]} ; do
      msg "Applying ${patch}"
      patch -p1 < "${srcdir}/${patch}"
    done)

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS" - credits to jck

  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure
}

build() {
  export CFLAGS="-O2 -pipe"
  export CXXFLAGS="-O2 -pipe"

  # https://bugzilla.redhat.com/show_bug.cgi?id=476370
  export CC="gcc -fgnu89-inline"
  export CXX="g++ -fgnu89-inline"

  cd "${srcdir}/gcc-${pkgver}"

  export MAKEINFO=${srcdir}/usr/bin/makeinfo

  mkdir build
  cd build
  ../configure --disable-libssp \
               --disable-nls \
               --enable-languages=c,c++ \
               --infodir=/usr/share/info \
               --libdir=/usr/lib \
               --libexecdir=/usr/lib \
               --mandir=/usr/share/man \
               --prefix=/usr \
               --target=avr \
               --with-gnu-as \
               --with-gnu-ld \
               --with-as=/usr/bin/avr-as \
               --with-ld=/usr/bin/avr-ld

  make || return 1
}

package() {
  cd ${srcdir}/gcc-${pkgver}

  cd build
  make -j1 DESTDIR=${pkgdir} install || return 1

  rm -f ${pkgdir}/usr/lib/libiberty.a || return 1
  rm -rf ${pkgdir}/usr/share/man/man7 || return 1
  rm -rf ${pkgdir}/usr/share/info || return 1
}

# vim:set ts=2 sw=2 et:
