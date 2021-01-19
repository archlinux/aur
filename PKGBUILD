# Maintainer: asamk <asamk@gmx.de>

pkgname=signal-cli
pkgver=0.7.4
pkgrel=1
pkgdesc="Provides a commandline and dbus interface for secure Signal messaging."
arch=('any')
url="https://github.com/AsamK/signal-cli"
license=('GPL3')
depends=('java-runtime>=11' 'java-commons-logging' 'sh' 'libzkgroup')
makedepends=('java-environment>=11' 'gradle' 'asciidoc')
source=("https://github.com/AsamK/${pkgname}/archive/v${pkgver}.tar.gz"
        "https://github.com/AsamK/${pkgname}/releases/download/v${pkgver}/v${pkgver}.tar.gz.asc"
        "${pkgname}.sh"
        "${pkgname}.sysusers.conf"
        "${pkgname}.tmpfiles.conf")
sha512sums=('cc55f4d99a4304ecad82f4c6d7d247eeb23867034ca501089b825a1d285463a110f83cb217faa192ed0959d2ce9e58020ba0216d492d4fad571133469f188c45'
            'SKIP'
            '5f890752b999de525312d9c04ea076fd65036a65df33be172c2a382b3f8037232f4065746de4a5847b719527141885d9871f8c667a218fc14969e46615c4de84'
            'b4db42e18c957edb274637eee1ea5feb5d5f94e16ff0ced63788c8285e0c31c17e5414c6b93b1c2a6ffacca4888b177d33d1878727780e9a0e937b323e332021'
            '8db6fdee294a899596487ebaf154df413631f6935127be430eb47985f3d2a75849daaf1cbe6ae99590d9ae64025bd94c6b212ee9f72e80a3eb49784fad25b914')
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
	                 "${pkgdir}/etc/dbus-1/system.d/"

	cd "${srcdir}"

	install -m644 "${pkgname}.sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -m644 "${pkgname}.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
	install -m755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	cd "${pkgname}-${pkgver}"

	install -m644 "data/org.asamk.Signal.conf" "${pkgdir}/etc/dbus-1/system.d/"
	install -m644 "data/${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/"
	install -m644 "data/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/"
	sed -i "s|%dir%|/usr|" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

	install -m644 "man/${pkgname}.1" "${pkgdir}/usr/share/man/man1/"

	cd "build/install/${pkgname}"

	rm -f lib/commons-logging-*.jar
	rm -f lib/zkgroup-java-*.jar
	install -m644 lib/*.jar "${pkgdir}/usr/share/java/${pkgname}/"
}
