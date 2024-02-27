# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=angie-mod-modsecurity
pkgver=1.0.3
pkgrel=2
pkgdesc='ModSecurity v3 Nginx Connector (module for angie)'
arch=('x86_64')
depends=('angie' 'libmodsecurity')
makedepends=('angie-src')
url="https://github.com/SpiderLabs/ModSecurity-nginx"
license=('GPL3')

source=(
	https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v$pkgver/modsecurity-nginx-v$pkgver.tar.gz{,.asc}
	https://raw.githubusercontent.com/owasp-modsecurity/ModSecurity/v3/master/modsecurity.conf-recommended
)
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8'  # Maxim Dounin <mdounin@mdounin.ru>
              '190EFACCA1E9FA466A8ECD9CE6DFB08CE8B11277' # Felipe Zimmerle
              'F126692E9BA86B3958E73ED2F2FC4E45883BCBA4') # Martin Vierula
sha256sums=('ae811c7208ac029cb7a99d6f63e03d3971797607517187f47620df39c1f78add'
            'SKIP'
            'd9e164c508218202eba13d37cf661baacb8600706e618ce93ccc91c74c51449e')
backup=("etc/nginx/modsecurity.conf")
install="angie-mod-modsecurity.install"
prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/angie/auto
	ln -sf /usr/src/angie/src
}

build() {
	cd build
	/usr/src/angie/configure --with-compat --add-dynamic-module=../modsecurity-nginx-v$pkgver
	make modules
}

package() {
	cd build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir/usr/lib/nginx/modules/$mod"
	done
	install -Dm644 "${srcdir}/modsecurity.conf-recommended" "${pkgdir}/etc/nginx/modsecurity.conf"
}

