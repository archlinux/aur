# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Hy4 flash Free.
pkgname=wg-portal
pkgver=2.3.1
pkgrel=3
pkgdesc="Web-based WireGuard VPN configuration portal with user management"
arch=('x86_64' 'aarch64')
url="https://github.com/h44z/wg-portal"
license=('MIT')
# runtime: wg-quick/wg are exec'd by the local backend; iptables/nftables for NAT
# (namcap cannot see exec'd helpers and flags this as unused)
depends=('wireguard-tools')
makedepends=('go' 'git' 'pnpm' 'nodejs')
optdepends=(
    'iptables: for NAT/firewall rules'
    'nftables: for NAT/firewall rules (alternative to iptables)'
)
options=('!debug')
backup=('etc/wg-portal/config.yml')
install=wg-portal.install

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/h44z/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.service"
    "config.yml"
    "${pkgname}.install"
)
b2sums=(
    'fc371b540a91797a83261952655b585655f095a853451da554a986de1f13a847533864a33e4526a06811a5146e6606c91ffb1db4e76f5133a9309b428d098199'
    '894b53b5e5a059f49340c7e470f3b4a1355c1545b7fe1bb86e2a026fcbf81802fdae6ba24200c3154a168c9899b498e3375730f5412f65e9967c020c908e604a'
    '560839a9344c23531d5e94faeb40cb793275254175c43b5f66e2d980ce7a3a2cd7a26df8f62e6353496ceca6dd7dd4dbde7be9daaa085094b61b9f6fee91d849'
    '51d851c79614336c50394914b1993ab88eafe1cdfe92966bbcf4b3a1a46e2b91e7c218e694d1990b40b23486bcb5f93a6f7626abbfd61cb9422bbb9d6b3a3a1c'
)

prepare() {
    cd "${pkgname}-${pkgver}"

    # Build frontend assets.
    # Upstream ships only package-lock.json (npm), no pnpm lockfile, and the
    # locked "vue-prism-component" entry is a git+ssh dependency that npm ci
    # refuses to fetch, so pnpm is the working installer here.
    # pnpm 10+ blocks dependency build scripts and aborts the whole install
    # with ERR_PNPM_IGNORED_BUILDS (e.g. @parcel/watcher). Vite only needs the
    # prebuilt binaries that come as optional dependencies, so skip the
    # scripts instead of approving them.
    cd frontend
    pnpm install --no-frozen-lockfile --ignore-scripts
    pnpm build
    cd ..

    # Download Go dependencies
    go mod download
}

build() {
    cd "${pkgname}-${pkgver}"

    export CGO_ENABLED=0

    go build \
        -trimpath \
        -ldflags "-w -s -X 'github.com/h44z/wg-portal/internal.Version=v${pkgver}'" \
        -tags netgo \
        -o dist/wg-portal \
        cmd/wg-portal/main.go
}

package() {
    cd "${pkgname}-${pkgver}"

    # Binary
    install -Dm755 dist/wg-portal "${pkgdir}/usr/bin/wg-portal"

    # License
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Default config
    install -Dm640 "${srcdir}/config.yml" \
        "${pkgdir}/etc/wg-portal/config.yml"

    # systemd service
    install -Dm644 "${srcdir}/${pkgname}.service" \
        "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
