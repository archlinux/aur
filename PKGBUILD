# Maintainer: Your Name <youremail@domain.com>

pkgname=atoms-git
_pkgname=Atoms
pkgver=r115.05c7d96
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/mirkobrombin/Atoms"
license=('GPL3')
depends=('libadwaita-git' 'proot' 'python-certifi' 'python-chardet' 'python-idna' 'python-orjson' 'python-requests' 'python-uproot' 'python-urllib3' 'talloc' 'vte4')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "${_pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
