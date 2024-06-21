# Maintainer: Marius Hirt <marius-hirt@web.de>
pkgname=k8sgpt
pkgver=0.3.37
_commit=3f80bba
pkgrel=1
pkgdesc='A tool for scanning your Kubernetes clusters, diagnosing, and triaging issues in simple English.'
arch=('x86_64')
url='https://k8sgpt.ai/'
license=('Apache-2.0')
provides=('k8sgpt')
conflicts=('k8sgpt')
makedepends=('go')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/k8sgpt-ai/k8sgpt/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=(
    '30cf355e51c3baa2a62c690ff57eaf1ac4b88e1b6898626a4dd61670bc435822'
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export CGO_ENAGBLED=0
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build -o "bin/${pkgname}" \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-s -w -X main.version=${pkgver} -X main.commit=${_commit} -X main.date=$(date +%FT%TZ)" \
        ./main.go
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go test ./...
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/bin/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"
}
