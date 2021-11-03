# Maintainer: Mathias Merscher <archlinux@rheinekopfsache.de>
# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname=tfsec
pkgver=0.58.15
pkgrel=1
pkgdesc="Static analysis powered security scanner for your terraform code"
depends=('glibc')
makedepends=('go')
arch=(x86_64)
url="https://github.com/aquasecurity/tfsec"
license=('MIT')

source=("v${pkgver}-${pkgrel}.zip::${url}/archive/refs/tags/v${pkgver}.zip")

sha256sums=('2ec1df4981d888fdf8a2cdfa6a59f0afa92f05b65674ac0fcd62613cc64ae0ce')

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
