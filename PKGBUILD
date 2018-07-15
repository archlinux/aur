# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>

pkgname=aesop-git
gitname=aesop
pkgver=latest
pkgrel=1
pkgdesc="The simplest PDF viewer around designed for elementary OS"
arch=('i686' 'x86_64')
url="https://github.com/lainsce/aesop"
license=('GPL3')
depends=('gtk3' 'vala' 'granite' 'libsoup' 'json-glib')
optdepends=('lib32-json-glib')
makedepends=('git' 'meson' 'ninja')
provides=("$gitname")
conflicts=("$gitname")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${gitname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${gitname}/"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${gitname}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}

