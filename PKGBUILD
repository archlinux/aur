# Maintainer: djsigmann <aur+djsigmann@protonmail.com>

# shellcheck disable=SC2164

_pkgname=casual-pre-loader

pkgname="${_pkgname}-git"
pkgver=1.7.0.12.g6d7ef6d
pkgrel=1

pkgdesc='TF2 particle modifications via some wizardry.'
arch=('x86_64')
url="https://github.com/cueki/casual-pre-loader"
license=('GPL-3.0-or-later' 'CC-BY-NC-ND-4.0')

depends=('python>=3.11' 'python-pyqt6>=6.8.0' 'python-valve-parsers-git>=1.0.7' 'python-requests>=2.32.5' 'python-packaging>=25.0' 'python-platformdirs')
makedepends=('git' 'gendesk' 'sed')

install="${_pkgname}.install"

source=("git+${url}" 'git+https://github.com/cueki/studiomdl')
sha256sums=('SKIP' 'SKIP')

prepare() {
	gendesk -n -f --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" --exec "${_pkgname}" --icon "${_pkgname}" --categories 'Utility' # generate desktop entry file

	cd "${_pkgname}"

	printf '%s\n' 'portable = False' >'core/are_we_portable.py' # notify the application that it cannot write to its own installation directory

	git submodule init
	git config submodule.studiomdl.url "${srcdir}/studiomdl"
	git -c protocol.file.allow=always submodule update

	git submodule update --init --recursive
}

pkgver() {
	git -C "${_pkgname}" describe --tag --always | sed 's/^v//; s/-/./g'
}

package() {
	install -Dm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/" # desktop entry file

	cd "${_pkgname}"

	mkdir -p "${pkgdir}/usr"/{bin,share/pixmaps,"lib/${_pkgname}"}/ # pre-create dirs that we don't `install -D` into

	# all other files and directories needed to run
	cp -a \
		main.py \
		backup/ \
		core/ \
		data/ \
		gui/ \
		"${pkgdir}/usr/lib/${_pkgname}/"

	ln -sr "${pkgdir}/usr/lib/${_pkgname}/main.py" "${pkgdir}/usr/bin/${_pkgname}"                                # symlink the main.py file into the PATH as "${_pkgname}"
	ln -sr "${pkgdir}/usr/lib/${_pkgname}/gui/icons/cueki_icon.svg" "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg" # symlink the icon file into the correct location

	install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE" # license
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"    # docs
}
