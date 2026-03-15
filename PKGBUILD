# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Gadget3000 <gadget3000 at msn dot com>

pkgname=freesynd
_name=Freesynd
pkgver=0.9
pkgrel=1
pkgdesc="A free, cross-platform reimplementation of the classic Bullfrog game 'Syndicate'"
url="http://freesynd.sourceforge.net/"
license=('GPL-2.0-or-later')
arch=('x86_64')
makedepends=(cmake zlib doxygen git catch2 ninja cli11 crcpp utf8cpp)
depends=(sdl2 sdl2_image sdl2_mixer libpng libgcc libstdc++)
backup=(etc/freesynd/freesynd.ini)
install=$pkgname.install
#https://sourceforge.net/projects/freesynd/files/freesynd/freesynd-0.9/Freesynd-0.9-Source.zip/download
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname-$pkgver/$_name-$pkgver-Source.zip"
        FindCRCpp.cmake
        Findutf8cpp.cmake
)
sha512sums=('0dfd708ff20168df27fd4aec1bbd7c0105b39442ea884c5177714ae1d920f89848c369592edcf90ff4513465a63bce874dbe1979d400301f5257164e56750768'
            '23b75e983943419ca7ec56ac3da55ed170fccece2b457b5d9b06759409f68e8d89df8892a4060e625b15f8fa6d34384e804214d2460516c2e35230ca85041a0c'
            '32b07321045965bb89c527d486a3828c030b2c0985d2284e05aed25274a07c73b64dc205bfcab17745f792ef14a38eaddf316098bf800a1661b285274f4ca7c5')

prepare() {
  cp FindCRCpp.cmake $_name-$pkgver-Source/cmake/
  cp Findutf8cpp.cmake $_name-$pkgver-Source/cmake/
}

build() {
  CXXFLAGS+=' -Wno-format-security'
  cmake \
    -B _build \
    -S $_name-$pkgver-Source \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D USE_SYSTEM_SDL=ON \
    -Wno-dev
  ninja -C _build
}

package () {
  DESTDIR="$pkgdir" ninja -C _build install

  # doc
  mv "$pkgdir"/usr/share/doc/$_name "$pkgdir"/usr/share/doc/$pkgname
  cd $_name-$pkgver-Source
  install -m644 AUTHORS INSTALL README "$pkgdir"/usr/share/doc/$pkgname
}
