# Maintainer: osch <oliver at luced de>
pkgname=lua-lanes-git
pkgver=3.11.r10.95ca27b
pkgrel=2
pkgdesc="A solution for running Lua multithreaded"
arch=('x86_64')
url="https://github.com/LuaLanes/lanes"
license=('MIT')
groups=()
depends=('lua')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/LuaLanes/lanes.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -i -e '1s/^/struct s_Universe;\n/' src/tools.h
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make LUA=/usr/bin/lua \
	     LUA_FLAGS=`pkg-config --cflags lua` \
	     LUA_LIBS=`pkg-config --libs lua` \
	     CFLAGS="-O2 -fPIC `pkg-config --cflags lua`"
}

package() {
	cd "$srcdir/${pkgname%-git}"

	install -d                "$pkgdir`pkg-config --variable=INSTALL_CMOD lua`/lanes"
	install src/lanes/core.so "$pkgdir`pkg-config --variable=INSTALL_CMOD lua`/lanes/core.so"

	install -d                  "$pkgdir`pkg-config --variable=INSTALL_LMOD lua`"
	install -m644 src/lanes.lua "$pkgdir`pkg-config --variable=INSTALL_LMOD lua`"

	install -d                  "$pkgdir`pkg-config --variable=INSTALL_INC lua`"
	install -m644 src/lanes.h   "$pkgdir`pkg-config --variable=INSTALL_INC lua`"

	install -d "$pkgdir/usr/share/licenses/${pkgname%-git}"
	install -m644 COPYRIGHT "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
md5sums=('SKIP')
