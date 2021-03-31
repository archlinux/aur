# Maintainer: Jeremy Kescher <jeremy@kescher.at>

pkgname=nginx-mainline-mod-traffic-accounting-git
pkgver=r99.43c9b9d
pkgrel=2

_modname="traffic-accounting-nginx-module"

pkgdesc='Monitor the incoming and outgoing traffic metrics in realtime for NGINX (module for mainline nginx) (Git version)'
arch=('i686' 'x86_64' 'aarch64' 'armv7')
makedepends=('nginx-mainline-src')
depends=('nginx-mainline' 'brotli')
url="https://github.com/Lax/$_modname"
license=('BSD')

source=(
	"git+https://github.com/Lax/$_modname.git"
)

sha256sums=('SKIP')

pkgver() {
	cd "$_modname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src
}

build() {
	cd build
	/usr/src/nginx/configure --with-compat --with-stream --add-dynamic-module=../"$_modname"
	make modules
}

package() {
	install -Dm644 "$srcdir"/"$_modname"/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd "$srcdir"/build/objs
	for mod in ngx_*.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
