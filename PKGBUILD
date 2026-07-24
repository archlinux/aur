# Maintainer: djsigmann <aur+djsigmann@protonmail.com>

# shellcheck disable=SC2164

pkgver=2.2.4.r6.g8445d99
pkgrel=1

_pkgname=casual-pre-loader
pkgname="${_pkgname}-git"

pkgdesc='TF2 particle modifications via some wizardry.'
arch=('x86_64')
url="https://github.com/cueki/casual-pre-loader"
license=('GPL-3.0-or-later' 'CC-BY-NC-ND-4.0')

depends=(
	'hicolor-icon-theme'
	'python>=3.11'
	'python-more-itertools>=11.1.0' 'python-more-itertools<12.0.0'
	'python-packaging>=26.2' 'python-packaging<27'
	'python-platformdirs>=4.11' 'python-platformdirs<5'
	'python-pygithub>=2.9.0' 'python-pygithub<3'
	'python-pyqt6>=6.11' 'python-pyqt6<7'
	'python-requests>=2.34' 'python-requests<3'
	'python-valve-parsers>=1.2.2'
)
makedepends=(
	'gendesk'
	'git'
	'sed'
)
optdepends=(
	'python-rich: pretty printing logs'
	'wine: running studiomdl'
)

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

install="${_pkgname}.install"

source=(
	"git+${url}"
	'git+https://github.com/cueki/studiomdl'
)
sha256sums=(
	'SKIP'
	'SKIP'
)

pkgver() {
	git -C "${_pkgname}" describe --tags --long --abbrev=7 --first-parent --match 'v[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
	git submodule foreach --recursive 'printf "%s\0" "${sm_path}" >&2' 3>&2 2>&1 1>&3 |
		xargs -0I{} find '{}' \( \
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
		"${pkgdir}/usr/share/icons/hicolor/scalable/apps"

	# all other files and directories needed to run
	cp -a \
		main.py \
		backup/ \
		core/ \
		data/ \
		gui/ \
		"${pkgdir}/usr/lib/${_pkgname}/"

	ln -sr "${pkgdir}/usr/lib/${_pkgname}/main.py" "${pkgdir}/usr/bin/${_pkgname}"                                                    # symlink the main.py file into the PATH as "${_pkgname}"
	ln -sr "${pkgdir}/usr/lib/${_pkgname}/gui/icons/cueki_icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg" # symlink the icon file into the correct location

	install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE" # license
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"    # docs
}
