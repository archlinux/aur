# Maintainer: Wallun <wallun CAT disroot DOG org>

pkgname=nginx-mainline-mod-acme
pkgver=0.4.1
pkgrel=1
pkgdesc='Nginx module with the implementation of ACME protocol'
arch=('x86_64')
url='https://github.com/nginx/nginx-acme/'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'openssl')
makedepends=('cargo' 'clang' 'nginx-mainline' 'nginx-mainline-src')
source=("${pkgname}-${pkgver}.tar.gz::${url}archive/v${pkgver}/nginx-acme-${pkgver}.tar.gz")
sha256sums=('b4f99f971bd0bebc89b2037f3afeaa3281004fe434de558df87d69cab2be1f22')

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
	export NGX_ACME_STATE_PREFIX=/var/cache/nginx
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd ../nginx-acme-${pkgver}
	cargo build --frozen --release --all-features
}

package() {
	if [[ ${BUILDTOOL} == devtools ]]; then
		local nginx_dep="nginx=$(nginx -v 2>&1 | sed 's/.*\///')"
		depends+=($nginx_dep)
	else
	    depends+=(nginx-mainline)
	fi

    cd "nginx-acme-${pkgver}"
    install -Dm755 "target/release/libnginx_acme.so" \
                   "${pkgdir}/usr/lib/nginx/modules/ngx_http_acme_module.so"

    install -dm755 "${pkgdir}/etc/nginx/modules.d"
    echo 'load_module /usr/lib/nginx/modules/ngx_http_acme_module.so;' | \
    tee "${pkgdir}/etc/nginx/modules.d/20-ngx_http_acme_module.conf"
}
