# Maintainer: Sebastian Stepper <sebastian-stepper@gmx.de>
pkgname=bab
pkgver=0.0.4
pkgrel=1
pkgdesc="Custom commands for your projects"
arch=('x86_64' 'aarch64')
url="https://github.com/bab-sh/bab"
license=('MIT')
depends=()
makedepends=('go>=1.25.1')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bab-sh/bab/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c1b7b551733e4e81d8a6fc4976a88c59702f1cc324c765375e8a50a31b78311e')

prepare() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build/
}

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export SOURCE_DATE_EPOCH=${SOURCE_DATE_EPOCH:-$(date +%s)}

    go build \
        -ldflags "-s -w \
            -X github.com/bab-sh/bab/internal/version.Version=${pkgver} \
            -X github.com/bab-sh/bab/internal/version.Commit=AUR \
            -X github.com/bab-sh/bab/internal/version.Date=$(date -u -d @${SOURCE_DATE_EPOCH} +%Y-%m-%dT%H:%M:%SZ) \
            -X github.com/bab-sh/bab/internal/version.BuiltBy=makepkg" \
        -o build/${pkgname} \
        .
}

check() {
    cd "${pkgname}-${pkgver}"
    go test -v ./...
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
