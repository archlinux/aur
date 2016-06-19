# Maintainer: AsamK <asamk ät gmx de>

pkgname=signal-cli
pkgver=0.4.0
pkgrel=1
pkgdesc="Provides a commandline and dbus interface for secure Signal/TextSecure messaging."
arch=('any')
url="https://github.com/AsamK/signal-cli"
license=('GPL3')
depends=('java-runtime' 'libmatthew-unix-java' 'java-commons-logging' 'sh')
makedepends=('java-environment' 'gradle')
replaces=('textsecure-cli')
conflicts=('textsecure-cli')
source=("https://github.com/AsamK/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.sysusers.conf"
        "${pkgname}.tmpfiles.conf")
install="${pkgname}.install"
sha256sums=('348af5b2fa55b90258824686bfba316f6ce4c8af0a2a3b0267ae0a9a78b1b519'
            '82207f74775e3f455b90c268e5e3a92084e5d4a8c153f786ffa69567b6e2eee3'
            '873aee431878cbecf6162b51053e82ed758cadbca40bbb2614e5a82e5a99f32f'
            '37595731710de43eb132aaf21638dfe1fa56bf48231878fa1b8b31527694c006')

build() {
	cd "${srcdir}"
	cd "${pkgname}-${pkgver}"

	GRADLE_USER_HOME="${srcdir}/.gradle" gradle --no-daemon installDist
}

package() {
	install -m755 -d "${pkgdir}/usr/share/java/${pkgname}" \
	                 "${pkgdir}/usr/bin" \
	                 "${pkgdir}/usr/lib/systemd/system/" \
	                 "${pkgdir}/usr/lib/sysusers.d/" \
	                 "${pkgdir}/usr/lib/tmpfiles.d/" \
	                 "${pkgdir}/etc/dbus-1/system.d/"

	cd "${srcdir}"

	install -m644 "${pkgname}.sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -m644 "${pkgname}.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
	install -m755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	cd "${pkgname}-${pkgver}"

	install -m644 "data/org.asamk.Signal.conf" "${pkgdir}/etc/dbus-1/system.d/"
	install -m644 "data/${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/"
	sed -i "s|%dir%|/usr|" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"

	cd "build/install/${pkgname}"

	rm -f lib/unix-*.jar
	rm -f lib/commons-logging-*.jar
	install -m644 lib/*.jar "${pkgdir}/usr/share/java/${pkgname}/"
}
