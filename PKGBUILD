# Maintainer: Martin Reboredo <yakoyoku@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: aspen <aspen@aspenuwu.me>
pkgname=zulip-desktop-electron
pkgver=5.9.3
pkgrel=2
_electronversion=18
pkgdesc="Real-time team chat based on the email threading model"
arch=('x86_64')
url="https://zulip.com"
license=('Apache')
depends=("electron$_electronversion" 'libxkbfile' 'libxss')
makedepends=('nodejs>=12.10.0' 'npm')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}-$pkgver.tar.gz::https://github.com/zulip/zulip-desktop/archive/v$pkgver.tar.gz"
        "${pkgname%-*}.desktop"
        "${pkgname%-*}.sh.in")
sha256sums=('2d5288204a0395ac2c9303678c4c0dcb852083e4806a1e4e885e096be5b6664c'
            '5d7a8831cdef6686339bc6581ed750d90f804e5fb0bebe897feed0b8eefba702'
            '70ed0f08158c6ea8ef99dbbe360861e2c63911c2fadc74c0154bd6567abc8979')

build() {
  cd "${pkgname%-*}-$pkgver"
  electronDist="/usr/lib/electron$_electronversion"
  electronVer="$(sed s/^v// $electronDist/version)"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  HOME="$srcdir/.electron-gyp" npm install --cache "$srcdir/npm-cache"
  ./node_modules/.bin/tsc
  ./node_modules/.bin/electron-builder --linux --x64 --dir \
    $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "${pkgname%-*}-$pkgver"
  sed "s/@@VERSION@@/$_electronversion/" "$srcdir/${pkgname%-*}.sh.in" > "${pkgname%-*}.sh"
  install -Dm644 dist/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/${pkgname%-*}/resources/"
  install -Dm755 "${pkgname%-*}.sh" "$pkgdir/usr/bin/zulip"
  install -Dm644 "$srcdir/${pkgname%-*}.desktop" -t "$pkgdir/usr/share/applications/"

  for i in 16 24 32 48 64 96 128 256 512 1024; do
    install -Dm644 build/icons/${i}x${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/zulip.png"
  done
}
