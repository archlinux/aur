# Package build for owntracks-recorder (https://github.com/owntracks/recorder)
# Maintainer: Sven Klomp <mail at klomp dot eu>

pkgdesc='Lightweight program for storing and accessing location data published via MQTT (or HTTP) by the OwnTracks apps.'
pkgname=('owntracks-recorder')
pkgver=0.6.7
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/owntracks/recorder"
makedepends=('libconfig' 'mosquitto' 'curl')
depends=('libconfig' 'mosquitto' 'curl')
source=("https://github.com/owntracks/recorder/archive/${pkgver}.tar.gz")
md5sums=('bff2360ffc7f859e289bba325613e188')

prepare() {
	cd "${srcdir}/${_gitname}"
}

build() {
	cd "${srcdir}/recorder-${pkgver}"
	cp config.mk.in config.mk || exit 1
	sed -i 's#/usr/local#/usr/#g' config.mk
	sed -i 's#/var/spool/owntracks/recorder/htdocs#/usr/share/webapps/ot-recorder#g' config.mk
	sed -i 's#/etc/defaults/ot-recorder#/etc/ot-recorder#g' config.mk
	export CFLAGS+=' -Wno-maybe-uninitialized -Wno-unused-result '
	make || exit 1
}

package() {
	mkdir -p "${pkgdir}/etc/ot-recorder"
	mkdir -p "${pkgdir}/var/spool/owntracks/recorder/store"
	mkdir -p "${pkgdir}/usr/share/webapps/ot-recorder"

	cd "${srcdir}/recorder-${pkgver}"
	make DESTDIR="${pkgdir}/" install
	mv "${pkgdir}/usr/sbin/ot-recorder" "${pkgdir}/usr/bin"
	rm -r "${pkgdir}/usr/sbin/"
}

