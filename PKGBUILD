# Maintainer:Integral<luckys68@126.com>
pkgname=xopcodecalc-git
pkgver=0.05
pkgrel=1
pkgdesc="x86/x64 Assembly Opcode calculator."
arch=('x86_64')
url='https://horsicq.github.io/'
license=('MIT')
provides=('xopcodecalc')
conflicts=('xopcodecalc')
depends=('freetype2' 'glib2' 'glibc' 'graphite' 'icu' 'krb5' 'qt5-base' 'qt5-svg' 'systemd-libs')
makedepends=('coreutils' 'git' 'imagemagick' 'qt5-tools')
_srcname="XOpcodeCalc"
source=('git+https://github.com/horsicq/XOpcodeCalc')
sha512sums=('SKIP')
_pkgname="${pkgname/-git/}"
_stop='\e[m'
_color="\e[33m"
_bold='\e[1m'
_prefix=" ${_bold}${_color}==>${_stop} "

prepare() {
	cd "$srcdir/$_srcname"
	git submodule update --init --recursive
}

build() {
	cd "$_srcname" || return
	echo -e "${_prefix}Building xopcodecalc"

	_subdirs="gui_source"

	# [DEPRECATED] FIXME UPSTREAM: -Werror=format-security is causing build errors (merged upstream)
	#export CFLAGS+=" -Wno-format-security"
	#export CXXFLAGS+=" -Wno-format-security"

	for _subdir in $_subdirs; do
		pushd "$_subdir" || return
		echo -e "${_prefix}${_prefix}Building $_subdir"
		qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" "$_subdir.pro"
		make -f Makefile clean
		make -f Makefile
		popd || return
	done
}

package() {
	cd "$_srcname" || return

	echo -e "${_prefix}Creating the package base"
	install -d "$pkgdir"/{opt/"${_pkgname}",usr/bin,usr/share/pixmaps}
	install -d "$pkgdir/opt/${_pkgname}"/images

	echo -e "${_prefix}Copying the package binaries"
	install -Dm755 build/release/xocalc -t "$pkgdir"/opt/"${_pkgname}"

	echo -e "${_prefix}Copying the package files"
	cp -r images/* -t "$pkgdir"/opt/"${_pkgname}"/images/

	echo -e "${_prefix}Setting up /usr/bin launchers"
	ln -s /opt/"${_pkgname}"/xocalc "$pkgdir"/usr/bin/xocalc

	echo -e "${_prefix}Setting up desktop icon"
	install -Dm644 LINUX/hicolor/48x48/apps/xopcodecalc.png -t "$pkgdir"/usr/share/pixmaps

	echo -e "${_prefix}Setting up desktop shortcuts"
	install -Dm644 LINUX/xocalc.desktop -t "$pkgdir"/usr/share/applications
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
