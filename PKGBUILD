# Maintainer: Ayush Bhat <tfeayush@gmail.com>

pkgname=nexchat-git
_pkgname=nexchat
# nexchat's own numbering started at 0.1.0, below the 2.16.2 it carried from
# HexChat before: the epoch keeps pacman upgrading
epoch=1
pkgver=0.2.2.r0.gb3c3c70e
pkgrel=1
pkgdesc="IRC client: HexChat continued on GTK4, with a terminal UI (git master)"
arch=('x86_64' 'aarch64')
url="https://github.com/1ay1/nexchat"
license=('GPL-2.0-or-later')
depends=('gtk4' 'glib2' 'openssl' 'dbus-glib' 'libcanberra' 'iso-codes' 'pciutils' 'wayland')
makedepends=('git' 'meson' 'ninja' 'cmake' 'python' 'perl' 'luajit' 'python-cffi'
             'wayland-protocols' 'desktop-file-utils')
optdepends=('enchant: spell checking'
            'perl: Perl scripts'
            'python: Python scripts'
            'python-cffi: Python scripts'
            'luajit: Lua scripts')
provides=("$_pkgname")
conflicts=("$_pkgname")
# maya draws the terminal UI (nexchat --tui); its own jaal submodule isn't used
source=("git+https://github.com/1ay1/nexchat.git"
        "git+https://github.com/1ay1/maya.git")
sha256sums=('SKIP' 'SKIP')

prepare() {
	cd "$_pkgname"
	git submodule init subprojects/maya
	git config submodule.subprojects/maya.url "$srcdir/maya"
	git -c protocol.file.allow=always submodule update subprojects/maya
}

pkgver() {
	cd "$_pkgname"
	# 0.1.0.r<commits since the meson version changed>.g<hash>
	local ver
	ver=$(sed -n "s/^  version: '\(.*\)',/\1/p" meson.build)
	printf '%s.r%s.g%s' "$ver" \
		"$(git rev-list --count "$(git log -n1 --format=%H -S"version: '$ver'" -- meson.build)"..HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	# HexChat can be installed too: no hexchat-named plugin files from us
	arch-meson "$_pkgname" build \
		-Dinstall-hexchat-compat=false \
		-Dtext-frontend=true \
		-Dtui=enabled \
		-Dwith-lua=luajit \
		-Dwith-perl=perl \
		-Dwith-python=python3
	meson compile -C build
}

check() {
	# the ones that need no display (the GUI tests need Xvfb and more)
	meson test -C build --no-rebuild --print-errorlogs \
		palette-roundtrip smoke-text hostile-text echo-message batch \
		chathistory lastlog-logs reply multiline migrate-config
}

package() {
	meson install -C build --destdir "$pkgdir"
}
