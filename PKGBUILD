# Maintainer: Your Name <email>

pkgname=firecrawl-cli
pkgver=1.19.2
pkgrel=1
pkgdesc="Command-line interface for Firecrawl - scrape, crawl, and extract data from any website"
arch=('any')
url="https://github.com/firecrawl/cli"
license=('ISC')
depends=('nodejs')
makedepends=('pnpm')
source=("https://github.com/firecrawl/cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2c2f41339af807519090aab0b64a3aab1bbf7933271d645ea44d3a0fe549d3b8')

build() {
	cd "cli-${pkgver}"
	pnpm install --frozen-lockfile
	pnpm run build
	pnpm prune --production
}

package() {
	cd "cli-${pkgver}"

	install -d "${pkgdir}/usr/lib/${pkgname}"
	cp -r dist node_modules package.json "${pkgdir}/usr/lib/${pkgname}/"

	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/firecrawl" << 'EOF'
#!/bin/sh
exec node /usr/lib/firecrawl-cli/dist/index.js "$@"
EOF

	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
