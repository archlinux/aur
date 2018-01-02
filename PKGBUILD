# Package build for owntracks-recorder (https://github.com/owntracks/recorder)
# Maintainer: Sven Klomp <mail at klomp dot eu>

pkgdesc='Lightweight program for storing and accessing location data published via MQTT (or HTTP) by the OwnTracks apps.'
pkgname=('owntracks-recorder')
pkgver=0.7.2
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/owntracks/recorder"
makedepends=('libconfig' 'mosquitto' 'curl')
depends=('libconfig' 'mosquitto' 'curl')
source=("https://github.com/owntracks/recorder/archive/${pkgver}.tar.gz")
md5sums=('feeff3f62164d8f2803bc91a8de39f6c')

backup=(etc/default/ot-recorder)

prepare() {
	cd "${srcdir}/${_gitname}"
}

build() {
	cd "${srcdir}/recorder-${pkgver}"
	cp config.mk.in config.mk || exit 1
	sed -i 's#/usr/local#/usr/#g' config.mk
	sed -i 's#/var/spool/owntracks/recorder/htdocs#/usr/share/webapps/ot-recorder#g' config.mk
	export CFLAGS+=' -Wno-maybe-uninitialized -Wno-unused-result '
	make || exit 1
}

package() {
	install -D -m644 "${srcdir}/recorder-${pkgver}/etc/ot-recorder.default" "${pkgdir}/etc/default/ot-recorder"
        install -D -m644 "${srcdir}/recorder-${pkgver}/etc/ot-recorder.service" "${pkgdir}/usr/lib/systemd/system/ot-recorder.service"

	mkdir -p "${pkgdir}/var/spool/owntracks/recorder/store"
	mkdir -p "${pkgdir}/usr/share/webapps/ot-recorder"

	cd "${srcdir}/recorder-${pkgver}"
	make DESTDIR="${pkgdir}/" install
	mv "${pkgdir}/usr/sbin/ot-recorder" "${pkgdir}/usr/bin"
	rm -r "${pkgdir}/usr/sbin/"
}

