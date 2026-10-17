# Maintainer: Nova <1367322+l1n@users.noreply.github.com>

pkgname=nginx-mainline-mod-websockify
_commit=c11bc9a3862c53b3af814c3f7d213cc3d2939641
pkgver=0.0.3.r14.gc11bc9a
pkgrel=1

_modname="${pkgname#nginx-mainline-mod-}"

pkgdesc='WebSocket-to-TCP proxy ("websockify_pass"), as used by noVNC (module for mainline nginx)'
arch=('x86_64')
url="https://github.com/tg123/websockify-nginx-module"
license=('MIT')
depends=('nginx-mainline')
makedepends=('nginx-mainline-src')
source=("$_modname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('5e9c65916249a6b246ea7429e83f025d2ac5c24b60b89923016155268339587b')

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src
}

build() {
	cd build
	/usr/src/nginx/configure --with-compat --add-dynamic-module=../$_modname-nginx-module-$_commit
	make modules
}

package() {
	# nginx refuses dynamic modules built for another version, so tie the
	# package to the nginx it was built against.
	local _nginxver
	_nginxver=$(pacman -Q nginx-mainline-src | awk '{print $2}')
	depends=("nginx-mainline=$_nginxver")

	install -Dm644 "$srcdir/$_modname-nginx-module-$_commit/LICENSE" \
	               "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cd build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir/usr/lib/nginx/modules/$mod"
	done
}
