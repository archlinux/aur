# Maintainer: asamk <asamk@gmx.de>

pkgname=signal-cli-native
_pkgname=signal-cli
pkgver=0.12.1
pkgrel=1
pkgdesc="Provides a commandline for secure Signal messaging (graalvm native build)."
arch=('any')
url="https://github.com/AsamK/signal-cli"
license=('GPL3')
provides=('signal-cli')
conflicts=('signal-cli')
depends=('libsignal-client')
makedepends=('jdk17-graalvm-bin' 'gradle' 'asciidoc')
source=("https://github.com/AsamK/${_pkgname}/archive/v${pkgver}.tar.gz"
        "https://github.com/AsamK/${_pkgname}/releases/download/v${pkgver}/v${pkgver}.tar.gz.asc")
sha512sums=('c47554e024f7efe28da41c5a2f6ac56f5983b3479b3addcfddd9f3e2994b3a984dd61aba68b65b50576d49716c0807efc8464dec1ac3f9693dd2c536f794b00f'
            'SKIP')
validpgpkeys=('FA10826A74907F9EC6BBB7FC2BA2CD21B5B09570')

prepare() {
	cd "${srcdir}"
	cd "${_pkgname}-${pkgver}"

	sed -i -z "s/implementation(project(\":lib\"))\n}/implementation(project(\":lib\"))\n    implementation(files(\"\/usr\/share\/java\/libsignal-client\/libsignal-client.jar\"))\n}/" build.gradle.kts
	sed -i -z "s/configurations {/configurations.all {\n    exclude(group = \"org.signal\", module = \"libsignal-client\")\n}\n\nconfigurations {/" build.gradle.kts
}

build() {
	cd "${srcdir}"
	cd "${_pkgname}-${pkgver}"

	GRADLE_USER_HOME="${srcdir}/.gradle" gradle --no-daemon nativeCompile

	cd man
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
