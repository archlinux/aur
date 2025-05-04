# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Fabian Köhler <fabian.koehler@protonmail.ch>

pkgname=dsnet
_pkgname=${pkgname}
pkgver=0.8.0
pkgrel=1
pkgdesc="Simple command to manage a centralised wireguard VPN."
arch=(x86_64)
url="https://github.com/naggie/dsnet"
license=(MIT)
makedepends=("go" "git")
depends=("glibc")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "systemd.patch")
sha256sums=('c063109a3a33757e416fb4693b48d63941ea2e7d8faf54b84123c6ff5c0ef1d3'
            'c6df08c39903daf29dc03cda1b0723690ec40c85b75b8f5f9a736ba1189002cd')


prepare() {
    cd "${pkgname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/systemd.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build \
        -o dsnet \
        ./cmd
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "dsnet" "${pkgdir}/usr/bin/dsnet"
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "etc/dsnet.service" "${pkgdir}/usr/lib/systemd/system/dsnet.service"
}
