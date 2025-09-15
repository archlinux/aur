# Maintainer: Bert Peters <bertptrs@archlinux.org>
# Contributor: xuhcc <xuhcc at cryptolab dot net>

pkgname=mermaid-cli
pkgver=11.10.1
pkgrel=1
pkgdesc='Generate images from from Mermaid files'
arch=(any)
url="https://github.com/mermaid-js/$pkgname"
license=(MIT)
depends=(nodejs chromium)
makedepends=(npm)
_archive="$pkgname-$pkgver"
source=("https://registry.npmjs.org/@mermaid-js/$pkgname/-/$_archive.tgz")
noextract=("$_archive.tgz")
sha256sums=('478135ef9eec7dd495683e679cddcc00ba52ca8b78286d9f0da253f9c4d83d00')

package() {
	# https://github.com/mermaid-js/mermaid-cli/blob/master/docs/already-installed-chromium.md
	PUPPETEER_SKIP_DOWNLOAD=1 npm install -g --prefix "$pkgdir/usr" "$_archive.tgz"
	sed -i "s# headless: 'shell'# headless: 'shell', executablePath: '/usr/bin/chromium'#" "${pkgdir}/usr/lib/node_modules/@mermaid-js/$pkgname/src/index.js"

	find "$pkgdir" -name prebuilds -type d -exec rm --recursive {} +

	find "$pkgdir/usr" -type d -exec chmod 755 {} +
	chown -R root:root "$pkgdir"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/lib/node_modules/@mermaid-js/$pkgname/LICENSE"
}
