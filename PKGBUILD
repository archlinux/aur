# Maintainer: Adrian Günter <adrian at gntr dot me>

pkgname=arpon-ng
pkgver=3.0
pkgrel=4
pkgdesc="Prevents MITM attacks on the Address Resolution Protocol (ARP)"
arch=('i686' 'x86_64')
url="http://arpon.sourceforge.net"
license=('BSD')
depends=('libpcap>=1.0.0' 'libnet>=1.1.2.1' 'libdnet>=1.11')
makedepends=('cmake>=2.6')
conflicts=('arpon')
provides=('arpon')
backup=('etc/arpon.conf' 'etc/conf.d/arpon')
install="${pkgname}.install"
source=("ArpON-${pkgver}-ng.tar.gz::https://sourceforge.net/projects/arpon/files/arpon/ArpON-${pkgver}-ng.tar.gz/download"
	'arpon.service'
	'arpon.service.conf'
	'arpon-syslog.patch'
	'arpon-gcc7.patch')
md5sums=('a89ef9bc18e6f0fc9aa8a89aa676a281'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP')

prepare() {
	cd "ArpON-${pkgver}-ng"
	patch -p2 < ../arpon-gcc7.patch
	patch -p2 < ../arpon-syslog.patch
	sed -i -e 's:/sbin:/usr/bin:g' src/CMakeLists.txt README
	mkdir -p build
}

build() {
	cd "ArpON-${pkgver}-ng/build"
	cmake -DCMAKE_INSTALL_PREFIX=/ ..
	make
}

package() {
	install -Dm 644 arpon.service "${pkgdir}/usr/lib/systemd/system/arpon.service"
	install -Dm 644 arpon.service.conf "${pkgdir}/etc/conf.d/arpon"
	cd "ArpON-${pkgver}-ng"
	make DESTDIR="${pkgdir}" -C build/etc install
	make DESTDIR="${pkgdir}" -C build/man8 install
	make DESTDIR="${pkgdir}" -C build/src install
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
