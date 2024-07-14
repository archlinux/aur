# Maintainer: Young Acinonyx <young [dot] acinonyx [at] gmail [dot] com>

pkgname=skyscraper-git
pkgver=r3075.0e3fa5d
pkgrel=1
pkgdesc="Powerful and versatile game scraper written in C++. Gemba's fork."
arch=('any')
url="https://github.com/Gemba/skyscraper"
license=('GPL-3.0-only')
depends=('python-pandas')
makedepends=('qt5-base' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Gemba/skyscraper.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
        cd "$srcdir/${pkgname%-git}"
	sed -i 's_$${PREFIX}/bin_$${PREFIX}/usr/bin_g' "$srcdir/${pkgname%-git}/${pkgname%-git}.pro"
	sed -i 's_/usr/local/bin_/usr/bin_g' "$srcdir/${pkgname%-git}/supplementary/scraperdata/peas_and_idmap_verify.py"
	sed -i 's_/usr/local/etc_/etc_g' "$srcdir/${pkgname%-git}/supplementary/scraperdata/peas_and_idmap_verify.py"
	sed -i 's_/usr/local/bin_/usr/bin_g' "$srcdir/${pkgname%-git}/supplementary/scraperdata/check_screenscraper_json_to_idmap.py"
	sed -i 's_/usr/local/etc_/etc_g' "$srcdir/${pkgname%-git}/supplementary/scraperdata/check_screenscraper_json_to_idmap.py"
	sed -i 's_/usr/local/bin_/usr/bin_g' "$srcdir/${pkgname%-git}/supplementary/bash-completion/Skyscraper.bash"
	chmod 755 "$srcdir/${pkgname%-git}/supplementary/scraperdata/check_screenscraper_json_to_idmap.py"
	chmod 755 "$srcdir/${pkgname%-git}/supplementary/scraperdata/convert_platforms_json.py"
	chmod 755 "$srcdir/${pkgname%-git}/supplementary/scraperdata/peas_and_idmap_verify.py"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	PREFIX=/ qmake
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" DESTDIR="$pkgdir/" install
}
