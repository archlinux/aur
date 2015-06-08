# Maintainer: Oleksandr Natalenko aka post-factum <oleksandr@natalenko.name>
pkgname=pfrng-feeder
_pkgname=libpfrng
pkgver=0.0.9
pkgrel=2
pkgdesc="Entropy feeder based on CPU jitter RNG"
url="https://github.com/pfactum/libpfrng/"
arch=('i686' 'x86_64')
license=('LGPLv3')
depends=('glibc' 'libpfrng' 'zeromq')
makedepends=('gcc' 'cmake')
source=(https://github.com/pfactum/libpfrng/archive/v${pkgver}.tar.gz)

md5sums=(12057bdf82842e6abdf27c08481db208)

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
	# Detect CPUs count automatically
	CPUS_COUNT=`cat /proc/cpuinfo | grep processor | wc -l`
	echo "Compiling using $CPUS_COUNT thread(s)"
	make -j$CPUS_COUNT
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	install -D --mode=0755 build/examples/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -D --mode=0755 build/examples/${pkgname}/${pkgname}-ctl ${pkgdir}/usr/bin/${pkgname}-ctl
	install -D --mode=0644 examples/${pkgname}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}

