# Package build for homegear (https://www.homegear.eu/index.php/Main_Page)
# Maintainer: Michael Lipp <mnl at mnl dot de>

pkgdesc=('Interface HomeMatic BidCoS and others with home automation software')
pkgbase=('homegear')
pkgname=('homegear')
pkgver=0.5.25
pkgrel=1
arch=('armv7h' 'x86_64' 'i686')
license=('GPL')
url="https://github.com/Homegear/Homegear"
makedepends=('gcc-libs' 'gnutls>=3.3.0' 'libgpg-error>=1.14' 'readline>=6.2' 'sqlite>=3.7.13' 'libxml2>=2.8.0' 'lzo>=2.0.6')
source=("https://github.com/Homegear/Homegear/archive/${pkgver}.tar.gz"
	'cast-to-bool.patch'
	'GetDeviceFiles.sh.patch'
	'GetFirmwareUpdates.sh.patch'
	'homegear.service'
	'homegear.logrotate')
md5sums=('cd8335a45f8c9fb3e1fe2fd6328f8373'
	 '3f84c8c96fc6b7d197762e61af97a086'
	 'b1a820bb631c45f3b0f266f552e24891'
	 'ba39981e2b7a1f3cb1428fb839a1786a'
	 '8dc90bcf3f521c1bbf80c0ba5e51a3e8'
	 '57e41d66f3f80d9e8e3caa665dd5e788')

prepare() {
	cd "${srcdir}/Homegear-${pkgver}"

	patch -Np1 -i "${srcdir}/cast-to-bool.patch"
	patch -Np1 -i "${srcdir}/GetDeviceFiles.sh.patch"
	patch -Np1 -i "${srcdir}/GetFirmwareUpdates.sh.patch"
}

build() {
	cd "${srcdir}/Homegear-${pkgver}"

	make config=release verbose=true
}

