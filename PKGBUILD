# Maintainer: Marius Hirt <marius-hirt@web.de>
pkgname=k8sgpt
pkgver=0.3.35
pkgrel=2
pkgdesc='A tool for scanning your Kubernetes clusters, diagnosing, and triaging issues in simple English.'
arch=('x86_64' 'arm64' 'i386')
url='https://k8sgpt.ai/'
license=('Apache-2.0')
provides=('k8sgpt')
conflicts=('k8sgpt')
makedepends=('go')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/k8sgpt-ai/k8sgpt/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=(
    '1f35e61e60f35a1ddcb3a806f93fa2e0465599a508d080326c59e394186cb1d8'
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export CGO_ENAGBLED=0
    export GOPATH="${srcdir}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build -o "bin/${pkgname}" \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-s -w -X main.version=${pkgver} -X main.date=$(date +%FT%TZ) -compressdwarf=false -linkmode external" \
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
