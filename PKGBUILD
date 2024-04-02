# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Albert Kugel (Lastebil) <lastebilaur@trebel.org>
# Contributor: speps <speps@aur.archlinux.org>
# Contributor: Eric Forgeot <http://ifiction.free.fr>
# Contributor: favardin

pkgname=wxlua
pkgver=3.2.0.2
pkgrel=1
pkgdesc='Lua bindings for wxWidgets (Lua 5.3+ compatible fork)'
arch=(i686 x86_64)
url="https://github.com/pkulchenko/$pkgname"
license=(wxWindows)
depends=(desktop-file-utils
         lua
         wxwidgets-gtk3)
optdepends=(webkit2gtk)
makedepends=(cmake)
checkdepends=(cppcheck)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('62abe571803a9748e19e86e39cb0e254fd90a5925dc5f0e35669e693cbdb129e')

build() {
	cd "$_archive/wxLua"
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
	cd "$_archive/wxLua"
	make -C build DESTDIR="$pkgdir/" install
	rm -f "$pkgdir"/usr/bin/lua{,c}

	install -d "$pkgdir/usr/lib/lua/5.4"
	mv "$pkgdir/usr/lib/"{lib,lua/5.4/}wx.so

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" docs/licence.txt
	install -Dm644 -t "$pkgdir/usr/share/icons/" art/wxlualogo.xpm

	pushd distrib/autopackage
	install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "$pkgname.xml" -t "$pkgdir/usr/share/mime/packages/"
}
