# Maintainer: Conor Finn <finnconor@gmail.com>
pkgname=ccflare-git
pkgver=r198.95c4c6a
pkgrel=1
pkgdesc="Open-source proxy server for the Anthropic Claude API with monitoring, load balancing, and rate limiting"
arch=('any')
url="https://github.com/snipeship/ccflare"
license=('MIT')
depends=('bun')
makedepends=('git')
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
    bun install --frozen-lockfile
    bun run build:dashboard
}

package() {
    cd "${pkgname}"

    # Install source to /usr/lib/ccflare
    install -dm755 "${pkgdir}/usr/lib/ccflare"
    cp -a apps packages node_modules package.json bun.lock tsconfig.json "${pkgdir}/usr/lib/ccflare/"

    # Wrapper scripts
    install -dm755 "${pkgdir}/usr/bin"

    cat > "${pkgdir}/usr/bin/ccflare" << 'EOF'
#!/bin/sh
cd /usr/lib/ccflare
exec bun run apps/tui/src/main.ts "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/ccflare"

    cat > "${pkgdir}/usr/bin/ccflare-server" << 'EOF'
#!/bin/sh
cd /usr/lib/ccflare
exec bun run apps/server/src/server.ts "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/ccflare-server"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
