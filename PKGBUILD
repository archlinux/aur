# Maintainer: 30p87 <aur@30p87.de>

pkgname='piped-backend-git'
_componentname="${pkgname%'-git'}"
_componentnameshort="${_componentname#'piped-'}"
pkgver=r1316.c5921f6
pkgrel=1
pkgdesc='An alternative privacy-friendly YouTube frontend which is efficient by design. Backend/API component, for fetching Metadata'
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
		'nginx.conf'
		'systemd.service')
sha256sums=('SKIP'
            '3f62b54ab1567ee6f7a5e419f74422419c499a05f19a90fe946b3396b7c29624'
            'eb122e1cf5149be5e89a2ebfb158f29f305427cb8b2061d6728c53ad1d1b89d4'
            'd4e3d538e0f3c40bb22ebd2893672eeafeeaacadccf53e46055450f99c96e12d'
            '232a2353341b83060a5c3814e95553d9b476d65c7ae06147e7034b1c729814be'
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

	# Fix for https://github.com/TeamPiped/Piped/issues/4139
	git clone https://github.com/TeamNewPipe/NewPipeExtractor.git
	cd NewPipeExtractor
	git checkout 05e0e4ced7b6ff05f3d68d831efed8bdf588f9ac
	git switch -c needs-to-be-reloaded-fix
	git remote add AudricV https://github.com/AudricV/NewPipeExtractor.git
	git fetch AudricV
	git cherry-pick -n cfa985451eb11bbf812fecf57d74d9ed9da0eb3f
	cd ..
	echo 'includeBuild("NewPipeExtractor")' >> settings.gradle
	sed -i "s|implementation 'com.github.FireMasterK:NewPipeExtractor:92809cedefd89ce68bc4de8763e9d5f2760f5899'|implementation 'com.github.TeamNewPipe:extractor:v0.24.8'|" build.gradle 

	./gradlew shadowJar
}

package() {
	install -Dm644 "${srcdir}/Piped-Backend/config.properties" "${pkgdir}/etc/webapps/piped/${_componentnameshort}.properties"

	install -Dm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${_componentname}.conf"
	install -Dm644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_componentname}.conf"
	install -Dm644 "${srcdir}/systemd.service" "${pkgdir}/usr/lib/systemd/system/${_componentname}.service"

	install -Dm644 "${srcdir}/Piped-Backend/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/nginx.conf" "${pkgdir}/usr/share/doc/piped/${_componentnameshort}/nginx.conf"

	install -Dm755 "${srcdir}/Piped-Backend/build/libs/piped-1.0-all.jar" "${pkgdir}${dest}/piped-backend.jar"
	install -Dm755 "${srcdir}/piped-backend.sh" "${pkgdir}/usr/bin/${_componentname}"
}
