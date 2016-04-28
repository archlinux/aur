# Maintainer: AsamK <asamk ät gmx de>

pkgname=signal-cli
pkgver=0.3.1
pkgrel=1
pkgdesc="Provides a commandline and dbus interface for secure Signal/TextSecure messaging."
arch=('any')
url="https://github.com/AsamK/signal-cli"
license=('GPL3')
depends=('java-runtime' 'libmatthew-unix-java' 'java-commons-logging' 'java-commons-io' 'sh')
makedepends=('java-environment' 'gradle')
replaces=('textsecure-cli')
conflicts=('textsecure-cli')
source=("https://github.com/AsamK/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.sysusers.conf"
        "${pkgname}.tmpfiles.conf")
install="${pkgname}.install"
sha256sums=('597477844747f8bc406328311cb39d6d12bc364562dacfc4a6a023daae590034'
            '874dd32da6f0f0c427d26cb5ecdcf989d7b84288a8deb74a36c7b7101e73c337'
            '873aee431878cbecf6162b51053e82ed758cadbca40bbb2614e5a82e5a99f32f'
            '2fcc0856591271c5997051a9b19ed13cf94d179d7b4a1b5addff9ccd4cf60f9d')

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
	rm -f lib/commons-io-*.jar
	install -m644 lib/*.jar "${pkgdir}/usr/share/java/${pkgname}/"
}
