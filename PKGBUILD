# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
pkgname=dnsbalancer
pkgver=0.0.1
pkgrel=3
pkgdesc="Daemon to balance UDP DNS requests over DNS servers"
arch=('x86_64')
url="https://github.com/LanetNetwork/${pkgname}"
license=('GPL')
depends=('libmicrohttpd' 'libbsd' 'ldns' 'openssl' 'libunwind')
optdepends=('gperftools: faster memory allocation with tcmalloc')
makedepends=('git' 'gcc' 'cmake' 'make')

source=("${pkgname}-git::git+https://github.com/LanetNetwork/${pkgname}.git")

sha256sums=("SKIP")

build() {
	cd "${srcdir}/${pkgname}-git"

	mkdir -p build
	cd build

	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
	make -j$(nproc)
}

package() {
	cd "${srcdir}/${pkgname}-git/build"

	make install

	install -Dm0644 ../configs/${pkgname}.conf.sample ${pkgdir}/etc/${pkgname}/${pkgname}.conf.sample
	install -Dm0644 ../configs/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}

