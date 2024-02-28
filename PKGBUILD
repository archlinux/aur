# Maintainer: wansing <mail at wansing dot org>
pkgname=croodle-git
pkgver=r1526.01f1534
pkgrel=2
pkgdesc="a web application to schedule a date or to do a poll on a general topics"
arch=("any")
url="https://github.com/jelhan/croodle"
license=("MIT")
depends=("php")
makedepends=('composer' 'git' 'nodejs' 'npm')
provides=('croodle')
conflicts=('croodle')
source=(
	"git+https://github.com/jelhan/croodle.git"
	"croodle.conf"
	"croodle.sysusers"
	"croodle.tmpfiles"
	"croodle-cron.service"
	"croodle-cron.timer"
)
backup=(
	"etc/php/php-fpm.d/croodle.conf"
	"etc/webapps/croodle/config.php"
)
sha256sums=('SKIP'
            '20bf0f6e542274b97a1cb4efb28abd89567638f8c0059b77adb7d791375d9d88'
            '1996262b7849b79a7f2c330651613c96a40dfec3ccf51f7d5eb8564d25e22627'
            'b3307d22c5a81b71870bc9836123cd47a49605bb1bb65fa0a25ea0050d4c9c38'
            '1b67171535fcb21d0dcc9738f6e47d32c735b49313ae3a9d967fb65befbe4e2e'
            '0e2520a6f3bfa7283a5ccb91bb6cbaade1333efdd82b9256bc61be36020fe0e3')

pkgver() {
	cd "$srcdir/croodle"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/croodle"
	npm install
	cd api/ && composer install --no-dev && cd ..
	npm run build
}

package() {
	cd "$srcdir/croodle"
	mkdir -p "${pkgdir}/usr/share/webapps/croodle"
	cp -R dist/* "${pkgdir}/usr/share/webapps/croodle"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/croodle/LICENSE"
	install -Dm644 "${pkgdir}/usr/share/webapps/croodle/api/config.default.php" "${pkgdir}/etc/webapps/croodle/config.php"
	ln -s "/etc/webapps/croodle/config.php" "${pkgdir}/usr/share/webapps/croodle/api/config.php"
	rm -r "${pkgdir}/usr/share/webapps/croodle/data"
	ln -s "/var/lib/croodle/" "${pkgdir}/usr/share/webapps/croodle/data"
	install -Dm644 "../croodle.conf" "${pkgdir}/etc/php/php-fpm.d/croodle.conf"
	install -Dm644 "../croodle.sysusers" "${pkgdir}/usr/lib/sysusers.d/croodle.conf"
	install -Dm644 "../croodle.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/croodle.conf"
	install -Dm644 "../croodle-cron.service" "${pkgdir}/usr/lib/systemd/system/croodle-cron.service"
	install -Dm644 "../croodle-cron.timer" "${pkgdir}/usr/lib/systemd/system/croodle-cron.timer"
}
