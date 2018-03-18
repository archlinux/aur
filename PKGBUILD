# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
pkgname=dnsbalancer
pkgver=0.2.0
pkgrel=1
pkgdesc="Daemon to balance UDP DNS requests over DNS servers"
arch=('x86_64')
url="https://github.com/pfactum/${pkgname}"
license=('GPL')
makedepends=('git' 'gcc' 'cmake' 'ninja')

source=(
	"${pkgname}-git::git+https://github.com/pfactum/${pkgname}.git"
	"dnsbalancer.service"
	)

sha256sums=('SKIP'
            '02011cfedb857d958aa3cfd5f3cd6c1e621b138f869d362f548ae49f93c52403')

build() {
	cd "${srcdir}/${pkgname}-git"

	mkdir -p build
	cd build

	CC=gcc cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" ..
	cmake --build .
}

package() {
	cd "${srcdir}/${pkgname}-git/build"

	cmake --build . --target install

	install -Dm0644 ../${pkgname}.conf.sample ${pkgdir}/etc/${pkgname}/${pkgname}.conf.sample
	install -Dm0644 ../../${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}

