# Maintainer: Iván Zaera Avellón <ivan dot zaera at protonmail dot com>
pkgname=owntracks-recorder
pkgver=0.9.6
pkgrel=2
pkgdesc='Lightweight program for storing and accessing location data published via MQTT (or HTTP) by the OwnTracks apps.'
arch=('i686' 'pentium4' 'x86_64')
url='https://github.com/owntracks/recorder'
license=('GPL')
depends=(
	'curl'
	'libconfig'
	'libsodium'
	'lmdb'
	'lua'
	'mosquitto'
)
makedepends=(
	'coreutils'
	'curl'
	'libconfig'
	'libsodium'
	'lua'
	'mosquitto'
)
backup=(
	'etc/owntracks-recorder.conf'
)
install='install.sh'
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/owntracks/recorder/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=("73bb2f6217a7c2aeabae4894f0b3499ce74f8d3b153c4ec3fa3b87358c3692fe")

build() {
	cd "${srcdir}/recorder-${pkgver}"

	cp config.mk.in config.mk
	sed -i 's#INSTALLDIR = /usr/local#INSTALLDIR = /usr#g'                                                         config.mk
	sed -i 's#WITH_LUA ?= no#WITH_LUA ?= yes#g'                                                                    config.mk
	sed -i 's#WITH_ENCRYPT ?= no#WITH_ENCRYPT ?= yes#g'                                                            config.mk
	sed -i 's#STORAGEDEFAULT = /var/spool/owntracks/recorder/store#STORAGEDEFAULT = /var/lib/owntracks-recorder#g' config.mk
	sed -i 's#DOCROOT = /var/spool/owntracks/recorder/htdocs#DOCROOT = /usr/share/webapps/owntracks-recorder#g'    config.mk
	sed -i 's#CONFIGFILE = /etc/default/ot-recorder#CONFIGFILE = /etc/owntracks-recorder.conf#g'                   config.mk

	make
}

package() {
	cd "${srcdir}/recorder-${pkgver}"

	# Make installation
	DESTDIR="${pkgdir}" make install

	# Copy systemd service file
	install -D -m644 etc/ot-recorder.service "${pkgdir}/usr/lib/systemd/system/owntracks-recorder.service"

	cd "${pkgdir}"

	# Move ot-recorder out of /usr/sbin
	mkdir -p usr/bin
	mv 'usr/sbin/ot-recorder' usr/bin/ot-recorder
	rm -rf usr/sbin

	# Make systemd create ot-recorder user
	mkdir -p usr/lib/sysusers.d
	echo 'u ot-recorder - "OwnTracks Recorder"' > usr/lib/sysusers.d/owntracks-recorder.conf

	# Configure file/folder permissions
	mkdir -p usr/lib/tmpfiles.d
	echo 'd /var/lib/owntracks-recorder  0750 ot-recorder ot-recorder'  > usr/lib/tmpfiles.d/owntracks-recorder.conf
	echo 'Z /var/lib/owntracks-recorder  0750 ot-recorder ot-recorder' >> usr/lib/tmpfiles.d/owntracks-recorder.conf
	echo 'z /etc/owntracks-recorder.conf 0640 root        ot-recorder' >> usr/lib/tmpfiles.d/owntracks-recorder.conf
	rm -rf var

	# Tune owntracks-recorder.conf
	sed -i 's#OTR_STORAGEDIR="/var/spool/owntracks/recorder/store"#OTR_STORAGEDIR="/var/lib/owntracks-recorder"#g' etc/owntracks-recorder.conf
	sed -i 's%# OTR_PORT=1883%OTR_PORT=0%g' etc/owntracks-recorder.conf

	# Tune owntracks-recorder.service
	sed -i 's%# /etc/systemd/system/ot-recorder.service%%g'                      usr/lib/systemd/system/owntracks-recorder.service
	sed -i 's#ExecStartPre=/bin/sleep 15#Environment="OTR_LMDBSIZE=104857600"#g' usr/lib/systemd/system/owntracks-recorder.service
	sed -i 's#User=owntracks#User=ot-recorder#g'                                 usr/lib/systemd/system/owntracks-recorder.service
	sed -i 's#WorkingDirectory=/#WorkingDirectory=/var/lib/owntracks-recorder#g' usr/lib/systemd/system/owntracks-recorder.service
}
