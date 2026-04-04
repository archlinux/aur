# Maintainer: asamk <asamk@gmx.de>

pkgname=signal-cli-native
_pkgname=signal-cli
pkgver=0.14.2
pkgrel=1
pkgdesc="Provides a commandline for secure Signal messaging (graalvm native build)."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/AsamK/signal-cli"
license=('GPL-3.0-only')
provides=('signal-cli')
conflicts=('signal-cli')
depends=('libsignal-client')
makedepends=('jdk25-graalvm-bin' 'gradle' 'asciidoc')
source=("https://github.com/AsamK/${_pkgname}/archive/v${pkgver}.tar.gz"
        "https://github.com/AsamK/${_pkgname}/releases/download/v${pkgver}/v${pkgver}.tar.gz.asc")
sha512sums=('08f439553b38f5a9a9ef2fe5a48138aeb3351878f437ca9cb12eec00d229b64364b6e877c39397aeffd6a5c284035a3a01811733aa9ac679b7b1509925886a2f'
            'SKIP')
validpgpkeys=('FA10826A74907F9EC6BBB7FC2BA2CD21B5B09570')

build() {
	cd "${srcdir}"
	cd "${_pkgname}-${pkgver}"

	GRAALVM_HOME="/usr/lib/jvm/java-25-graalvm" GRADLE_USER_HOME="${srcdir}/.gradle" gradle --no-daemon nativeCompile -Plibsignal_client_path="/usr/share/java/libsignal-client/libsignal-client.jar"

	cd man
	sed -i 's/\[source\]/[source,bash/g' signal-cli-dbus.5.adoc
	make
}

package() {
	install -m755 -d "${pkgdir}/usr/bin" \
	                 "${pkgdir}/usr/lib/systemd/system/" \
	                 "${pkgdir}/usr/lib/sysusers.d/" \
	                 "${pkgdir}/usr/lib/tmpfiles.d/" \
	                 "${pkgdir}/usr/share/man/man1/" \
	                 "${pkgdir}/usr/share/man/man5/" \
	                 "${pkgdir}/etc/dbus-1/system.d/"

	cd "${srcdir}"
	cd "${_pkgname}-${pkgver}"

	install -m755 "build/native/nativeCompile/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -m644 "data/${_pkgname}.sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
	install -m644 "data/${_pkgname}.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
	install -m644 "data/org.asamk.Signal.conf" "${pkgdir}/etc/dbus-1/system.d/"
	install -m644 "data/${_pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/"
	install -m644 "data/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/"
	install -m644 "data/${_pkgname}-socket.service" "${pkgdir}/usr/lib/systemd/system/"
	install -m644 "data/${_pkgname}-socket.socket" "${pkgdir}/usr/lib/systemd/system/"
	sed -i "s|%dir%|/usr|" "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}-socket.service"

	install -m644 "man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/"
	install -m644 "man/${_pkgname}-dbus.5" "${pkgdir}/usr/share/man/man5/"
	install -m644 "man/${_pkgname}-jsonrpc.5" "${pkgdir}/usr/share/man/man5/"
}
