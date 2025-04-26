# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=youtube-music
pkgver=3.9.0
pkgrel=1
_electronversion=35
pkgdesc="YouTube Music Desktop App bundled with custom plugins (and built-in ad blocker / downloader)"
arch=('x86_64')
url="https://th-ch.github.io/youtube-music"
license=('MIT')
depends=(
  "electron${_electronversion}"
  'libsecret'
)
makedepends=('pnpm')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/th-ch/youtube-music/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('2b4f457924005bd476861715ed3f3e1ab91ff8bbb6ee328425db74e5851da907'
            'e00aee0592b3b759fc055815c75326063348bcdf6e05b7632396592b05614637'
            '534337968b3443ff2911a951f8ec6a777cad22a270826dfbe61b0caf2741c654')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i "s|@ELECTRONVERSION@|${_electronversion}|" "$srcdir/$pkgname.sh"
}

build() {
  cd "$pkgname-$pkgver"
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  export PNPM_HOME="$srcdir/pnpm-home"
  pnpm install --frozen-lockfile
  pnpm clean
  pnpm build
  pnpm electron-builder --linux dir \
    ${dist} -c.electronDist=${electronDist} -c.electronVersion=${electronVer}
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 pack/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/$pkgname/"
  cp -r pack/linux-unpacked/resources/app.asar.unpacked "$pkgdir/usr/lib/$pkgname"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 license -t "$pkgdir/usr/share/licenses/$pkgname/"

  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm644 "assets/generated/icons/png/${i}x${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
}
