# Maintainer: Fidel Ramos

pkgname=firecrawl-cli
pkgver=1.19.29
pkgrel=1
pkgdesc="Command-line interface for Firecrawl - scrape, crawl, and extract data from any website"
arch=('x86_64' 'aarch64')
url="https://github.com/firecrawl/cli"
license=('ISC')
makedepends=('bun')
# bun-compiled binaries store the bundled code in a data section that
# strip(1) removes, leaving a bare bun runtime behind
options=('!strip' '!debug')
source=("https://github.com/firecrawl/cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c3c3dafc31af05a60a61df65d256d42338c131497873b6ad0e30b3d3ea7642fd')

build() {
	cd "cli-${pkgver}"
	bun install --frozen-lockfile
	case "$CARCH" in
		x86_64)  _target=bun-linux-x64 ;;
		aarch64) _target=bun-linux-arm64 ;;
	esac
	# same build as upstream's release-binaries.yml workflow
	bun build src/index.ts --compile --target="$_target" --outfile firecrawl
}

package() {
	cd "cli-${pkgver}"

	# same layout as upstream's nfpm.yaml
	install -Dm755 firecrawl "${pkgdir}/usr/bin/firecrawl"

	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
