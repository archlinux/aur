# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
pkgname=dnsbalancer
pkgver=0.0.1
pkgrel=1
pkgdesc="Daemon to balance UDP DNS requests over DNS servers"
arch=('x86_64')
url="https://github.com/LanetNetwork/${pkgname}"
license=('GPL')
depends=('iniparser' 'libmicrohttpd' 'libbsd' 'ldns')
optdepends=('gperftools: faster memory allocation with tcmalloc')
makedepends=('git' 'gcc' 'cmake' 'make')

source=(
	"${pkgname}-git::git+https://github.com/LanetNetwork/${pkgname}.git"
	"dnsbalancer.service"
	)

sha256sums=(
	"SKIP"
	"0ba09709bdadcdbab31e29dabd11b126bac549b31773c4f44693226622a9f723"
	)

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	git submodule update --init --recursive

	mkdir -p build
	cd build

	cmake -DCMAKE_BUILD_TYPE=Release -DDB_INIPARSER4=1 -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
	make -j$(nproc)
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	make install
	install -Dm0644 ../${pkgname}.conf.sample ${pkgdir}/etc/${pkgname}/${pkgname}.conf.sample
	install -Dm0644 ../../${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}

