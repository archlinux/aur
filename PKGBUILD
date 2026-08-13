# Maintainer: 30p87 <aur@30p87.de>

pkgname='piped-backend-git'
_componentname="${pkgname%'-git'}"
_componentnameshort="${_componentname#'piped-'}"
pkgver=r1322.6d0ad06
pkgrel=2
pkgdesc='An alternative privacy-friendly YouTube frontend which is efficient by design. Backend/API component, for fetching Metadata'
arch=('x86_64')
url='https://github.com/TeamPiped/Piped-Backend'
license=('AGPL-3.0')
groups=('piped-git')
depends=('java-runtime>=21' 'postgresql')
makedepends=('git' 'java-environment=21')
backup=("etc/webapps/piped/${_componentnameshort}.properties")
source=("git+${url}"
		'piped-backend.sh'
		'nginx.conf'
		'sysusers.conf'
		'tmpfiles.conf'
		'systemd.service'
		'systemd-restart.service'
		'systemd-restart.timer')
sha256sums=('SKIP'
            '3f62b54ab1567ee6f7a5e419f74422419c499a05f19a90fe946b3396b7c29624'
            '75f078c3456e562ba97d2aef1f6fcba5c22a29bd73e269dd86311adbd5d99f7c'
            'eb122e1cf5149be5e89a2ebfb158f29f305427cb8b2061d6728c53ad1d1b89d4'
            'd4e3d538e0f3c40bb22ebd2893672eeafeeaacadccf53e46055450f99c96e12d'
            '782e6dbd367e7c29090175413ea55ab9f2a45bfbe2ee6f5078a420fab0891648'
            '2094c5823cd476afd5b90831c5465fc62e0e8fa875bde6beb0b193d46d3178d3'
            'bee96e746ef168b6cbce17e7af2118bb4321f10f309f51b3897fb145213d0ae1')
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
	sed -i "s|implementation 'com.github.FireMasterK:NewPipeExtractor:c83884eb5d2e9f077348acec3a2d9e9dc920ae91'|implementation 'com.github.TeamNewPipe:NewPipeExtractor:v0.26.4'|" build.gradle
	sed -i "s|implementation 'com.github.FireMasterK:nanojson:a507525e549a836c3a8b6ab7090dca38e92942ef'|implementation 'com.github.TeamNewPipe:nanojson:c7a6c1c08d16b6d5ecded34758e6415e07be2166'|" build.gradle
}

build() {
	cd Piped-Backend
	
	./gradlew shadowJar -Dorg.gradle.java.home=/usr/lib/jvm/java-21-openjdk
}

package() {
	install -Dm644 "${srcdir}/Piped-Backend/config.properties" "${pkgdir}/etc/webapps/piped/${_componentnameshort}.properties"

	install -Dm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${_componentname}.conf"
	install -Dm644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_componentname}.conf"
	install -Dm644 "${srcdir}/systemd.service" "${pkgdir}/usr/lib/systemd/system/${_componentname}.service"
	install -Dm644 "${srcdir}/systemd-restart.service" "${pkgdir}/usr/lib/systemd/system/${_componentname}-restart.service"
	install -Dm644 "${srcdir}/systemd-restart.timer" "${pkgdir}/usr/lib/systemd/system/${_componentname}-restart.timer"

	install -Dm644 "${srcdir}/Piped-Backend/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/nginx.conf" "${pkgdir}/usr/share/doc/piped/${_componentnameshort}/nginx.conf"

	install -Dm755 "${srcdir}/Piped-Backend/build/libs/piped-1.0-all.jar" "${pkgdir}${dest}/piped-backend.jar"
	install -Dm755 "${srcdir}/piped-backend.sh" "${pkgdir}/usr/bin/${_componentname}"
}
