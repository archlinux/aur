# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=joindesktop-git
pkgver=1.1.2.r2.ga4748ff
pkgrel=3
_electronversion=24
pkgdesc="An official desktop app for Join by Joaoapps built in Electron."
arch=('x86_64')
url="https://joaoapps.com/join/desktop"
license=('unknown')
depends=("electron${_electronversion}")
makedepends=('git' 'npm')
optdepends=('libnotify: for native notifications')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/joaomgcd/JoinDesktop.git"
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '59746e474ebed1e32f93b2732da8d2d19fc47d53696c787142f672372606281f'
            'a8efe0f6729d8fbbf0e0352215e56a87d43d861402f3b38754fe03d0b8f6b900')

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
  ./node_modules/.bin/electron-builder build --dir \
    $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/lib/${pkgname%-git}"
  cp -r dist/linux-unpacked/resources "$pkgdir/usr/lib/${pkgname%-git}"

  install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 images/join.png "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
}
