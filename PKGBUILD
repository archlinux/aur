# Maintainer: LS-Shandong < ls-shandong at outlook dot com>

pkgname=gprofng-gui-git
pkgver=r83.b6191f4
pkgrel=2
pkgdesc="A graphical tool to create, view, or both create as well as view, gprofng performance experiments."
arch=('any')
url="https://www.gnu.org/software/${pkgname}/"
license=('GPL-3.0-or-later')
depends=('bash' 'java-runtime')
makedepends=('java-environment')
source=("${pkgname%-git}::git+https://git.savannah.gnu.org/git/gprofng-gui.git#commit=b6191f4bf139656398d8167103adba603eed80b0")
sha256sums=('SKIP')
provides=('gp-display-gui')
conflicts=('gprofng-gui')
pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}
build() {
  cd "$srcdir"/${pkgname%-git}/
  autoreconf -i -f
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/${pkgname%-git}/
  make DESTDIR="$pkgdir" install
}
