# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=portals
_author=elementary
_pkg=xdg-desktop-portal-pantheon
pkgname=("${_pkg}-git")
pkgver=r487.8e942fd
pkgrel=1
pkgdesc="A backend implementation for xdg-desktop-portal for the Pantheon desktop environment (the official elementary OS desktop environment)"
arch=('i686' 'x86_64')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
depends=('glib2' 'granite7' 'gtk4' 'vte4')
optdepends=()
makedepends=('git' 'meson>=0.58' 'ninja' 'vala>=0.56.1')
provides=("xdg-desktop-portal-impl" "${_pkg}" "${_pkg}-git")
conflicts=("xdg-desktop-portal-gnome" "xdg-desktop-portal-gtk" "${_pkg}")
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

