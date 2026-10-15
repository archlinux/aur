# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=sysc-walls
pkgver=1.1.1
pkgrel=2
pkgdesc="A terminal screensaver, designed in Go and built for Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-walls"
license=('GPL-3.0-only')
depends=('kitty' 'wayland')
makedepends=('go>=1.24.2' 'git')
source=("${pkgname}::git+https://github.com/Nomadcxx/${pkgname}.git#commit=522fc4cb07d8b02e93fe4bf9578b4a3361cdbbad")
sha256sums=('e3fbc0b97c10c210f5037e3483492729235c56ea785b6afc188822f48672cfdb')
install=${pkgname}.install

build() {
    cd "${srcdir}/${pkgname}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -buildvcs=true -ldflags "-X github.com/Nomadcxx/sysc-walls/internal/version.Version=${pkgver}" -o "${srcdir}/sysc-walls-daemon" ./cmd/daemon/
    go build -buildvcs=true -ldflags "-X github.com/Nomadcxx/sysc-walls/internal/version.Version=${pkgver}" -o "${srcdir}/sysc-walls-display" ./cmd/display/
    go build -buildvcs=true -ldflags "-X github.com/Nomadcxx/sysc-walls/internal/version.Version=${pkgver}" -o "${srcdir}/sysc-walls-client" ./cmd/client/
}

package() {
    cd "${srcdir}/${pkgname}"

    # Install binaries
    install -Dm755 "${srcdir}/sysc-walls-daemon" "${pkgdir}/usr/bin/sysc-walls-daemon"
    install -Dm755 "${srcdir}/sysc-walls-display" "${pkgdir}/usr/bin/sysc-walls-display"
    install -Dm755 "${srcdir}/sysc-walls-client" "${pkgdir}/usr/bin/sysc-walls-client"

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
