# Maintainer: Ruzsa Balazs <ruzsa.balazs@gmail.com>
pkgname=c64-debugger-git
pkgver=0.64.58.6.r63.f97772e
pkgrel=1
pkgdesc="Commodore 64, Atari XL/XE and NES debugger that works in real time"
arch=('x86_64' 'i686' 'pentium4')
url="https://sourceforge.net/projects/c64-debugger/"
license=('unknown')
makedepends=('git' 'gtk3' 'xcb-util' 'alsa-lib' 'upx')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!strip)
source=('c64-debugger::git+https://git.code.sf.net/p/c64-debugger/code')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	local src_version="$(sed -nre 's/^#define C64DEBUGGER_VERSION_STRING[[:space:]]+"([^"]+)"/\1/p' MTEngine/Games/c64/C64D_Version.h | tr '-' '_')"
	local git_version="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	echo "$src_version.r$git_version"
}

prepare() {
	cd "$srcdir/${pkgname%-git}/MTEngine"
	touch Games/Plugins/C64DebuggerPluginSpiral.h
	touch Games/Plugins/C64DebuggerPluginShowPic.h
	sed -i -re 's/^DEFINES[[:space:]]*=[[:space:]]*(.*)/DEFINES = \1 -DBYTE_ORDER=__BYTE_ORDER__ -DLITTLE_ENDIAN=__ORDER_LITTLE_ENDIAN__ -DBIG_ENDIAN=__ORDER_BIG_ENDIAN__/' Makefile
	sed -i -re 's/^CFLAGS[[:space:]]*=[[:space:]]*(.*)/CFLAGS = \1 -fcommon/' Makefile
	sed -i -re 's/^CXXFLAGS[[:space:]]*=[[:space:]]*(.*)/CXXFLAGS = \1 -std=c++14/' Makefile
}

build() {
	cd "$srcdir/${pkgname%-git}/MTEngine"
	make $MAKEFLAGS
}

package() {
	cd "$srcdir/${pkgname%-git}/MTEngine"
	/usr/bin/install -d "${pkgdir}/usr/bin"
	/usr/bin/install -d "${pkgdir}/usr/share/doc/${pkgname%-git}"
	/usr/bin/install -m 755 c64debugger "${pkgdir}/usr/bin"
	/usr/bin/install -m 644 Assets/*.txt "${pkgdir}/usr/share/doc/${pkgname%-git}"
	/usr/bin/install -m 644 Assets/*.pdf "${pkgdir}/usr/share/doc/${pkgname%-git}"
}
