# Maintainer: Shulhan <ms@kilabit.info>

pkgname=questdb-git
pkgver=7.0.1.r16.g7fa73a2863
pkgrel=1
pkgdesc='Fast timeseries database'
conflicts=(questdb)
provides=(questdb)
arch=('any')
url='https://questdb.io'
license=('APACHE')
makedepends=('git' 'maven' 'java-environment')
depends=('java-runtime' 'bash')
source=("$pkgname::git+https://github.com/questdb/questdb.git"
	'questdb.sh'
	'questdb.sysusers'
	'questdb-tmpfile.conf'
	'questdb.service')
sha1sums=('SKIP'
          '203b1916ebf8547cad1b144509029126d970836b'
          '79459d2e7ab4a78364359cb40368bbc0778fd9cf'
          'bcd990f6257a0501c82a03384a9d4c5703b03abb'
          'ec5400e458e7511abb8e455710041352f15b87ab')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//; s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	mvn clean package -DskipTests -P build-web-console
}

package() {
	cd "$pkgname"

	mkdir -p ${pkgdir}/{usr/bin,usr/share/java/questdb,etc/questdb,var/lib/questdb}

	install -Dm644 core/target/questdb-*-SNAPSHOT.jar ${pkgdir}/usr/share/java/questdb/questdb.jar

	install -Dm755 ${srcdir}/questdb.sh ${pkgdir}/usr/bin/questdb
	install -Dm644 ${srcdir}/questdb.service ${pkgdir}/usr/lib/systemd/system/questdb.service
	install -Dm644 ${srcdir}/questdb.sysusers ${pkgdir}/usr/lib/sysusers.d/questdb.conf
	install -Dm644 ${srcdir}/questdb-tmpfile.conf ${pkgdir}/usr/lib/tmpfiles.d/questdb.conf
}
