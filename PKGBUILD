# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: aspen <aspen@aspenuwu.me>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: AI5C <ai5c@ai5c.com>
# Contributor: kaptoxic <kaptoxic at yahoo dot com>
# Contributor: Matthew Avant <matthew dot avant at gmail dot com>
# Contributor: Rose Ames <rose at happyspork dot com>

pkgname=zulip-desktop-electron
pkgver=5.8.1
pkgrel=1
_electronversion=13
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
        "${pkgname%-*}.sh")
sha256sums=('870a3ccbae76ee8dba53b30cd00edc16e68fc2822a1d2dca0d955f6648353e7c'
            '5d7a8831cdef6686339bc6581ed750d90f804e5fb0bebe897feed0b8eefba702'
            'e03dbea7a85783012a59bdfe476ee4777c9970973f8f166e7596d613129b3d82')

build() {
  cd "${pkgname%-*}-$pkgver"
  electronDist="/usr/lib/electron$_electronversion"
  electronVer="$(sed s/^v// /usr/lib/electron$_electronversion/version)"
  HOME="$srcdir/.electron-gyp" npm install --cache "$srcdir/npm-cache" 
  ./node_modules/.bin/tsc
  ./node_modules/.bin/electron-builder --linux --x64 --dir \
    $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "${pkgname%-*}-$pkgver"
  install -Dm644 dist/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/${pkgname%-*}/resources/"
  install -Dm755 "$srcdir/${pkgname%-*}.sh" "$pkgdir/usr/bin/zulip"
  install -Dm644 "$srcdir/${pkgname%-*}.desktop" -t "$pkgdir/usr/share/applications/"

  for i in 16 24 32 48 64 96 128 256 512 1024; do
    install -Dm644 build/icons/${i}x${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/zulip.png"
  done
}
