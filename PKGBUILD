# Maintainer: Integral <integral@murena.io>

pkgname=xopcodecalc-git
_pkgname="${pkgname%-git}"
_srcname="XOpcodeCalc"
pkgver=0.05.r305.g3db8f9e
pkgrel=2
pkgdesc="x86/x64 Assembly Opcode calculator."
arch=('x86_64')
url='https://horsicq.github.io/'
license=('MIT')
provides=('xopcodecalc')
conflicts=('xopcodecalc')
depends=('freetype2' 'glib2' 'glibc' 'graphite' 'icu' 'krb5' 'qt5-base' 'qt5-svg' 'systemd-libs')
makedepends=('coreutils' 'git' 'imagemagick' 'qt5-tools')
source=(
	"git+https://github.com/horsicq/${_srcname}"
	"git+https://github.com/horsicq/XOptions"
	"git+https://github.com/horsicq/build_tools"
	"git+https://github.com/horsicq/XAboutWidget"
	"git+https://github.com/horsicq/XUpdate"
	"git+https://github.com/horsicq/XGithub"
)
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
_stop='\e[m'
_color="\e[33m"
_bold='\e[1m'
_prefix=" ${_bold}${_color}==>${_stop} "

pkgver() {
	cd "${_srcname}/"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${_srcname}/"
	git submodule update --init --recursive
	git config submodule.XOptions.url XOptions
	git config submodule.build_tools.url build_tools
	git config submodule.XAboutWidget.url XAboutWidget
	git config submodule.XUpdate.url XUpdate
	git config submodule.XGithub.url XGithub
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "${_srcname}/" || return
	echo -e "${_prefix}Building xopcodecalc"

	_subdirs="gui_source"

	# [DEPRECATED] FIXME UPSTREAM: -Werror=format-security is causing build errors (merged upstream)
	#export CFLAGS+=" -Wno-format-security"
	#export CXXFLAGS+=" -Wno-format-security"

	for _subdir in ${_subdirs}; do
		pushd "${_subdir}" || return
		echo -e "${_prefix}${_prefix}Building ${_subdir}"
		qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" "${_subdir}.pro"
		make -f Makefile clean
		make -f Makefile
		popd || return
	done
}

package() {
	cd "${_srcname}/" || return

	echo -e "${_prefix}Creating the package base"
	install -d ${pkgdir}/{opt/${_pkgname},usr/bin,usr/share/pixmaps}
	install -d "${pkgdir}/opt/${_pkgname}/images"

	echo -e "${_prefix}Copying the package binaries"
	install -Dm755 build/release/xocalc -t "${pkgdir}/opt/${_pkgname}/"

	echo -e "${_prefix}Copying the package files"
	cp -r images/* "${pkgdir}/opt/${_pkgname}/images/"

	echo -e "${_prefix}Setting up /usr/bin launchers"
	ln -s "/opt/${_pkgname}/xocalc" "${pkgdir}/usr/bin/xocalc"

	echo -e "${_prefix}Setting up desktop icon"
	install -Dm644 LINUX/hicolor/48x48/apps/xopcodecalc.png -t "${pkgdir}/usr/share/pixmaps/"

	echo -e "${_prefix}Setting up desktop shortcuts"
	install -Dm644 LINUX/xocalc.desktop -t "${pkgdir}/usr/share/applications/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
