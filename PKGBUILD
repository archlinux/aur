# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=Locksmith
_author=ChristopherNugent
_pkgname=locksmith
pkgname=("${_pkgname}-git")
pkgver=r128.aa677b5
pkgrel=4
pkgdesc="A simple password generator applet. Designed for Pantheon Shell"
arch=('i686' 'x86_64')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
depends=('gtk3' 'granite' 'libgee')
optdepends=('')
makedepends=('git' 'meson' 'vala<0.46.0-1' 'debhelper')
provides=("${_pkgname}" "${pkgname}")
conflicts=("${_pkgname}" "vala-git")
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

