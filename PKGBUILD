# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=youtube-music-git
pkgver=2.0.4.r1.ge9398ad
pkgrel=1
_electronversion=25
pkgdesc="YouTube Music Desktop App bundled with custom plugins (and built-in ad blocker / downloader)"
arch=('x86_64')
url="https://th-ch.github.io/youtube-music"
license=('MIT')
depends=("electron${_electronversion}" 'libsecret')
makedepends=('git' 'nodejs>=16.0.0' 'npm')
optdepends=('libnotify: desktop notifications')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=('git+https://github.com/th-ch/youtube-music.git'
        "${pkgname%-git}.sh"
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            '398b9f96ab02242efb994444110f1578a240e80fcf2f0347102cea4d1c46d570'
            '07af59376e13e5dae2e7e38fa09d734a5147d5c344b3aed84c2f3afe22b8af79')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  export npm_config_cache="$srcdir/npm_cache"
  npm install
  npm run clean
  npm run build
  HOME="$srcdir/.electron-gyp" ./node_modules/.bin/electron-builder --linux dir \
    $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm644 pack/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/${pkgname%-git}/"
  install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 license -t "$pkgdir/usr/share/licenses/${pkgname%-git}/"

  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm644 "assets/generated/icons/png/${i}x${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname%-git}.png"
  done
}
