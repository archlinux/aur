# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=plex2jellyfin
pkgver=0.1.0
pkgrel=1
pkgdesc="Migrate a Plex library to Jellyfin and keep new downloads clean"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/plex2jellyfin"
license=('GPL-3.0-or-later')
depends=('systemd')
optdepends=(
    'jellyfin-server: companion plugin feedback loop'
    'ollama: optional AI rename assist'
    'sonarr: TV download integration'
    'radarr: movie download integration'
)
# Tagged source ships embedded/frontend/; no npm at build time.
makedepends=('go>=1.25')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nomadcxx/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('12d554de15d9eb461fc77a9e6e0ed8dec70415142a7e54530d9df9bfba29bded')
install=${pkgname}.install

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export CGO_ENABLED=0

    local ldflags="-s -w -X main.version=${pkgver}"

    go build -buildvcs=false -ldflags "${ldflags}" -o plex2jellyfin ./cmd/plex2jellyfin
    go build -buildvcs=false -ldflags "${ldflags}" -o plex2jellyfin-daemon ./cmd/plex2jellyfin-daemon
    go build -buildvcs=false -ldflags "${ldflags}" -o plex2jellyfin-web ./cmd/plex2jellyfin-web
    go build -buildvcs=false -ldflags "${ldflags}" -o plex2jellyfin-installer ./cmd/installer
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 plex2jellyfin "${pkgdir}/usr/bin/plex2jellyfin"
    install -Dm755 plex2jellyfin-daemon "${pkgdir}/usr/bin/plex2jellyfin-daemon"
    install -Dm755 plex2jellyfin-web "${pkgdir}/usr/bin/plex2jellyfin-web"
    install -Dm755 plex2jellyfin-installer "${pkgdir}/usr/bin/plex2jellyfin-installer"

    # Arch units live under /usr/lib; paths must match ExecStart=/usr/bin/...
    install -Dm644 systemd/plex2jellyfin-daemon.service \
        "${pkgdir}/usr/lib/systemd/system/plex2jellyfin-daemon.service"
    install -Dm644 systemd/plex2jellyfin-web.service \
        "${pkgdir}/usr/lib/systemd/system/plex2jellyfin-web.service"

    install -Dm644 config.toml.example \
        "${pkgdir}/usr/share/doc/${pkgname}/config.toml.example"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
