# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: xw258
# Contributor: genesis66

pkgname=lib32-fltk
pkgver=1.3.4
pkgrel=1
pkgdesc="Graphical user interface toolkit for X (32-bit)"
arch=('x86_64')
url="http://www.fltk.org"
license=('LGPL')
depends=("${pkgname#lib32-}" 'lib32-gcc-libs' 'lib32-glu' 'lib32-libjpeg-turbo' 'lib32-libpng' 'lib32-libxcursor' 'lib32-libxinerama' 'lib32-libxft')
makedepends=('gcc-multilib')
source=("http://fltk.org/pub/${pkgname#lib32-}/${pkgver}/${pkgname#lib32-}-${pkgver}-source.tar.gz"
        "fltk-config-dynlibs.patch")
sha512sums=('92c236e426ad9b2a2954a6fc401bc9bf4c4c46d47b08f8c9b879da6031ac158ef9b944f28a8bea64d18072d1af8ceaa09c00abebd745fb76dd628636424446c2'
            'c2f15a5c134a258082454dacf8db14b4d276c8c9ed207b1d2275690a2829272cfee81186caf794031339f7ed619898485bd59c6d59d2e71cd98facfbb564c1f5')

prepare() {
  cd "${pkgname#lib32-}-${pkgver}"
  patch -Np1 -i ${srcdir}/fltk-config-dynlibs.patch
  sed -i 's/class Fl_XFont_On_Demand/class FL_EXPORT Fl_XFont_On_Demand/' FL/x.H
  sed -i 's/x-fluid.desktop/fluid.desktop/' -i fluid/Makefile
}

build() {
  # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  cd "${pkgname#lib32-}-${pkgver}"
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
  cd "${pkgname#lib32-}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" -C fluid install install-linux
  chmod 644 "${pkgdir}"/usr/lib32/*.a
  rm -rf "${pkgdir}/usr/"{bin,include,share}
}
