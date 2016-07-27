# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Co-Maintainer: NicoHood <aur {at} nicohood {dot} de>

pkgname=hyperion
pkgver=1.03.2
pkgrel=1
pkgdesc="An opensource 'AmbiLight' implementation"
arch=('any')
url="https://github.com/hyperion-project/hyperion.ng"
license=('MIT')
depends=('libusb' 'python' 'icu')
optdepends=('xorg-server: X11 grabbing')
makedepends=('git' 'cmake' 'qt5-base' 'qt5-serialport' 'avahi' 'protobuf')
provides=('hyperion')
conflicts=('hyperion-git' 'hyperion-rbp' 'hyperion-rbp-git' 'hyperion-rbp-bin' 'hyperion-ng-rbp' 'hyperion-ng')
backup=('etc/hyperion.config.json')
source=("https://github.com/tvdzwan/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('7406f5bdf323d2799fb375557603fefd1f077cda287b5aa9ff10251b22d8dd07590458515b0e01ef97fba80885aab1aa72bd8b5d26873ad8ebcc1ba53d6776ec')

build() {
	cd "${srcdir}/${pkgname}"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DPLATFORM=x86 -DCMAKE_BUILD_TYPE=Release \
				-DENABLE_QT5=ON -DUSE_SHARED_AVAHI_LIBS=ON -DUSE_SYSTEM_PROTO_LIBS=ON ..
	make -j $(nproc)
}

package() {
	cd "${srcdir}/${pkgname}/build"
	make install

	install -Dm 644 "${srcdir}/${pkgname%-git}/config/hyperion.config.json.example" "${pkgdir}/etc/hyperion/hyperion.config.json"
	install -Dm 644 "${srcdir}/${pkgname%-git}/bin/service/hyperion.systemd.sh" "${pkgdir}/usr/lib/systemd/system/hyperiond.service"
	rm -rf "${pkgdir}/usr/share/hyperion/service"
}
