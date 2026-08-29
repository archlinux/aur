# Maintainer: Célestin Matte aur [at] ploudseeker dot com
# Contributor: Tricia, `creyon` <gtcreyon@gmail.com>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=libtas
pkgver=1.4.8
pkgrel=4
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries"
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'ffmpeg' 'fontconfig' 'freetype2' 'hicolor-icon-theme'
         'lib32-libx11' 'lua' 'qt5-base' 'sdl2' 'xcb-util-cursor' 'zlib')
optdepends=('lib32-libtas: for 32-bit games support')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('8f65d0b4b88481ea05161f0ab67abc5eca0ceea100e57df1b0dd63d4ad346dcb4e3f3a87c10a5be8cb76ce8d843bc167bb708cfdd717fa6d97f4f0e2080ac435')

prepare() {
  cd libTAS-$pkgver

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done

  autoreconf -i
}

build() {
  cd "libTAS-$pkgver"

  aclocal
  autoconf
  autoheader
  automake --add-missing
  ./configure --prefix=/usr --enable-release-build --with-i386
  make
}

package() {
  cd "libTAS-$pkgver"

  make DESTDIR="$pkgdir/" install
}
