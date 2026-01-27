# Maintainer: 30p87 <aur@30p87.de>

pkgname='piped-backend-git'
_componentname="${pkgname%'-git'}"
_componentnameshort="${_componentname#'piped-'}"
pkgver=r1316.c5921f6
pkgrel=1
pkgdesc='An advanced open-source privacy friendly alternative to YouTube'
arch=('x86_64')
url='https://github.com/TeamPiped/Piped-Backend'
license=('AGPL-3.0')
groups=('piped-git')
depends=('java-runtime')
makedepends=('git' 'jdk-openjdk')
backup=("etc/webapps/piped/${_componentnameshort}.properties")
source=('git+https://github.com/TeamPiped/Piped-Backend.git'
		'piped-backend.sh'
		'sysusers.conf'
		'tmpfiles.conf'
		'systemd.service')
sha256sums=('SKIP'
            '3f62b54ab1567ee6f7a5e419f74422419c499a05f19a90fe946b3396b7c29624'
            'eb122e1cf5149be5e89a2ebfb158f29f305427cb8b2061d6728c53ad1d1b89d4'
            'e15afae1486ac5839e0b114171409bc20c0ad8aa7a58d2846972b9c5a43b2d7a'
            '0e00f0e054687cbc76356d7fb0e860075a27fcf8366ce2b46cb94e92f00a4645')
dest="/usr/share/webapps/piped/${_componentnameshort}"

pkgver() {
	cd Piped-Backend
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	sed -i "s|JARFILE|${dest}/piped-backend.jar|" piped-backend.sh
	sed -i "s|CONFFILE|/etc/webapps/piped/${_componentnameshort}.properties|" tmpfiles.conf

	cd Piped-Backend
	sed -i 's|hibernate.connection.url:jdbc:postgresql://postgres:5432/piped|hibernate.connection.url:jdbc:postgresql:piped?socketFactory=org.newsclub.net.unix.AFUNIXSocketFactory$FactoryArg\&socketFactoryArg=/var/run/postgresql/.s.PGSQL.5432|' config.properties
	sed -i 's|config.properties|/etc/webapps/piped/backend.properties|' src/main/java/me/kavin/piped/consts/Constants.java
	sed -i "s|dependencies {|dependencies {\n    implementation 'com.kohlschutter.junixsocket:junixsocket-core:2.10.0'|" build.gradle
}

build() {
	cd Piped-Backend
	./gradlew shadowJar
}

package() {
	install -Dm644 "${srcdir}/Piped-Backend/config.properties" "${pkgdir}/etc/webapps/piped/${_componentnameshort}.properties"

	install -Dm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${_componentname}.conf"
	install -Dm644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_componentname}.conf"
	install -Dm644 "${srcdir}/systemd.service" "${pkgdir}/usr/lib/systemd/system/${_componentname}.service"

	install -Dm644 "${srcdir}/Piped-Backend/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "${srcdir}/Piped-Backend/build/libs/piped-1.0-all.jar" "${pkgdir}${dest}/piped-backend.jar"
	install -Dm755 "${srcdir}/piped-backend.sh" "${pkgdir}/usr/bin/${_componentname}"
}
