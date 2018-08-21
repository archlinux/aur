# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>

gitname=webwatcher
author=kjlaw89
pkgname=("${gitname}-git")
pkgver=latest
pkgrel=1
pkgdesc="Know when your websites are misbehaving! An app designed for elementary OS"
arch=('i686' 'x86_64')
url="https://github.com/${author}/${gitname}"
license=('GPL3')
depends=('gtk3' 'vala' 'granite'
         'glib2' 'json-glib' 'libsoup' 'libappindicator-gtk3' 'libunity' 'sqlite')
optdepends=()
makedepends=('git' 'meson' 'ninja')
provides=("$_pkgname")
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
