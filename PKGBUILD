# Maintainer: Your Name <email>

pkgname=firecrawl-cli
pkgver=1.19.18
pkgrel=1
pkgdesc="Command-line interface for Firecrawl - scrape, crawl, and extract data from any website"
arch=('any')
url="https://github.com/firecrawl/cli"
license=('ISC')
depends=('nodejs')
makedepends=('pnpm')
source=("https://github.com/firecrawl/cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e67bcb264de7b3a6b5f9ee126b07799c521d3e3a090865de0e3675886a33eef3')

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
