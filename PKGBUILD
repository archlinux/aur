# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=puppeteer
pkgname=($pkgbase{,-core}) #,-chromium,-firefox})
pkgver=25.5.0
pkgrel=1
pkgdesc='JavaScript API for Chrome and Firefox'
arch=(any)
url=https://pptr.dev
license=(Apache-2.0)
depends=(nodejs)
makedepends=(npm)
_archive1="$pkgbase-$pkgver"
_archive2="$pkgbase-core-$pkgver"
source=("https://registry.npmjs.org/$pkgbase/-/$_archive1.tgz"
        "https://registry.npmjs.org/$pkgbase-core/-/$_archive2.tgz")
noextract=("$_archive.tgz")
sha256sums=('53b6633709fc75659eaa9f79af8270d317fd98a0ffd343bc1f32df8ada7debbb'
            '52b57c652a24d69b2cc659888fcce97e26d91af17f46cc58920ada7d0998bdbd')

_npm_i() {
	npm install --no-audit --no-fund -g --prefix "$pkgdir/usr" "$1.tgz"
	find "$pkgdir/usr" -type d -exec chmod 755 {} +
	chown -R root:root "$pkgdir"
}

package_puppeteer() {
	depends+=("$pkgname-core=$pkgver")
	export PUPPETEER_SKIP_DOWNLOAD=true
	_npm_i "$_archive1"
	rm -rf "$pkgdir/usr/lib/node_modules/$pkgname/node_modules/$pkgname-core"
}

package_puppeteer-core() {
	optdepends=('chromium: for use with Chrome'
	            'firefox: for use with Firefox')
	_npm_i "$_archive2"
}

package_puppeteer-chromium() {
	depends+=("$pkgbase=$pkgver" chromium)
}

package_puppeteer-firefox() {
	depends+=("$pkgbase=$pkgver" firefox)
}
