# Package build for owntracks-recorder (https://github.com/owntracks/recorder)
# Maintainer: Sven Klomp <mail at klomp dot eu>

pkgdesc='Lightweight program for storing and accessing location data published via MQTT (or HTTP) by the OwnTracks apps.'
pkgname=('owntracks-recorder-git')
provides=('owntracks-recorder')
conflicts=('owntracks-recorder')
pkgver=0.6.9
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/owntracks/recorder"
makedepends=('libconfig' 'mosquitto' 'curl')
depends=('libconfig' 'mosquitto' 'curl')
source=("git+https://github.com/owntracks/recorder")
_gitname=('recorder')
md5sums=('SKIP')

backup=(etc/default/ot-recorder)

pkgver() {
	cd "$srcdir"/${_gitname}
	echo "0.6.$(git rev-list --count HEAD).$(git describe --always)"
}


prepare() {
	cd "${srcdir}/${_gitname}"
}

build() {
	cd "${srcdir}/${_gitname}"
	cp config.mk.in config.mk || exit 1
	sed -i 's#/usr/local#/usr/#g' config.mk
	sed -i 's#/var/spool/owntracks/recorder/htdocs#/usr/share/webapps/ot-recorder#g' config.mk
	export CFLAGS+=' -Wno-maybe-uninitialized -Wno-unused-result '
	make || exit 1
}

package() {
	install -D -m644 "${srcdir}/${_gitname}/etc/ot-recorder.default" "${pkgdir}/etc/default/ot-recorder"
        install -D -m644 "${srcdir}/${_gitname}/etc/ot-recorder.service" "${pkgdir}/usr/lib/systemd/system/ot-recorder.service"

	mkdir -p "${pkgdir}/var/spool/owntracks/recorder/store"
	mkdir -p "${pkgdir}/usr/share/webapps/ot-recorder"

	cd "${srcdir}/${_gitname}"
	make DESTDIR="${pkgdir}/" install
	mv "${pkgdir}/usr/sbin/ot-recorder" "${pkgdir}/usr/bin"
	rm -r "${pkgdir}/usr/sbin/"
}

