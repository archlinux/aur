# Maintainer: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>

_pkgname=godot
pkgname=${_pkgname}-git
pkgver=1.1.r1488.e9bbb97
pkgrel=1
pkgdesc="Godot Game Engine."
url="http://www.godotengine.org"
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('git' 'scons')
depends=('glu' 'libxcursor' 'alsa-lib' 'freetype2' 'mesa')
optdepends=()
conflicts=("godot")
provides=("godot")
_arch=''
if test "$CARCH" == x86_64; then
  _arch=('64')
else
  _arch=('32')
fi

source=(
	"git://github.com/okamstudio/${_pkgname}.git#branch=master"
	godot.desktop
	icon.png
)
sha256sums=(
	'SKIP'
	'd2f5ae30b8c0c3fd8a20a451d34e9e9d0ba1b60a39b1f68484a9a74227c83822'
	'b6bb8e42625414303cf7608f08fe63bd3267486bf7a96586ebab05ade5189785'
)


pkgver() {
    cd "${srcdir}/${_pkgname}"
    _major=$(cat version.py|grep "major" | sed 's/major=//')
    _minor=$(cat version.py|grep "minor" | sed 's/minor=//')
    _revision=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
    echo "${_major}.${_minor}.${_revision}"
    
}

build() {
    cd "${srcdir}"/${_pkgname}

    sed -n '/\/* Copyright/,/IN THE SOFTWARE./p' main/main.cpp | sed 's/\/\*//' | sed 's/\*\///' > LICENSE

    scons platform=x11 target=release_debug
}

package() {

    cd "${srcdir}"    

    install -Dm644 godot.desktop "${pkgdir}"/usr/share/applications/godot.desktop
    install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/godot.png
    
    cd "${srcdir}"/${_pkgname}

    install -D -m755 bin/godot.x11.opt.tools.${_arch} "${pkgdir}"/usr/bin/godot
    install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/godot-git/LICENSE
}

