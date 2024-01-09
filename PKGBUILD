# Maintainer: otaj <ota.jasek at proton dot me>

pkgname=gnome-shell-extension-todotxt
_pkgdir=todo-txt
pkgver=41
pkgrel=1
pkgdesc="Todo.txt GUI for gnome-shell"
arch=('any')
url="https://gitlab.com/bartl/todo-txt-gnome-shell-extension"
license=('GPL')
depends=('gnome-shell')
makedepends=('git' 'python' 'python-lxml' 'python-jsonschema' 'python-six' 'moreutils' 'glib2' 'jq')
source=("${_pkgdir}::git+${url}.git#tag=v${pkgver}")
sha512sums=('SKIP')

prepare() {
	cd "${_pkgdir}"
	sed -ie 's|\.\.|https://gitlab.com/bartl|g' .gitmodules
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/${_pkgdir}"
	python tools/json2schema.py
	python preferences/createPrefsTemplate.py
	glib-compile-schemas schemas
	jq '.version="'v${pkgver}'"' metadata.json | sponge metadata.json
}

package() {
	cd "${_pkgdir}"
	_extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
	_destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
	while IFS= read -r f; do
		if [ ! -d "$f" ]; then
			install -DTm 644 "$f" "${_destdir}/$f"
		fi
	done <tools/dist_files.lst
}
