# Maintainer: Your Name <email>

pkgname=firecrawl-cli
pkgver=1.18.0
pkgrel=1
pkgdesc="Command-line interface for Firecrawl - scrape, crawl, and extract data from any website"
arch=('any')
url="https://github.com/firecrawl/cli"
license=('ISC')
depends=('nodejs')
makedepends=('pnpm')
source=("https://github.com/firecrawl/cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e93b91d91897499997aca43033e9ef14eebb1c2a9fd4652cc56e9f1bf8df8fd8')

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
