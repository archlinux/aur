# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=wingpanel-indicator-a11y
_author=elementary
_pkgname=("${_gitname}-stable")
pkgname=("${_pkgname}-git")
pkgver=r13.b3009f5
pkgrel=1
pkgdesc="Universal Access indicator for Wingpanel. This package uses wingpanel and granite in stable versions"
arch=('any')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
groups=('pantheon-stable')
depends=('glib2' 'glibc' 'granite' 'gtk3' 'wingpanel')
makedepends=('git' 'meson' 'ninja' 'vala>=0.40.3-1')
provides=("${_gitname}" "${_pkgname}")
conflicts=("${_gitname}" "${_gitname}-git" "${_pkgname}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${_gitname}/"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${_gitname}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}
