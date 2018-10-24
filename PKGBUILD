# Maintainer: Håvard Pettersson <mail@haavard.me>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>

pkgname=etcher
pkgver=1.4.5
pkgrel=1
pkgdesc='Burn images to SD cards & USB drives, safe & easy'
arch=(x86_64)
url='https://www.etcher.io/'
license=(apache)
depends=(electron gtk2 libxtst libxss gconf nss alsa-lib)
makedepends=(npm python2 git)
optdepends=('libnotify: for notifications'
            'speech-dispatcher: for text-to-speech')
options=('!strip')
source=("https://github.com/resin-io/$pkgname/archive/v$pkgver.tar.gz"
        'etcher-electron'
        'etcher-electron.desktop')
sha256sums=('82122253333b3bf5dc6f8909a5877a3218a2e677aff09159e5a4819be9e0edb9'
            'a64f79fe894c4828b515844703b1795448a4818a654f5d42d4f567f4d80998d1'
            '89291532fb6e6c5555b43d61c9ba3df103bca0eace040483884b86fd30dca3e4')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's/python$/python2/' scripts/build/dependencies-npm.sh
}

build() {
  cd "$pkgname-$pkgver"

  export PATH="$(pwd)/node_modules/.bin:$PATH"
  ./scripts/build/dependencies-npm.sh \
    -s linux \
    -r x64 \
    -t electron \
    -v "$(pacman -Q electron | sed 's/.\+ \(.\+\)-.\+/\1/')"
  webpack
  npm prune --production
}

package() {
  cd "$pkgname-$pkgver"

  _appdir="$pkgdir"/usr/share/$pkgname
  install -d "$_appdir"

  install package.json "$_appdir"
  cp -a {lib,build,generated,node_modules} "$_appdir"
  install -D assets/icon.png "$_appdir"/assets/icon.png
  install -D lib/gui/app/index.html "$_appdir"/lib/gui/app/index.html

  install -Dm755 "$srcdir"/etcher-electron "$pkgdir"/usr/bin/etcher-electron
  install -Dm644 "$srcdir"/etcher-electron.desktop \
    "$pkgdir"/usr/share/applications/etcher-electron.desktop

  for size in 16x16 32x32 48x48 128x128 256x256 512x512; do
    install -Dm644 assets/iconset/$size.png \
      "$pkgdir"/usr/share/icons/hicolor/$size/apps/etcher-electron.png
  done
}

# vim:set ts=2 sw=2 et:
