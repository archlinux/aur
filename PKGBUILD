pkgname=batctl-tui
pkgver=2026.3.6
pkgrel=1
pkgdesc="TUI and CLI tool for managing battery charge thresholds on Linux laptops"
arch=('x86_64' 'aarch64')
url="https://github.com/Ooooze/batctl"
license=('MIT')
depends=('glibc')
makedepends=('go')
options=(!debug)
backup=('etc/batctl.conf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('61c66be2f1627f0165eb2fbc45f42271dd42361d2897a6358ba4164192ec4592')

build() {
    cd "${srcdir}/batctl-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -ldflags "-s -w" -o batctl ./cmd/batctl/
}

package() {
    cd "${srcdir}/batctl-${pkgver}"
    install -Dm755 batctl "${pkgdir}/usr/bin/batctl"
    install -Dm644 configs/batctl.service "${pkgdir}/usr/lib/systemd/system/batctl.service"
    install -Dm644 configs/batctl-resume.service "${pkgdir}/usr/lib/systemd/system/batctl-resume.service"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
