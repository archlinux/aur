# Contributor: Dalton Miller
# Contributor: Kilian Lackhove kilian@lackhove.de
# Contributor: Justin Patera serialhex@gmail.com
# Contributor: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Flow

pkgname=rslsync
pkgver=2.4.1
pkgrel=1
pkgdesc="Resilio Sync (ex:BitTorrent Sync) - automatically sync files via secure, distributed technology"
license=("custom:btsync")
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://www.getsync.com"
install=rslsync.install
backup=('etc/rslsync.conf')
conflicts=()
source=(rslsync.service rslsync_user.service rslsync.conf)
source_arm=("rslsync_arm-${pkgver}-${pkgrel}.tar.gz::https://download-cdn.resilio.com/stable/linux-arm/resilio-sync_arm.tar.gz")
source_armv6h=("rslsync_arm-${pkgver}-${pkgrel}.tar.gz::https://download-cdn.resilio.com/stable/linux-arm/resilio-sync_arm.tar.gz")
source_armv7h=("rslsync_armhf-${pkgver}-${pkgrel}.tar.gz::https://download-cdn.resilio.com/stable/linux-armhf/resilio-sync_armhf.tar.gz")
source_i686=("rslsync_i386-${pkgver}-${pkgrel}.tar.gz::https://download-cdn.resilio.com/stable/linux-i386/resilio-sync_i386.tar.gz")
source_x86_64=("rslsync_x64-${pkgver}-${pkgrel}.tar.gz::https://download-cdn.resilio.com/stable/linux-x64/resilio-sync_x64.tar.gz")


sha1sums=('68eaa07ad70ccb067d687641d6c77a3cfaca4082'
          '6bebc8a9e56a36091419632aad14f440845be3a7'
          'bf7d6bd7ffe2d23cce51a51e92fac3b82a7c87bb')
sha1sums_i686=('0181998f6f31abd71d2c326540f12462a8d209d0')
sha1sums_x86_64=('4446004c8195d1ca03d3c87db290c6936b488ad9')
sha1sums_arm=('cebc12f76a98b35419286854356f216a104b07da')
sha1sums_armv6h=('cebc12f76a98b35419286854356f216a104b07da')
sha1sums_armv7h=('38e78562c0445ef47f83b8ff8b9fc8567cb6ec99')


package() {
	# install main binary
	install -Dm755 "${srcdir}"/rslsync "${pkgdir}"/usr/bin/rslsync

	# generate and install system-wide config
	mkdir -p "${pkgdir}"/etc
	./rslsync --dump-sample-config \
		| sed 's:/home/user/\.sync:/var/lib/rslsync:' \
		| sed 's:\/\/ "pid_file":  "pid_file":' \
		| sed 's:\/\/ "storage_path":  "storage_path":' \
		> "${pkgdir}"/etc/rslsync.conf

	# install systemd config files
	install -Dm644 "${srcdir}"/rslsync.service "${pkgdir}"/usr/lib/systemd/system/rslsync.service
	install -Dm644 "${srcdir}"/rslsync.conf "${pkgdir}"/usr/lib/tmpfiles.d/rslsync.conf
	install -Dm644 "${srcdir}"/rslsync_user.service "${pkgdir}"/usr/lib/systemd/user/rslsync.service

	# install license
	install -Dm644 "${srcdir}"/LICENSE.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}
