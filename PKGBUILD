# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=moonbit
pkgver=1.2.0
pkgrel=2
pkgdesc="A modern system cleaner built in Go with a TUI and CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/moonbit"
license=('MIT')
depends=('systemd')
optdepends=(
    'docker: Docker cleanup support'
)
makedepends=('go>=1.21')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nomadcxx/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('95e902454ec21c0fe5eb36b9cc948e08c82c1d43275aa06196ba828724e992e7')
install=${pkgname}.install

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -buildvcs=false -o moonbit cmd/main.go
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install binary
    install -Dm755 moonbit "${pkgdir}/usr/local/bin/moonbit"

    # Install systemd service and timer files
    install -Dm644 systemd/moonbit-scan.service "${pkgdir}/etc/systemd/system/moonbit-scan.service"
    install -Dm644 systemd/moonbit-scan.timer "${pkgdir}/etc/systemd/system/moonbit-scan.timer"
    install -Dm644 systemd/moonbit-clean.service "${pkgdir}/etc/systemd/system/moonbit-clean.service"
    install -Dm644 systemd/moonbit-clean.timer "${pkgdir}/etc/systemd/system/moonbit-clean.timer"

    # Install README
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Install LICENSE
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
