# Maintainer: James Bowling <kf5u AT pm DOT me>
#
# Upstream renamed the project from "WSJT-X Improved" to "WS - Digital Mode
# Suite" with the 2026-10 releases. The SourceForge project slug is unchanged
# (wsjt-x-improved), but everything else moved:
#   version directories:  WSJT-X_v3.2.0  ->  WS_v3.2.1
#   tarball names:        wsjtx-3.2.0_improved_PLUS_260908.tgz -> ws-3.2.1_261008.tgz
#   extracted directory:  wsjtx-3.2.0/   ->  ws-3.2.1/
#   inner tarball:        src/wsjtx.tgz (-> wsjtx/)  ->  src/ws.tgz (-> ws/)
# The inner CMake project and the installed binaries are still `wsjtx`, so
# provides/conflicts are unchanged and existing installs upgrade in place.
#
# This file is the structural source of truth kept in the wsjtx-improved
# Gitea repository. The CI workflow overlays it onto the AUR checkout and
# then runs scripts/update-pkgbuild.sh, which fills in _upstream/_build,
# the checksums, and pkgrel. Edit it here, not on the AUR.

pkgname=wsjtx-improved-widescreen
_pkgname=ws
_upstream=3.2.1
_build=260926
pkgver=${_upstream}.${_build}
pkgrel=1
pkgdesc="WS - Digital Mode Suite (formerly WSJT-X Improved) by DG2YCB - Amateur Radio weak-signal communication (FT8, JT9, JT65, ...) - Widescreen Layout Version"
arch=('i686' 'x86_64' 'aarch64')
url="https://sourceforge.net/projects/wsjt-x-improved/"
license=('GPL-3.0-or-later')

depends=(
	'boost-libs'
	'fftw'
	'hamlib>=4.5'
	'libusb'
	'portaudio'
	'qt5-base'
	'qt5-multimedia'
	'qt5-serialport'
	'qt5-tools'
	'qt5-websockets'
	'readline'
)

makedepends=(
	'cmake'
	'asciidoc'
	'asciidoctor'
	'boost'
	'gcc-fortran'
	'texinfo'
)

install=wsjtx-improved.install

provides=('wsjtx')
conflicts=('wsjtx')
source=("https://downloads.sourceforge.net/project/wsjt-x-improved/WS_v$_upstream/Source%20code/$_pkgname-${_upstream}_widescreen_${_build}.tgz")
md5sums=('f899724c2089da44ac26721c164be57d')
sha1sums=('2f5dd69dfe5f4c0a2c5372573d932faf2fc97679')

options=(!lto)

prepare() {
	# makepkg has already extracted the outer tarball to $srcdir/ws-$_upstream.
	# The real source lives in a nested tarball that extracts to ws/; unpack it
	# into a build prefix so we can run cmake against it directly instead of
	# going through upstream's superbuild (which would rebuild bundled hamlib).
	mkdir -p "$srcdir/$_pkgname-$_upstream/ws-prefix/build"
	cd "$srcdir/$_pkgname-$_upstream/ws-prefix"
	tar xzf "$srcdir/$_pkgname-$_upstream/src/ws.tgz"
}

build() {
	export CFLAGS+=" -Wno-error=format-security"
	export CXXFLAGS+=" -Wno-error=format-security"
	cd "$srcdir/$_pkgname-$_upstream/ws-prefix/build"
	cmake \
		-Wno-dev \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		../ws
	make
}

package() {
	cd "$srcdir/$_pkgname-$_upstream/ws-prefix/build"
	make DESTDIR="$pkgdir" install
	# Upstream's CMake now installs the whole sounds/ tree (with per-language
	# subdirectories) into the bindir. A directory under /usr/bin is wrong for
	# an Arch package; move it to /opt/wsjtx/sounds, which is where the
	# .install message has always told users to find it.
	if [ -d "$pkgdir/usr/bin/sounds" ]; then
		mkdir -p "$pkgdir/opt/wsjtx"
		mv "$pkgdir/usr/bin/sounds" "$pkgdir/opt/wsjtx/sounds"
	fi
	rm -rf "$pkgdir/home"
}
