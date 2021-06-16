# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Frederic Bezies, Ronan Rabouin

pkgname=yamagi-quake2-rogue
pkgver=2.08
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Quake II - Mission Pack 2 ('Ground Zero') for yamagi-quake2"
url="http://www.yamagi.org/quake2/"
license=('GPL' 'custom')
depends=('sh' 'yamagi-quake2')
makedepends=('cmake' 'ninja')
install=$pkgname.install
source=("http://deponie.yamagi.org/quake2/${pkgname#*-}-$pkgver.tar.xz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('524b7f3b9399376cd22c8dd53403bef3e98e754b16154f2bd91d170b55b55920'
            '7d43bd0ca15a6c82560153deea1df1109d0a448b226e316b6b7b5daae256241a'
            'e7ee884b1e015743659cf668afa521976de64345872acf8e4c1e6932355c2959')

build() {
  rm -rf build
  cmake ${pkgname#*-}-$pkgver -Bbuild \
    -DCMAKE_BUILD_TYPE=Release \
    -GNinja
  cmake --build build
}

package() {
  # game library
  install -Dm644 build/Release/game.so "$pkgdir"/usr/lib/yamagi-quake2/rogue/game.so

  cd ${pkgname#*-}-$pkgver

  # game launcher
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname

  # doc
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README

  # desktop entry
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
