# Maintainer: 30p87 <30p87@30p87.de>
pkgname='piped-backend-git'
pkgver=r1261.01e2cf1
pkgrel=1
pkgdesc='An advanced open-source privacy friendly alternative to YouTube'
arch=('x86_64')
url='https://github.com/TeamPiped/Piped-Backend'
license=('AGPL-3.0')
groups=('piped-git')
depends=('java-runtime=22')
makedepends=('git' 'jdk-openjdk')
source=('git+https://github.com/TeamPiped/Piped-Backend.git'
		'piped-backend.sh'
		'sysusers.conf'
		'systemd.service')
sha256sums=('SKIP'
            'e0afaf2c1ecde9b9d0c472654a1de625ed39ca14be69c41ec4ea5dba18bb4817'
            'f04ddc4d9bf5a114e302fec532e7874c7d3c9d58e81103f17649a0d0228bb096'
            '0e00f0e054687cbc76356d7fb0e860075a27fcf8366ce2b46cb94e92f00a4645')

pkgver() {
	cd Piped-Backend
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd Piped-Backend
	sed -i 's|hibernate.connection.url:jdbc:postgresql://postgres:5432/piped|hibernate.connection.url:jdbc:postgresql:piped?socket=socketFactory=org.newsclub.net.unix.AFUNIXSocketFactory$FactoryArg\&socketFactoryArg=/var/run/postgresql/.s.PGSQL.5432|' config.properties
	sed -i 's|config.properties|/etc/piped/backend.properties|' src/main/java/me/kavin/piped/consts/Constants.java
	sed -i "s|dependencies {|dependencies {\n    implementation 'com.kohlschutter.junixsocket:junixsocket-core:2.10.0'|" build.gradle
}

build() {
	cd Piped-Backend
	./gradlew shadowJar
}

package() {
	generaldest="/usr/share/webapps/piped"
	dest="${generaldest}/backend"

	sed -i "s|HOMEDIR|${generaldest}|" "${srcdir}/sysusers.conf"
	sed -i "s|PIPEDBACKENDPATH|${dest}/piped-backend.jar|" "${srcdir}/piped-backend.sh"

	install -dm755 "${pkgdir}/etc/piped"

	install -Dm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/piped-backend.conf"
	install -Dm644 "${srcdir}/systemd.service" "${pkgdir}/usr/lib/systemd/system/piped-backend.service"

	install -Dm644 "${srcdir}/Piped-Backend/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/Piped-Backend/config.properties" "${pkgdir}/usr/share/doc/piped/piped-backend.properties"

	install -Dm755 "${srcdir}/Piped-Backend/build/libs/piped-1.0-all.jar" "${pkgdir}${dest}/piped-backend.jar"
	install -Dm755 "${srcdir}/piped-backend.sh" "${pkgdir}/usr/bin/piped-backend"

#find "${pkgdir}${dest}" -type d -exec chmod u+x,g+x,o+x {} \;
#chown -R piped:piped "${pkgdir}/${generaldest}"
}
