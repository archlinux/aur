# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=joindesktop-git
pkgver=1.1.2.r2.ga4748ff
pkgrel=2
pkgdesc="An official desktop app for Join by Joaoapps built in Electron."
arch=('x86_64')
url="https://joaoapps.com/join/desktop"
license=('unknown')
depends=('electron')
makedepends=('git' 'npm')
optdepends=('libnotify: for native notifications')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/joaomgcd/JoinDesktop.git"
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '59746e474ebed1e32f93b2732da8d2d19fc47d53696c787142f672372606281f'
            'b6d1d5ce0e3e41b63924c4710fb73a7cb556ef1dccaad52f5b3d2d585d5a03fe')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  electronDist=/usr/lib/electron
  electronVer=$(sed s/^v// /usr/lib/electron/version)
  npm install --cache "$srcdir/npm-cache"
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
