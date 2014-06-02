# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=ecwolf
pkgver=1.3
pkgrel=1
pkgdesc='Advanced source port of "Wolfenstein 3D" and "Spear of Destiny" based on Wolf4SDL'
arch=('i686' 'x86_64')
url="http://maniacsvault.net/ecwolf"
license=('GPL' 'custom: ID')
depends=('sdl_mixer' 'libjpeg' 'gtk2')
makedepends=('cmake')
install=$pkgname.install
source=("http://maniacsvault.net/ecwolf/files/ecwolf/1.x/ecwolf-$pkgver-src.7z")
sha256sums=('d258195dd1d971a256f5c354be764d05e6f076d231d230f61ff258d853c01e66')

prepare() {
  # reset build folder
  rm -rf build
  mkdir build

  # data dir hack
  sed -e 's|OpenResourceFile(datawad|OpenResourceFile("/usr/share/ecwolf/ecwolf.pk3"|' \
    -e 's|Push(datawad|Push("/usr/share/ecwolf/ecwolf.pk3"|' \
    -e 's|/usr/local/share/games/wolf3d|/usr/share/ecwolf|' \
    -i ecwolf-$pkgver-src/src/wl_iwad.cpp
}

build() {
  cd build

  # build patch utility and enable gpl licensed opl emulator
  cmake ../ecwolf-$pkgver-src -DBUILD_PATCHUTIL=ON -DGPL=ON
  make
}

package() {
  cd build

  # binaries
  install -Dm755 ecwolf "$pkgdir"/usr/bin/ecwolf
  install -m755 tools/patchutil/patchutil "$pkgdir"/usr/bin/ecwolf-patchutil
  # data
  install -Dm644 ecwolf.pk3 "$pkgdir"/usr/share/ecwolf/ecwolf.pk3
  cd ../ecwolf-$pkgver-src
  # doc
  install -d "$pkgdir"/usr/share/doc/ecwolf
  install -Dm644 README.md docs/README.txt "$pkgdir"/usr/share/doc/ecwolf
  # license
  install -Dm644 docs/license-id.txt "$pkgdir"/usr/share/licenses/ecwolf/license-id.txt
}
