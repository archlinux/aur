# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: Paulo Queiroz <pvaqueiroz@gmail.com>

_gitname=proton
_author=raggesilver-proton
_pkg=("${_gitname}-ide")
pkgname=("${_pkg}-git")
pkgver=r182.e6b754e
pkgrel=3
pkgdesc="A new IDE made with Vala."
arch=('i686' 'x86_64')
url="https://gitlab.com/${_author}/${_gitname}"
submodulesurl="https://gitlab.com/${_author}/proton"
license=('GPL3')
depends=('gtk3' 'granite' 'editorconfig-core-c' 'glib2' 'gtksourceview4' 'json-glib'
		'libdazzle' 'marble-gtk' 'vte3')
optdepends=('')
makedepends=('git' 'meson>=0.50.0' 'vala')
provides=("${_pkg}" "${pkgname}")
conflicts=("${_pkg}")
source=(
	"git+${url}.git"
	"git+${submodulesurl}-runner-plugin.git"
	"git+${submodulesurl}-editorconfig-plugin.git"
	"git+${submodulesurl}-autobracket-plugin.git"
	"git+${submodulesurl}-templates.git"
)
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "${_gitname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
	cd "${_gitname}/"
	
	git submodule init
	git config submodule.proton-runner-plugin.url $srcdir/proton-runner-plugin
	git submodule update

	git submodule init
	git config submodule.proton-editorconfig-plugin.url $srcdir/proton-editorconfig-plugin
	git submodule update

	git submodule init
	git config submodule.proton-autobracket-plugin.url $srcdir/proton-autobracket-plugin
	git submodule update

	git submodule init
	git config submodule.proton-templates.url $srcdir/proton-templates
	git submodule update	
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
