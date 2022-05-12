# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=icinga-php-library
pkgver=0.8.1
pkgrel=1
pkgdesc="Bundle for all Icinga PHP libraries"
arch=(any)
makedepends=('patchutils')
url="https://github.com/Icinga/icinga-php-library"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Icinga/icinga-php-library/archive/refs/tags/v$pkgver.tar.gz"
        'ipl-html-php-8.1.patch::https://github.com/Icinga/ipl-html/pull/59.patch'
        'ipl-i18n-php-8.1.patch::https://github.com/Icinga/ipl-i18n/pull/12.patch'
        'ipl-orm-php-8.1.patch::https://github.com/Icinga/ipl-orm/pull/35.patch'
        'ipl-sql-php-8.1.patch::https://github.com/Icinga/ipl-sql/pull/47.patch'
        'ipl-stdlib-php-8.1.patch::https://github.com/Icinga/ipl-stdlib/pull/29.patch'
        'ipl-validator-php-8.1.patch::https://github.com/Icinga/ipl-validator/pull/5.patch'
        'ipl-web-php-8.1.patch::https://github.com/Icinga/ipl-web/pull/64.patch')
sha256sums=('0c32b0468b2563c02b94a7a39da852a8c58796a9fc34c3b23311a2edd636fd81'
            '951039b04a4b8a812eb4a6c423542e01bd96a139bffacf2dd8f068b41f1693b5'
            '2129194b5ee1b6f20d833608922774e0a85d0254c0f8f71cb2b0b53ea5cad5ee'
            'c1a22b9c720c99e63a3853c006218405c77d821dec9d8f92ccf56545760f3a52'
            '23c8719af42127f6c591def515fcc761e0630161ead98d18a151f4b1c8e8f81f'
            '3863d09aa1cfd33b979698bc446688ec84bb6c1cd9ec5e3d217af83ead2822a2'
            '6781dbd24ffb1009bee3a4b778fd7f9f08e6217c30b7991227259da4099e6e64'
            '23f19247a9e6c2d32bd8906dd699703ea3f618ffe7aa3f3e4a183f30cc6f3799')

prepare() {
	cd "$pkgname-$pkgver"

	for d in vendor/ipl/*; do
		echo "Patching $d:"
		pushd "$d" > /dev/null
		filterdiff -p1 -i 'src/*' < "$srcdir/ipl-$(basename "$d")-php-8.1.patch" | patch -p1
		popd > /dev/null
	done

	sed -i '/polyfill-php71\.php/d' vendor/composer/autoload_{files,static}.php
}

package() {
	cd "$pkgname-$pkgver"

	install -dm755 "$pkgdir/usr/share/icinga-php"
	cp -rT . "$pkgdir/usr/share/icinga-php/ipl"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
