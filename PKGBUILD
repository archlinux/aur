# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=youtube-music
pkgver=3.2.0
pkgrel=1
_electronversion=28
pkgdesc="YouTube Music Desktop App bundled with custom plugins (and built-in ad blocker / downloader)"
arch=('x86_64')
url="https://th-ch.github.io/youtube-music"
license=('MIT')
depends=("electron${_electronversion}" 'libsecret')
makedepends=('git' 'nodejs>=18.0.0' 'pnpm')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/th-ch/youtube-music/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('453535b4039f176aa1f2b6b4a229a8223dadeeacf35bf5dcf63ad890a60a8648'
            '33bd3c80a548d5180f4b294eb5d6aaa5116a3f1e5d96f1ea219739f62b0ce1e5'
            '07af59376e13e5dae2e7e38fa09d734a5147d5c344b3aed84c2f3afe22b8af79')

build() {
  cd "$pkgname-$pkgver"
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  export PNPM_HOME="$srcdir/pnpm-home"
  pnpm install
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
  install -Dm644 license -t "$pkgdir/usr/share/licenses/$pkgname"

  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm644 "assets/generated/icons/png/${i}x${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
}
