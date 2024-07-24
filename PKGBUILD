# Maintainer: Marius Hirt <marius-hirt@web.de>
pkgname=k8sgpt
pkgver=0.3.39
_commit=3c08118
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
    'b2a523a4c1b9d6f968388c09c333d0e710ad694d7f840dc7e7eaca90b314ab8b'
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
