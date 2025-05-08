# Maintainer: asamk <asamk@gmx.de>

pkgname=signal-cli
pkgver=0.13.15
pkgrel=1
pkgdesc="Provides a commandline and dbus interface for secure Signal messaging."
arch=('any')
url="https://github.com/AsamK/signal-cli"
license=('GPL-3.0-only')
depends=('java-runtime-headless>=21' 'java-commons-logging' 'sh' 'libsignal-client')
makedepends=('java-environment>=21' 'gradle' 'asciidoc')
source=("https://github.com/AsamK/${pkgname}/archive/v${pkgver}.tar.gz"
        "https://github.com/AsamK/${pkgname}/releases/download/v${pkgver}/v${pkgver}.tar.gz.asc"
        "${pkgname}.sh")
sha512sums=('67d6f274f43973d7f9eed8a3f12bb16d552bd4a61f0bd8a9480249db8643cd3dbbc18543d95ae97715fb17013788d9fa74567ee7c56df75384b9909f0cb07907'
            'SKIP'
            '64f181bd9170af5c462899fba765a92b8225e24c3fd2a25deec31d9879dec76a987de9efa065fc3e60e8f5a787e934e0abbdd43ab94445ad3eecacfe1a9de74d')
validpgpkeys=('FA10826A74907F9EC6BBB7FC2BA2CD21B5B09570')

prepare() {
	cd "${srcdir}"
	cd "${pkgname}-${pkgver}"

	echo ';plugins { id("org.gradle.toolchains.foojay-resolver-convention") version "0.8.0" }' >> settings.gradle.kts
}

build() {
	cd "${srcdir}"
	cd "${pkgname}-${pkgver}"

	GRADLE_USER_HOME="${srcdir}/.gradle" gradle --no-daemon installDist -Plibsignal_client_path="/usr/share/java/libsignal-client/libsignal-client.jar"

	cd man
	make
}

package() {
	install -m755 -d "${pkgdir}/usr/share/java/${pkgname}" \
	                 "${pkgdir}/usr/bin" \
	                 "${pkgdir}/usr/lib/systemd/system/" \
	                 "${pkgdir}/usr/lib/sysusers.d/" \
	                 "${pkgdir}/usr/lib/tmpfiles.d/" \
	                 "${pkgdir}/usr/share/man/man1/" \
	                 "${pkgdir}/usr/share/man/man5/" \
	                 "${pkgdir}/etc/dbus-1/system.d/"

	cd "${srcdir}"

	install -m755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	cd "${pkgname}-${pkgver}"

	install -m644 "data/${pkgname}.sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -m644 "data/${pkgname}.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
	install -m644 "data/org.asamk.Signal.conf" "${pkgdir}/etc/dbus-1/system.d/"
	install -m644 "data/${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/"
	install -m644 "data/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/"
	install -m644 "data/${pkgname}-socket.service" "${pkgdir}/usr/lib/systemd/system/"
	install -m644 "data/${pkgname}-socket.socket" "${pkgdir}/usr/lib/systemd/system/"
	sed -i "s|%dir%|/usr|" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}-socket.service"

	install -m644 "man/${pkgname}.1" "${pkgdir}/usr/share/man/man1/"
	install -m644 "man/${pkgname}-dbus.5" "${pkgdir}/usr/share/man/man5/"
	install -m644 "man/${pkgname}-jsonrpc.5" "${pkgdir}/usr/share/man/man5/"

	cd "build/install/${pkgname}"

	rm -f lib/commons-logging-*.jar
	rm -f lib/libsignal-client*.jar
	install -m644 lib/*.jar "${pkgdir}/usr/share/java/${pkgname}/"
}
