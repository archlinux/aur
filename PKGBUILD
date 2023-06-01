# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=tasker-permissions-git
pkgver=0.2.0.r1.gce60661
pkgrel=2
_electronversion=24
pkgdesc="Utility to easily grant Tasker permissions"
arch=('x86_64')
url="https://github.com/joaomgcd/Tasker-Permissions"
license=('ISC')
depends=('android-tools' "electron${_electronversion}")
makedepends=('git' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/joaomgcd/Tasker-Permissions.git"
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '018509800d5dcf4b9030c5dff291355476715443b412127f2eca712d764334cb'
            '0951726ead4cda34ca772cbd2cd5f756b6acbace45aecab925653e1127bdb55c')

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
  install -d "$pkgdir/usr/lib/${pkgname%-git}/"
  cp -r dist/linux-unpacked/resources/ "$pkgdir/usr/lib/${pkgname%-git}/"

  # Use system ADB
  install -d "$pkgdir/usr/lib/${pkgname%-git}/bin/linux/"
  ln -s /usr/bin/adb "$pkgdir/usr/lib/${pkgname%-git}/bin/linux/"

  install -Dm644 adbpermissions.png "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"

  install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications/"
}
