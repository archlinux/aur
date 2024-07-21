# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=nginx-mod-traffic-accounting
pkgver=2.0+18+g46aae3e
pkgrel=1

_modname="traffic-accounting-nginx-module"

pkgdesc='Monitor the incoming and outgoing traffic metrics in realtime for NGINX'
arch=('x86_64')
makedepends=('nginx-src')
depends=('nginx')
url="https://github.com/Lax/${_modname}"
license=('BSD-2-Clause')

source=(
	"https://github.com/Lax/${_modname}/archive/v${pkgver%%+*}/${_modname}-${pkgver%%+*}.tar.gz"
	"d53a4a6.patch"
	"server_addr.patch"
	"succ_collect.patch"
)
sha512sums=('0df34c3765e18dc5cc5a053d3a17dbee17a686a1f6e76ad057c262741c4e4465c66bcef86e627a19258f836cad5f14745bf046fd396b00960ad79ed20c2a07bb'
            'c99fea97563bcb9463d5f4ef1880fe336ed8a675d964687cf3d70fdc50e8d2b2b7d83efbe3fe8ba35945cfaa83a17a6b9b432dc5daa5fc3228efff568ac6ff44'
            '8624b4201e390465ceb0274c8e6241ed9075c9d600661c52ad2d77078f92b19fd011d8fe9878a4453519db465d644f430439eabb438ab7810d126955ee814910'
            '1d0993d1f3f00f3682d6717192f95836bbf0f1d113e1fdf8b1437dd3f2ec250e36a687ed6238cc17019a829ce6d59baea7bda79bab154b5cba5b088452b0aec8')

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src

	cd "../${_modname}-${pkgver%%+*}"
	patch -Np1 -i '../d53a4a6.patch'
	patch -Np1 -i '../server_addr.patch'
	patch -Np1 -i '../succ_collect.patch'
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
