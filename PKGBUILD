# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=wingpanel-indicator-privacy
_author=elementary
_pkgname=("${_gitname}-stable")
pkgname=("${_pkgname}-git")
pkgver=r132.3a53a9c
pkgrel=1
pkgdesc="The Privacy indicator watches for usage of the camera or location services and displays a tattle-taling camera and/or location icon in the panel when they are being used. This package uses wingpanel and granite in stable versions"
arch=('any')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
groups=('pantheon-stable')
depends=('bamf' 'glib2' 'glibc' 'granite' 'gtk3' 'libgee' 'libgtop' 'lsof' 'wingpanel')
makedepends=('git' 'meson' 'vala>=0.40.3-1')
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
