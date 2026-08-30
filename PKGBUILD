# Maintainer: djsigmann <aur+djsigmann@protonmail.com>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

# shellcheck disable=SC2164

pkgver=2.2.4.r33.gea64a47
pkgrel=2

_pkgname=casual-pre-loader
pkgname="${_pkgname}-git"

pkgdesc='TF2 particle modifications via some wizardry.'
arch=('x86_64')
url="https://github.com/cueki/casual-pre-loader"
license=('GPL-3.0-or-later' 'CC-BY-NC-ND-4.0')

depends=(
	'hicolor-icon-theme'
	'python>=3.12'
	'python-cappa>=0.32.2' 'python-cappa<1.0.0'
	'python-more-itertools>=11.1.0' 'python-more-itertools<12.0.0'
	'python-packaging>=26.2' 'python-packaging<27'
	'python-platformdirs>=4.11' 'python-platformdirs<5'
	'python-pygithub>=2.10.0' 'python-pygithub<3'
	'python-pyqt6>=6.11' 'python-pyqt6<7'
	'python-requests>=2.34' 'python-requests<3'
	'python-rich>=15.0' 'python-rich<16'
	'python-valve-parsers>=1.2.2'
)
makedepends=(
	'gendesk'
	'git'
	'sed'
)
optdepends=(
	'wine: running studiomdl'
)

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

install="${_pkgname}.install"

# TODO: Consider grabbing a tarball instead because cloning a repo is done with the `--mirror` flag.
# This causes git to grab ALL refs, and cannot be disabled without monkey-patching `makepkg` shell functions.
# Due to some poor past decisions, large zip files were put into the VCS, ballooning a mirror to around 500MB compared to 8.5 MB.
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
	# generate desktop entry file
	# NOTE: The `GameTool` category is not yet recognized by the latest release (0.28) of `desktop-file-utils` (added in 5fbfd9e),
	# but is valid according to the XDG Menu spec version 1.1.
	gendesk -n -f \
		--pkgname "${_pkgname}" --name "${_pkgname}" --exec "${_pkgname}" --icon "${_pkgname}" \
		--pkgdesc "${pkgdesc}" \
		--terminal false \
		--categories 'Utility;Game;Qt;GameTool'

	cd "${_pkgname}"

	touch .noportable # notify the application that it cannot write to its own installation directory

	git submodule init
	git config submodule.studiomdl.url "${srcdir}/studiomdl"
	git -c protocol.file.allow=always submodule update

	git submodule update --init --recursive

	# remove any VCS-related files from submodules after they've been initialized (./.git is NOT a directory in this case)
	# must be sequential to avoid race condition when recursively interating over submodules
	git submodule foreach --quiet --recursive 'printf "%s\0" "${sm_path}"' >../.submodules
	xargs -0I{} sh -c -e '
		printf "Entering '"'%s'"'\n" "${1}"
		cd "${1}"
		rm -fv .git .gitignore .gitattributes .gitmodules
	' sh '{}' <../.submodules
	rm ../.submodules
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
		.noportable \
		"${pkgdir}/usr/lib/${_pkgname}/"

	ln -sr "${pkgdir}/usr/lib/${_pkgname}/main.py" "${pkgdir}/usr/bin/${_pkgname}"                                                    # symlink the main.py file into the PATH as "${_pkgname}"
	ln -sr "${pkgdir}/usr/lib/${_pkgname}/gui/icons/cueki_icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg" # symlink the icon file into the correct location

	install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE" # license
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"    # docs
}
