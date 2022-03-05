# Maintainer: Mathias Merscher <archlinux@rheinekopfsache.de>
# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname=tfsec
pkgver=1.6.0
pkgrel=1
pkgdesc="Static analysis powered security scanner for your terraform code"
depends=('glibc')
makedepends=('go')
arch=(x86_64)
url="https://github.com/aquasecurity/tfsec"
license=('MIT')

source=("v${pkgver}-${pkgrel}.zip::${url}/archive/refs/tags/v${pkgver}.zip")

sha256sums=('c9f879ee3978540467fe4ac8cb2e30cdfb25a72e65d7c6a87b04314663dd827a')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    _flags=(
        -X=github.com/aquasecurity/tfsec/version.Version=v${pkgver}
        -s -w
        -linkmode=external
    )

    cd "${pkgname}-${pkgver}"

    go build \
        -buildmode=pie \
        -trimpath \
        -modcacherw \
        -mod=readonly \
        -ldflags="${_flags[*]}" \
        -o "${pkgname}" \
        ./cmd/"${pkgname}"
}

check () {
    cd "${pkgname}-${pkgver}"
    go test -v ./...
}

package() {
    install -D -m755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
