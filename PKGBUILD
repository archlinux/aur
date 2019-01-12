# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_author=tkashkin
_gitname=GameHub
_auxname=gamehub
pkgname=("${_auxname}-git")
pkgver=r344.1537eed
pkgrel=1
pkgdesc="All your games in one place. Games manager/downloader/library written in Vala designed for Pantheon Shell. Supports GOG, Steam and Humble Bundle"
arch=('i686' 'x86_64')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
depends=('gtk3' 'vala' 'granite'
         'file-roller' 'glib2' 'libmanette' 'libgee' 'libsoup' 'libxtst' 
         'libxml2' 'libx11' 'json-glib' 'sqlite' 'webkit2gtk')
optdepends=('lib32-json-glib')
makedepends=('git' 'meson' 'ninja')
provides=("${_auxname}")
conflicts=("${_auxname}")
source=("git+${url}.git#branch=dev")
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
    meson . _build --prefix=/usr --buildtype=debug -Ddistro=arch
    unset CFLAGS
	unset CXXFLAGS
	unset CPPFLAGS
    ninja -C _build
}

package() {
    cd "${_gitname}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}

