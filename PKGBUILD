# Maintainer: Terence Noone <me@techtricity.net>

pkgname=nginx-mod-acme
pkgver=0.1.1
pkgrel=1

pkgdesc='Nginx module adding support for the ACME protocol'
arch=('x86_64')
url='https://github.com/nginx/nginx-acme/'
license=('Apache-2.0')

depends=('nginx' 'gcc-libs' 'glibc' 'openssl')
makedepends=('cargo' 'clang' 'nginx-src')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nginx/nginx-acme/archive/v${pkgver}/nginx-acme-${pkgver}.tar.gz")
sha256sums=('c2158d7f9baa53a9186c406e82c3068832f03b87a1d1066b0d214a8bf834ddfd')

prepare() {
	cd "nginx-acme-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

	mkdir -p ../build
	cd ../build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src
}

build() {
	cd build
	/usr/src/nginx/configure --with-compat --with-http_ssl_module

	export NGINX_BUILD_DIR=$(realpath objs)
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd ../nginx-acme-${pkgver}
	cargo build --frozen --release --all-features
}

package() {
	cd "nginx-acme-${pkgver}"
	install -Dm755 "target/release/libnginx_acme.so" \
		"$pkgdir/usr/lib/nginx/modules/ngx_http_acme_module.so"

	install -dm755 "${pkgdir}/etc/nginx/modules.d"
	echo 'load_module /usr/lib/nginx/modules/ngx_http_acme_module.so;' > "${pkgdir}/etc/nginx/modules.d/20-ngx_http_acme_module"
}

