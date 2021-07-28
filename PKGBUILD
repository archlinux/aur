# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=tasker-permissions-git
pkgver=0.0.1.r3.g5528ae3
pkgrel=1
pkgdesc="Utility to easily grant Tasker permissions"
arch=('x86_64')
url="https://github.com/joaomgcd/Tasker-Permissions"
license=('ISC')
depends=('android-tools' 'electron')
makedepends=('git' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/joaomgcd/Tasker-Permissions.git"
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '018509800d5dcf4b9030c5dff291355476715443b412127f2eca712d764334cb'
            '4e0f3cab603bbf5ac519e86dcf193242d05afdd317ce960ba60e2f5ad10803fa')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  npm install --cache "$srcdir/npm-cache"
  npm run pack
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/lib/${pkgname%-git}"
  cp -r dist/linux-unpacked/resources "$pkgdir/usr/lib/${pkgname%-git}"

  # Use system ADB
  install -d "$pkgdir/usr/lib/${pkgname%-git}/bin/linux"
  ln -s /usr/bin/adb "$pkgdir/usr/lib/${pkgname%-git}/bin/linux"

  install -Dm644 adbpermissions.png "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"

  install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}
