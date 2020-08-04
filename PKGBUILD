# Maintainer: Ivan Semkin <ivan at semkin dot ru>
# Contributor Colin Duquesnoy <colin.duquesnoy@gmail.com>
# Contributor ZeroDot1 <zerodot1@bk.ru>

pkgname=short-circuit-git
_pkgname=${pkgname%-git}
pkgver=r33.19e92c2
pkgrel=1
pkgdesc='A developer scratchpad built for GNOME.'
url='https://gitlab.gnome.org/Bharatkalluri/short-circuit'
license=('GPL3')
conflicts=(shortcircuit)
arch=('any')
makedepends=('git' 'meson')
depends=('dconf' 'hicolor-icon-theme' 'python')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"
  arch-meson build
  meson compile -C build
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="$pkgdir" meson install -C build
}
