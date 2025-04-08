# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=tasker-permissions-git
pkgver=0.2.0.r4.g29860cb
pkgrel=3
_electronversion=34
pkgdesc="Utility to easily grant Tasker permissions"
arch=('x86_64')
url="https://github.com/joaomgcd/Tasker-Permissions"
license=('Apache-2.0')
depends=(
  'android-tools'
  "electron${_electronversion}"
)
makedepends=(
  'git'
  'npm'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/joaomgcd/Tasker-Permissions.git'
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '018509800d5dcf4b9030c5dff291355476715443b412127f2eca712d764334cb'
            'ef4aef82872934ce7872ad8d5695b5a8efd2e633bfd5c404ade04ce7309a6a85')

pkgver() {
  cd Tasker-Permissions
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd Tasker-Permissions
  export npm_config_cache="$srcdir/npm_cache"
  npm install

  sed -i "s|@ELECTRONVERSION@|${_electronversion}|" "$srcdir/${pkgname%-git}.sh"
}

build() {
  cd Tasker-Permissions
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  export npm_config_cache="$srcdir/npm_cache"
  npm exec -c "electron-builder build --dir \
    $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer"
}

package() {
  cd Tasker-Permissions
  install -Dm644 dist/linux-unpacked/resources/app.asar -t \
    "$pkgdir/usr/lib/${pkgname%-git}/resources/"

  # Use system ADB
  install -d "$pkgdir/usr/lib/${pkgname%-git}/bin/linux/"
  ln -s /usr/bin/adb "$pkgdir/usr/lib/${pkgname%-git}/bin/linux/"

  install -Dm644 adbpermissions.png "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"

  install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications/"
}
