# Maintainer: Fidel Ramos

pkgname=firecrawl-cli
pkgver=1.27.0
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
sha256sums=('12f33062ee401efdf6324619708bc85359857a377305e95ff9f44d5cb4ee8376')

build() {
	cd "cli-${pkgver}"
	bun install --frozen-lockfile
	case "$CARCH" in
		x86_64)  _target=bun-linux-x64 ;;
		aarch64) _target=bun-linux-arm64 ;;
	esac
	# same build as upstream's release-binaries.yml workflow
	# bun inlines __dirname at build time, which would otherwise leak $srcdir
	# into the binary; point it at the compiled binary's virtual root instead
	bun build src/index.ts --compile --target="$_target" \
		--define '__dirname="/$bunfs/root"' \
		--outfile firecrawl
}

package() {
	cd "cli-${pkgver}"

	# same layout as upstream's nfpm.yaml
	install -Dm755 firecrawl "${pkgdir}/usr/bin/firecrawl"

	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
