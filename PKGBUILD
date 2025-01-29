# Maintainer: LS-Shandong < ls-shandong at outlook dot com>

pkgname=gprofng-gui-git
pkgver=r83.b6191f4
pkgrel=1
pkgdesc="a graphical tool to create, view, or both create as well as view, gprofng performance experiments."
arch=('any')
url="https://www.gnu.org/software/${pkgname}/"
license=('GPL3')
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
  tar -czvf gprofng-gui.info.tar.gz doc/gprofng-gui.info
}

package() {
  cd "$srcdir"/${pkgname%-git}/
  make DESTDIR="$pkgdir" install
  install -Dm644 gprofng-gui.info.tar.gz "$pkgdir/usr/share/info/gprofng-gui.info.tar.gz"
  rm -rf "$pkgdir"/bin
}
