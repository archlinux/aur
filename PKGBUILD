# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=webapp-manager-git
pkgver=1.3.4.r1.g3ae21d4
pkgrel=1
pkgdesc="Run websites as if they were apps."
arch=('any')
url="https://github.com/linuxmint/webapp-manager"
license=('GPL-3.0-or-later')
depends=(
  'dconf'
  'python-beautifulsoup4'
  'python-configobj'
  'python-gobject'
  'python-pillow'
  'python-setproctitle'
  'python-tldextract'
  'xapp'
)
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

  # Set version in About dialog
  sed -i "s/__DEB_VERSION__/$pkgver/g" \
    "usr/lib/${pkgname%-git}/${pkgname%-git}.py"

  # Fix license path
  sed -i 's|common-licenses/GPL|licenses/spdx/GPL-3.0-or-later.txt|g' \
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
