# Maintainer: Conor Finn <finnconor@gmail.com>
pkgname=ccflare-git
pkgver=r197.6889212
pkgrel=1
pkgdesc="Open-source proxy server for the Anthropic Claude API with monitoring, load balancing, and rate limiting"
arch=('x86_64' 'aarch64')
url="https://github.com/snipeship/ccflare"
license=('MIT')
makedepends=('bun' 'git')
provides=('ccflare')
conflicts=('ccflare')
source=("${pkgname}::git+https://github.com/snipeship/ccflare.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    bun install
    bun run build
    cd apps/server && bun run build
}

package() {
    cd "${pkgname}"
    install -Dm755 apps/tui/dist/ccflare "${pkgdir}/usr/bin/ccflare"
    install -Dm755 apps/server/dist/ccflare-server "${pkgdir}/usr/bin/ccflare-server"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
