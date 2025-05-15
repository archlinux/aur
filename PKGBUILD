# Maintainer: djsigmann <aur+djsigmann@protonmail.com>

# shellcheck disable=SC2164

_pkgname=casual-pre-loader

pkgname="${_pkgname}-git"
pkgver=1.4.2.25.g0fd13a9
pkgrel=1

pkgdesc='TF2 particle modifications via some wizardry.'
arch=('x86_64')
url="https://github.com/cueki/${_pkgname}"
license=('GPL-3.0-or-later' 'CC-BY-NC-ND-4.0')

depends=('python>=3.11' 'python-pyqt6>=6.8.0' 'python-pillow>=11.1.0' 'python-pyxdg')
makedepends=('git' 'gendesk')

install="${_pkgname}.install"

source=("git+${url}")
sha256sums=('SKIP')

prepare() {
	gendesk -n -f --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" --exec "${_pkgname}" --icon "${_pkgname}" --categories 'Utility' # generate desktop entry file

	printf '%s\n' 'portable = False' >"${_pkgname}/core/are_we_portable.py" # notify the application that it cannot write to its own installation directory
}

pkgver() {
	cd "${_pkgname}"
	git describe --tag | sed 's/^v//; s/-/./g'
}

package() {
	install -Dm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/" # desktop entry file

	cd "${_pkgname}"

	mkdir -p "${pkgdir}/usr"/{bin,share/pixmaps,"lib/${_pkgname}"}/ # pre-create dirs that we don't `install -D` into

	# all other files and directories needed to run
	cp -a \
		main.py \
		mods.zip \
		mod_urls.json \
		particle_system_map.json \
		backup/ \
		core/ \
		gui/ \
		operations/ \
		quickprecache/ \
		vtfedit/ \
		"${pkgdir}/usr/lib/${_pkgname}/"

	ln -s "/usr/lib/${_pkgname}/main.py" "${pkgdir}/usr/bin/${_pkgname}"                          # symlink the main.py file into the PATH as "${_pkgname}"
	ln -s "/usr/lib/${_pkgname}/gui/cueki_icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png" # symlink the icon file into the correct location

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"          # license
	install -Dm644 {README.md,READ_THIS.txt} -t "${pkgdir}/usr/share/doc/${_pkgname}/" # docs
}
