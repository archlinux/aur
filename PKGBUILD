# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=puppeteer
pkgname=($pkgbase{,-core}) #,-chromium,-firefox})
pkgver=25.10.0
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
sha256sums=('43a6eee31582e2aecab646a7ea40de67843166c3bcc61176d7de6f26c5c82030'
            'c0738f7ef070b86c2c55ccf96f734058142df351c6d22702d252aa5a5da560f1')

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
