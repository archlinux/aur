# Contributor: djsigmann <aur+djsigmann@protonmail.com>
# Maintainer: djsigmann <aur+djsigmann@protonmail.com>

# shellcheck disable=SC2164

_pkgname=casual-pre-loader

pkgname="${_pkgname}-git"
pkgver=1.7.2.42.g03c18b2
pkgrel=1

pkgdesc='TF2 particle modifications via some wizardry.'
arch=('x86_64')
url="https://github.com/cueki/casual-pre-loader"
license=('GPL-3.0-or-later' 'CC-BY-NC-ND-4.0')

depends=(
	'python>=3.11'
	'python-pyqt6>=6.8.0'
	'python-valve-parsers-git>=1.0.7'
	'python-requests>=2.32.5'
	'python-packaging>=25.0'
	'python-platformdirs'
	'python-pygithub>=2.8.1'
	'python-more-itertools>=10.8.0'
)
makedepends=('git' 'gendesk' 'sed')
optdepends=(
	'python-rich: pretty printing logs'
	'wine: running studiomdl'
)

install="${_pkgname}.install"

source=("git+${url}" 'git+https://github.com/cueki/studiomdl')
sha256sums=('SKIP' 'SKIP')

pkgver() {
	git -C "${_pkgname}" describe --tag --always | sed 's/^v//; s/-/./g'
}

prepare() {
	gendesk -n -f --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" --exec "${_pkgname}" --icon "${_pkgname}" --categories 'Utility' # generate desktop entry file

	cd "${_pkgname}"

	printf '%s\n' 'portable = False' >'core/are_we_portable.py' # notify the application that it cannot write to its own installation directory

	git submodule init
	git config submodule.studiomdl.url "${srcdir}/studiomdl"
	git -c protocol.file.allow=always submodule update

	git submodule update --init --recursive

	# must be sequential to avoid race condition
	git submodule foreach --recursive 'printf "%s\0" "${sm_path}" >&2' 3>&2 2>&1 1>&3 | xargs -0I{} find '{}' \( \
	-name .git \
	-o -name .gitignore \
	-o -name .gitattributes \
	-o -name .gitmodules \
	\) -print0 >.submodules
	xargs -0 rm -vr <.submodules
}

package() {
	install -Dm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/" # desktop entry file

	cd "${_pkgname}"

	# pre-create dirs that we don't `install -D` into
	mkdir -p \
		"${pkgdir}/usr/lib/${_pkgname}/" \
		"${pkgdir}/usr/bin/" \
		"${pkgdir}/usr/share/pixmaps/"

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
