# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=webapp-manager-git
pkgver=1.2.8.r4.g4895615
pkgrel=1
pkgdesc="Run websites as if they were apps."
arch=('any')
url="https://github.com/linuxmint/webapp-manager"
license=('GPL')
depends=('python-beautifulsoup4' 'python-configobj' 'python-gobject' 'python-pillow'
         'python-setproctitle' 'python-tldextract' 'dconf' 'xapp')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/linuxmint/webapp-manager.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags --exclude master* | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  # Fix license path
  sed -i 's/common-licenses\/GPL/licenses\/common\/GPL\/license.txt/g' \
    "usr/lib/${pkgname%-git}/${pkgname%-git}.py"

  # Set version in About dialog
  sed -i "s/__DEB_VERSION__/${pkgver%.r*}/g" \
    "usr/lib/${pkgname%-git}/${pkgname%-git}.py"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make buildmo
}

package() {
  cd "$srcdir/${pkgname%-git}"
  cp -r etc usr "$pkgdir"
}
