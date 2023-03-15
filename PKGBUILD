# Maintainer: Mark Wagie <mark.wagie at tutanota dot com>
pkgname=sticky-git
pkgver=1.14.r3.g2cb2742
pkgrel=1
pkgdesc="A sticky notes app for the Linux desktop"
arch=('any')
url="https://github.com/collinss/sticky"
license=('GPL2')
depends=('gtk3' 'gspell' 'python-gobject' 'python-xapp' 'xapps')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/collinss/sticky.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags --exclude master* | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  # Set version in About dialog
  sed -i "s/__DEB_VERSION__/${pkgver//+*/}/g" "usr/lib/${pkgname%-git}/${pkgname%-git}.py"

  # Fix license path
  sed -i 's|common-licenses/GPL|licenses/common/GPL/license.txt|g' \
    "usr/lib/${pkgname%-git}/${pkgname%-git}.py"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  cp -r etc usr "$pkgdir"
  chmod +x "$pkgdir/usr/bin/${pkgname%-git}"
}
