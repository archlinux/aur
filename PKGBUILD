# Maintainer: Yossef Sabry <yossefsabry66@gmail.com>
pkgname=csong-git
pkgver=r45.703b6ce
pkgrel=1
pkgdesc="Lyrics viewer for MPD/ncmpcpp with terminal, X11, and Wayland backends"
arch=('x86_64')
url="https://github.com/yossefsabry/csong"
license=('MIT')
depends=('libmpdclient' 'curl' 'fribidi' 'dbus' 'libx11' 'libxft' 'libxfixes' 'libxrender' 'libxext' 'fontconfig' 'freetype2' 'wayland' 'pango' 'cairo')
makedepends=('git')
provides=('csong')
conflicts=('csong')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/csong"
	local ver
	local pkgext
	local pkgdest
	local pkgfile
	ver=$(git describe --long --tags 2>/dev/null || true)
	if [[ -n "$ver" ]]; then
		ver=$(printf "%s" "$ver" | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
	else
		ver="r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	fi
	pkgext="${PKGEXT:-.pkg.tar.zst}"
	pkgdest="${PKGDEST:-$startdir}"
	pkgfile="${pkgname}-${ver}-${pkgrel}-${arch}${pkgext}"
	if [[ -f "$pkgdest/$pkgfile" ]]; then
		rm -f "$pkgdest/$pkgfile"
	fi
	printf "%s" "$ver"
}

build() {
	cd "$srcdir/csong"
	local _cflags
	local _ldflags
	_cflags="-std=c11 -Wall -Wextra -O2 -Iinclude -Ivendor/toml -Ivendor/jsmn -Ivendor/wayland -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700"
	_ldflags="-lmpdclient -lcurl -lfribidi -lm -lXft -lfontconfig -lfreetype -lXrender -lX11 -lXfixes -lXext -ldbus-1"
	export CFLAGS="$CFLAGS $_cflags"
	export LDFLAGS="$LDFLAGS $_ldflags"
	make
}

package() {
	cd "$srcdir/csong"
	install -D -m755 csong "$pkgdir/usr/bin/csong"
	install -D -m644 README.md "$pkgdir/usr/share/doc/csong/README.md"
	install -D -m644 config/sample.toml "$pkgdir/usr/share/doc/csong/sample.toml"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/csong/LICENSE"
}
