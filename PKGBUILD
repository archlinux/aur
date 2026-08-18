# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=moonbit
pkgver=1.5.1
pkgrel=1
pkgdesc="A system cleaner for Linux, with a TUI and a CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/moonbit"
license=('GPL-3.0-only')
depends=('systemd')
optdepends=(
    'docker: Docker cleanup support'
)
makedepends=('go>=1.24')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nomadcxx/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('553af172304da104dcba50ba31ae550e118abf1cbaae91c014d7ba3e7caf5df7')
install=${pkgname}.install

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    # Carry version metadata into the binary so `moonbit --version` is accurate
    # for package builds too, not just `make build`.
    go build -buildvcs=false \
        -ldflags "-X main.Version=${pkgver}-${pkgrel} -X main.BuildTime=$(date -u -d "@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%dT%H:%M:%SZ)" \
        -o moonbit cmd/main.go
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Packaged files belong in /usr/bin. /usr/local is reserved for the local
    # admin -- a pacman-managed file there collides with the from-source
    # installer, which correctly installs to /usr/local/bin.
    install -Dm755 moonbit "${pkgdir}/usr/bin/moonbit"

    # Install systemd service and timer files. The units ship with
    # ExecStart=/usr/local/bin/moonbit for the from-source install path, so
    # rewrite them to match where this package actually puts the binary.
    for unit in moonbit-scan.service moonbit-scan.timer \
                moonbit-clean.service moonbit-clean.timer \
                moonbit-daemon.service; do
        install -Dm644 "systemd/${unit}" "${pkgdir}/etc/systemd/system/${unit}"
        sed -i 's|/usr/local/bin/moonbit|/usr/bin/moonbit|g' \
            "${pkgdir}/etc/systemd/system/${unit}"
    done

    # Desktop launcher. pkexec sanitises PATH to /usr/sbin:/usr/bin:/sbin:/bin,
    # so Exec must be absolute; rewrite it from the from-source /usr/local/bin.
    install -Dm644 packaging/moonbit.desktop "${pkgdir}/usr/share/applications/moonbit.desktop"
    sed -i 's|/usr/local/bin/moonbit|/usr/bin/moonbit|g' \
        "${pkgdir}/usr/share/applications/moonbit.desktop"
    install -Dm644 packaging/moonbit.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/moonbit.svg"

    # Create log and run directories
    install -dm755 "${pkgdir}/var/log/moonbit"

    # Install README
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Install LICENSE
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