package_homegear() {
	pkgdesc='Interface your HomeMatic BidCoS, HomeMatic Wired, MAX!, INSTEON or Philips hue devices with your home automation software or your own control scripts.'
	depends=('gcc-libs' 'gnutls>=3.3.0' 'libgpg-error>=1.14' 'readline>=6.2' 'sqlite>=3.7.13' 'libxml2>=2.8.0' 'lzo>=2.0.6' 'unzip' 'wget' 'libxml2' 'python2' 'python2-pip' 'openssl')
	install='homegear.install'
	backup=('etc/homegear/main.conf'
		'etc/homegear/physicalinterfaces.conf'
		'etc/homegear/rpcclients.conf'
		'etc/homegear/rpcservers.conf')

	cd "${srcdir}/Homegear-${pkgver}"

	mkdir -p "${pkgdir}/usr/bin"
	cp bin/Release/homegear "${pkgdir}/usr/bin"
	chown root:root "${pkgdir}/usr/bin"
	chmod 755 "${pkgdir}/usr/bin/homegear"
	
	mkdir -p "${pkgdir}/etc/homegear"
	for f in main.conf rpcclients.conf rpcservers.conf physicalinterfaces.conf; do
	  cp Miscellaneous/$f "${pkgdir}/etc/homegear"
	done
	chmod 755 "${pkgdir}/etc/homegear"
	chmod 644 "${pkgdir}"/etc/homegear/*

	mkdir -p "${pkgdir}/etc/homegear/devices/0"
	chmod 755 "${pkgdir}/etc/homegear/devices"
	chmod 755 "${pkgdir}/etc/homegear/devices/0"

	mkdir -p "${pkgdir}/etc/homegear/devices/1"
	chmod 755 "${pkgdir}/etc/homegear/devices/0"

	mkdir -p "${pkgdir}/etc/homegear/devices/2"
	cp Miscellaneous/Device\ Description\ Files/INSTEON/* "${pkgdir}/etc/homegear/devices/2"
	chmod 755 "${pkgdir}/etc/homegear/devices/2"
	chmod 644 "${pkgdir}"/etc/homegear/devices/2/*

	mkdir -p "${pkgdir}/etc/homegear/devices/4"
	cp Miscellaneous/Device\ Description\ Files/MAX/* "${pkgdir}/etc/homegear/devices/4"
	chmod 755 "${pkgdir}/etc/homegear/devices/4"
	chmod 644 "${pkgdir}"/etc/homegear/devices/4/*

	mkdir -p "${pkgdir}/etc/homegear/devices/5"
	cp Miscellaneous/Device\ Description\ Files/Philips\ hue/* "${pkgdir}/etc/homegear/devices/5"
	chmod 755 "${pkgdir}/etc/homegear/devices/5"
	chmod 644 "${pkgdir}"/etc/homegear/devices/5/*

	mkdir -p "${pkgdir}/etc/homegear/devices/254"
	cp Miscellaneous/Device\ Description\ Files/Miscellaneous/* "${pkgdir}/etc/homegear/devices/254"
	chmod 755 "${pkgdir}/etc/homegear/devices/254"
	chmod 644 "${pkgdir}"/etc/homegear/devices/254/*

	chown root:root "${pkgdir}/etc/homegear"

	mkdir -p "${pkgdir}/etc/logrotate.d"
	cp Miscellaneous/logrotate "${pkgdir}/etc/logrotate.d/homegear"
	chown root:root "${pkgdir}/etc/logrotate.d/homegear"
	chmod 644 "${pkgdir}/etc/logrotate.d/homegear"

	mkdir -p "${pkgdir}/etc/security/limits.d"
	chown root:root "${pkgdir}/etc/security/limits.d"
	echo "homegear        soft    rtprio          100" > "${pkgdir}/etc/security/limits.d/homegear"
	echo "homegear        hard    rtprio          100" >> "${pkgdir}/etc/security/limits.d/homegear"
	chown root:root "${pkgdir}/etc/security/limits.d/homegear"
	chmod 644 "${pkgdir}/etc/security/limits.d/homegear"

	mkdir -p "${pkgdir}/var/lib/homegear/firmware"
	cp Miscellaneous/firmwareDir/GetFirmwareUpdates.sh "${pkgdir}/var/lib/homegear/firmware"
	chown -R root:root "${pkgdir}/var/lib/homegear/firmware"
	chmod -R 550 "${pkgdir}/var/lib/homegear/firmware"

	mkdir -p "${pkgdir}/var/lib/homegear/modules"
	cp lib/Modules/Release/*.so "${pkgdir}/var/lib/homegear/modules"
	FILES="${pkgdir}"/var/lib/homegear/modules/*
	for f in $FILES; do
		f2=`echo $f | sed 's#.*/##' | sed 's/^lib/mod_/'`
		mv $f "${pkgdir}"/var/lib/homegear/modules/$f2
	done
	chown -R root:root "${pkgdir}/var/lib/homegear/modules"
	chmod -R 550 "${pkgdir}/var/lib/homegear/modules"

	mkdir -p "${pkgdir}/var/lib/homegear/www"
	cp -R Miscellaneous/www/* "${pkgdir}/var/lib/homegear/www"
	chown -R root:root "${pkgdir}/var/lib/homegear/www"
	chmod -R 550 "${pkgdir}/var/lib/homegear/www"

	cp Miscellaneous/GetDeviceFiles.sh "${pkgdir}/var/lib/homegear"
	chown root:root "${pkgdir}/var/lib/homegear/GetDeviceFiles.sh"
	chmod 755 "${pkgdir}/var/lib/homegear/GetDeviceFiles.sh"
	cp Miscellaneous/DeviceTypePatch.patch "${pkgdir}/var/lib/homegear"
	chown root:root "${pkgdir}/var/lib/homegear/DeviceTypePatch.patch"
	chmod 644 "${pkgdir}/var/lib/homegear/DeviceTypePatch.patch"

	mkdir -p "${pkgdir}/usr/lib/systemd/system"
	cp "${srcdir}/homegear.service" "${pkgdir}/usr/lib/systemd/system"
	chmod 644 "${pkgdir}/usr/lib/systemd/system/homegear.service"
}
