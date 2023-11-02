# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor:

_gitname=meteo
_author=bitseater
pkgname=("${_gitname}-git")
pkgver=r358.e1960a1
pkgrel=1
pkgdesc="A forecast application using OpenWeatherMap API. App designed for Pantheon Shell"
arch=('i686' 'x86_64')
url="https://gitlab.com/${_author}/${_gitname}"
license=('GPL3')
depends=('glib2' 'gtk3' 'libappindicator-gtk3' 'libsoup' 'json-glib' 'webkit2gtk')
optdepends=('ayatana-indicator-application')
makedepends=('git' 'meson' 'ninja' 'vala')
provides=("${_gitname}" "${pkgname}")
conflicts=("${_gitname}")
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

