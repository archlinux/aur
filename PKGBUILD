# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=beaker-browser
_pkgname=beaker
pkgver=0.7.10
pkgrel=1
pkgdesc="Peer-to-peer web browser with tools to create and host websites"
arch=(x86_64)
url="https://github.com/beakerbrowser/beaker"
license=(MIT)
depends=(electron)
makedepends=(git npm python2)
options=(!strip)
source=($_pkgname-$pkgver.tar.gz::https://github.com/beakerbrowser/$_pkgname/archive/$pkgver.tar.gz
        $_pkgname.sh
        $_pkgname.desktop)
sha256sums=('0ab22342a0727e2ccba8ad712956be5526f454a3e6df309b9c4bb9eb1f23e4b8'
            '23ea9820de249cb65d319e943d200940d929a3c8261b5d978848ddc44554728f'
            'f6ac7e3d7d8d729afc32b804bab9b6f1b5ae0f0b8d350c17c8f6efba222b6165')

build() {
  cd $_pkgname-$pkgver
  npm install

  rm -r app/node_modules/*-native/prebuilds
  sed -i "s|--target=[^ ]* |--target=$(</usr/lib/electron/version) |" tasks/rebuild.js
  sed -i 's/python/python2/' app/node_modules/sqlite3/deps/sqlite3.gyp
  npm run rebuild
}

package() {
  mkdir -p "$pkgdir"/usr/{lib,share/pixmaps}
  cp -r $_pkgname-$pkgver/app "$pkgdir/usr/lib/$_pkgname"
  ln -s ../../lib/$_pkgname/assets/img/logo.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  sed -n '/## License/,$p' $_pkgname-$pkgver/README.md > "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  # Clean up
  find "$pkgdir/usr/lib/$_pkgname/node_modules" \
      -name "package.json" \
        -exec sed -e "s|$srcdir/$_pkgname|/usr/lib/$_pkgname|" \
            -i {} \; \
      -or -name ".*" -prune -exec rm -r '{}' \; \
      -or -name "*.gyp" -prune -exec rm -r '{}' \; \
      -or -name "*.gypi" -prune -exec rm -r '{}' \; \
      -or -name "*.mk" -prune -exec rm -r '{}' \; \
      -or -name "*Makefile" -prune -exec rm -r '{}' \; \
      -or -name "bin" -prune -exec rm -r '{}' \; \
      -or -name "deps" -prune -exec rm -r '{}' \; \
      -or -name "doc" -prune -exec rm -r '{}' \; \
      -or -name "example" -prune -exec rm -r '{}' \; \
      -or -name "man" -prune -exec rm -r '{}' \; \
      -or -name "nan" -prune -exec rm -r '{}' \; \
      -or -name "obj.target" -prune -exec rm -r '{}' \; \
      -or -name "script" -prune -exec rm -r '{}' \; \
      -or -name "test" -prune -exec rm -r '{}' \; \
      -or -name "tmp" -prune -exec rm -r '{}' \;
}
