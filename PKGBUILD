# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Popolon <popolon@popolon.org>
# Contributor: Martin Minka <https://github.com/k2s>
# Contributor: migerh <https://github.com/migerh>
# Contributor: hollunder <murks at tuxfamily dot org>

pkgname=wxlua-git
_pkgname=${pkgname/%-git}
pkgver=3.2.0.2.r13.g4d83c8d
pkgrel=1
epoch=1
pkgdesc='Lua bindings for wxWidgets (Lua 5.3+ compatible fork)'
arch=(i686 x86_64)
url="https://github.com/pkulchenko/$_pkgname"
license=(wxWindows)
depends=(desktop-file-utils
         lua
         wxwidgets-gtk3)
optdepends=(webkit2gtk)
makedepends=(cmake
             git)
checkdepends=(cppcheck)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --tags --match "v[0-9\.]*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname%-git}/wxLua"
    cmake -S . -B build \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D wxLua_LUA_LIBRARY_USE_BUILTIN=False \
        -D wxLua_LUA_LIBRARY_BUILD_SHARED=True \
        -D wxLua_LUA_LIBRARY='/usr/lib/liblua.so' \
        -D wxLua_LUA_INCLUDE_DIR='/usr/include' \
        -D wxWidgets_COMPONENTS='stc;gl;html;aui;adv;core;net;base' \
        -D wxLuaBind_COMPONENTS='stc;gl;html;aui;adv;core;net;base' \
        -D BUILD_SHARED_LIBS=True
    make -C build
}

package() {
	cd "${pkgname%-git}/wxLua"
	make -C build  DESTDIR="$pkgdir/" install
	rm -f "$pkgdir"/usr/bin/lua{,c}

	install -d "$pkgdir/usr/lib/lua/5.4"
	mv "$pkgdir/usr/lib/"{lib,lua/5.4/}wx.so

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" docs/licence.txt
	install -Dm644 -t "$pkgdir/usr/share/icons/" art/wxlualogo.xpm

	pushd distrib/autopackage
	install -Dm644 "${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "${pkgname%-git}.xml" -t "$pkgdir/usr/share/mime/packages/"
}
