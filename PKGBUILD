# Maintainer: Kasimir Wansing <kasimir at wansing dot org>
pkgname=croodle-git
pkgver=r1191.fb5981e
pkgrel=2
pkgdesc="a web application to schedule a date or to do a poll on a general topics"
arch=("any")
url="https://github.com/jelhan/croodle"
license=("MIT")
depends=("php")
makedepends=('composer' 'git' 'nodejs-lts-fermium' 'yarn')
provides=("croodle")
source=(
	"git+https://github.com/jelhan/croodle.git"
	"croodle.conf"
	"croodle.sysusers"
	"croodle.tmpfiles"
	"croodle-cron.service"
	"croodle-cron.timer"
)
sha256sums=('SKIP'
            '083d590dbb293dad54a5d0347acf564ebcd709369d398bcfbf70e82b848daef1'
            '1996262b7849b79a7f2c330651613c96a40dfec3ccf51f7d5eb8564d25e22627'
            '88a0ca17ad5a90b927e4275fb2245e569ecbde7e059033529cafdcc66b9b2a14'
            '1b67171535fcb21d0dcc9738f6e47d32c735b49313ae3a9d967fb65befbe4e2e'
            '0e2520a6f3bfa7283a5ccb91bb6cbaade1333efdd82b9256bc61be36020fe0e3')

pkgver() {
	cd "$srcdir/croodle"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/croodle"
	yarn install
	cd api/ && composer install --no-dev --no-interaction && cd ..
	yarn build --prod
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
