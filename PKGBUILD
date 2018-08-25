# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: xw258
# Contributor: genesis66

pkgname=lib32-fltk
_pkgver=1.3.4-2
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Graphical user interface toolkit for X (32-bit)"
arch=('x86_64')
url="http://www.fltk.org"
license=('custom:LGPL')
depends=("${pkgname#lib32-}" 'lib32-glu' 'lib32-libjpeg-turbo' 'lib32-libxcursor' 'lib32-libxinerama' 'lib32-libxft')
makedepends=('lib32-alsa-lib' 'libxft')
source=("http://fltk.org/pub/${pkgname#lib32-}/${_pkgver%"-2"}/${pkgname#lib32-}-${_pkgver}-source.tar.gz"
        "${pkgname#lib32-}-config-dynlibs.patch"
        "${pkgname#lib32-}-libpng.patch"
        "${pkgname#lib32-}-pkgconf.patch")
sha512sums=('cc169449b71ca966b2043ceedc55e92220ccb6be07b0ac54eeec36bbed5d60e2f59c6faba2403b5292b9120f5255227880a066d98ac82e57d502522bc627fd4d'
            'c2f15a5c134a258082454dacf8db14b4d276c8c9ed207b1d2275690a2829272cfee81186caf794031339f7ed619898485bd59c6d59d2e71cd98facfbb564c1f5'
            'e8e9b79936a09c333ce915a6215753878b6ac8a9800fd2b042e420c266ed1a05fa804eeb70a4fac6ee62ae94e2f24a7a08c4eea0767344524870d558ca1ffc02'
            '68c42be32141de7a3014b3f4f180b80feae02af33a5345e9cd9000042b9887037f34f08cc74b7a771f66db668613638650c6153c8a7b2471158bec6ec203af35')

prepare() {
  cd "${pkgname#lib32-}-${_pkgver}"
  # Fix broken removal of static linking: https://bugs.archlinux.org/task/38276
  patch -p1 -i "../${pkgname#lib32-}-config-dynlibs.patch"
  # Fix search for header of libpng
  patch -p1 -i "../${pkgname#lib32-}-libpng.patch"
  # Fix dead call to freetype-config by replacing it with call to pkgconf
  patch -p1 -i "../${pkgname#lib32-}-pkgconf.patch"
  sed -e 's/class Fl_XFont_On_Demand/class FL_EXPORT Fl_XFont_On_Demand/' \
      -i FL/x.H
  sed -e 's/x-fluid.desktop/fluid.desktop/' \
      -i fluid/Makefile
  sed -e 's/$(LINKFLTK)/$(LINKSHARED)/' \
      -e 's/$(LINKFLTKIMG)/$(LINKSHARED)/' \
      -i test/Makefile
  ./autogen.sh
}

build() {
  # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  cd "${pkgname#lib32-}-${_pkgver}"
  ./configure \
    --build=i686-pc-linux-gnu \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --libexecdir=/usr/lib32/fltk \
    --enable-threads \
    --enable-xft \
    --enable-shared
  make
}

package() {
  cd "${pkgname#lib32-}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" -C fluid install install-linux
  chmod 644 "${pkgdir}"/usr/lib32/*.a
  rm -rf "${pkgdir}/usr/"{bin,include,share}
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
