# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=sysc-walls
pkgver=1.1.0
pkgrel=1
pkgdesc="A terminal screensaver, designed in Go and built for Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-walls"
license=('GPL-3.0-only')
depends=('kitty' 'wayland')
makedepends=('go>=1.24.2' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nomadcxx/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b1a8d7c47c5084dfdc0ea5f510681c68e1b971ee82e0e37ba120a74fb81d3067')
install=${pkgname}.install

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"

    go build -buildvcs=false -ldflags "-X github.com/Nomadcxx/sysc-walls/internal/version.Version=${pkgver}" -o sysc-walls-daemon ./cmd/daemon/
    go build -buildvcs=false -ldflags "-X github.com/Nomadcxx/sysc-walls/internal/version.Version=${pkgver}" -o sysc-walls-display ./cmd/display/
    go build -buildvcs=false -ldflags "-X github.com/Nomadcxx/sysc-walls/internal/version.Version=${pkgver}" -o sysc-walls-client ./cmd/client/
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install binaries
    install -Dm755 sysc-walls-daemon "${pkgdir}/usr/bin/sysc-walls-daemon"
    install -Dm755 sysc-walls-display "${pkgdir}/usr/bin/sysc-walls-display"
    install -Dm755 sysc-walls-client "${pkgdir}/usr/bin/sysc-walls-client"

    # Install user service file (patch path for /usr/bin)
    install -d "${pkgdir}/usr/lib/systemd/user"
    sed 's|/usr/local/bin|/usr/bin|g' systemd/sysc-walls-user.service > "${pkgdir}/usr/lib/systemd/user/sysc-walls.service"
    chmod 644 "${pkgdir}/usr/lib/systemd/user/sysc-walls.service"

    # Install default ASCII art (bundled in repo)
    install -Dm644 assets/ascii/SYSC.txt "${pkgdir}/usr/share/sysc-walls/ascii/SYSC.txt"
    install -Dm644 assets/ascii/SYSC2.txt "${pkgdir}/usr/share/sysc-walls/ascii/SYSC2.txt"
    install -Dm644 assets/ascii/SYSC3.txt "${pkgdir}/usr/share/sysc-walls/ascii/SYSC3.txt"

    # Install README
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Install LICENSE
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
