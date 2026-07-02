pkgname=kilo-cli-git
pkgver=r24648.5f4c96bad4
pkgrel=1
pkgdesc='Kilo is the all-in-one agentic engineering platform.'
arch=('x86_64')
url='https://github.com/Kilo-Org/kilocode'
license=('MIT')
makedepends=('git')
depends=('bun')
source=(
	"git+https://github.com/Kilo-Org/kilocode.git"
)
sha256sums=(
	'SKIP'
)
provides=('kilo-bin')
conflicts=('kilo-bin')
# Needed due to bun packaging method
options=(!strip)

pkgver() {
	cd "kilocode"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "kilocode"
	bun i
	cd "packages/opencode"
	bun run build --single
}

package() {
	cd "kilocode/packages/opencode"
	install -Dm 755 dist/@kilocode/cli-linux-x64/bin/kilo -t "${pkgdir}/usr/bin"
	install -Dm 755 dist/@kilocode/cli-linux-x64/bin/kilo-sandbox-mutation-worker.js -t "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/bin/tree-sitter"
	install -Dm 755 dist/@kilocode/cli-linux-x64/bin/tree-sitter/* -t "${pkgdir}/usr/bin/tree-sitter"
}
