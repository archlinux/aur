# Maintainer: Marius Hirt <marius-hirt@web.de>
pkgname=k8sgpt
pkgver=0.3.40
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
    'ae61537ae5b3ab733fe3d29218a3abe5376337e1765f0456c82e88abb9c6bcfe'
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
