# Maintainer: asamk <asamk@gmx.de>

pkgname=signal-cli
pkgver=0.11.7
pkgrel=1
pkgdesc="Provides a commandline and dbus interface for secure Signal messaging."
arch=('any')
url="https://github.com/AsamK/signal-cli"
license=('GPL3')
depends=('java-runtime-headless>=17' 'java-commons-logging' 'sh' 'libsignal-client')
makedepends=('java-environment>=17' 'gradle' 'asciidoc')
source=("https://github.com/AsamK/${pkgname}/archive/v${pkgver}.tar.gz"
        "https://github.com/AsamK/${pkgname}/releases/download/v${pkgver}/v${pkgver}.tar.gz.asc"
        "${pkgname}.sh")
sha512sums=('14f7b6340aedebc1f8c19fc9cc4c38b1e1e14e4649657895d53ec3070861358632686ea64f8e2b41231b350ea6e32ea40fe29c4d1a9bc41dd1e544b32e2f8986'
            'SKIP'
            'f58d7851c53eae1874692f032a489cb6fb459763a4195afaf93ddd4c65939e1e4e2bbf50438e04800aded466266c3a2a37fcc0f5168f61b8e711fcf03e8e8d12')
validpgpkeys=('FA10826A74907F9EC6BBB7FC2BA2CD21B5B09570')

build() {
	cd "${srcdir}"
	cd "${pkgname}-${pkgver}"

	GRADLE_USER_HOME="${srcdir}/.gradle" gradle --no-daemon installDist

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
	rm -f lib/libsignal-client-*.jar
	install -m644 lib/*.jar "${pkgdir}/usr/share/java/${pkgname}/"
}
