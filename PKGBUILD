# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=nginx-mod-traffic-accounting
pkgver=2.0+16+g98af5fc
pkgrel=1

_modname="traffic-accounting-nginx-module"

pkgdesc='Monitor the incoming and outgoing traffic metrics in realtime for NGINX'
arch=('x86_64')
makedepends=('nginx-src')
depends=('nginx')
url="https://github.com/Lax/${_modname}"
license=('BSD')

source=(
	"https://github.com/Lax/${_modname}/archive/v${pkgver%%+*}/${_modname}-v${pkgver%%+*}.tar.gz"
	"d53a4a6.patch"
	"server_addr.patch"
)
sha256sums=(
	'8c99c5313e5c822aa5683691c8a0641499b2fa8c67f9e55652817042e21f5986'
	'9bad093fba01d67098d98122202693ffba20feb20668f73e7712d9d9b9915bf1'
	'e25f170801179e067c7186f1e27fcb3f4273ac5683f6a4962dee821d5eddc8d0'
)

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src

	cd "../${_modname}-${pkgver%%+*}"
	patch -Np1 -i '../d53a4a6.patch'
	patch -Np1 -i '../server_addr.patch'
}

build() {
	cd build
	/usr/src/nginx/configure --with-compat --with-stream --add-dynamic-module="../${_modname}-${pkgver%%+*}"
	make modules
}

package() {
	install -Dm644 "$srcdir"/"${_modname}-${pkgver%%+*}"/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd build/objs
	for mod in ngx_*.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
