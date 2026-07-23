# Maintainer: Your Name <email>

pkgname=firecrawl-cli
pkgver=1.19.27
pkgrel=1
pkgdesc="Command-line interface for Firecrawl - scrape, crawl, and extract data from any website"
arch=('any')
url="https://github.com/firecrawl/cli"
license=('ISC')
depends=('nodejs')
makedepends=('pnpm')
source=("https://github.com/firecrawl/cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d0b9a71b21ab329596146fee3c378e7990af33244a4c1d69e3c116767db24bb8')

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
