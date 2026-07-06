# Maintainer: Radu Potop <radu@wooptoo.com>

pkgname=docker-credential-helpers
pkgver=0.9.8
pkgrel=2
pkgdesc='Credential helpers for Docker (pass and secretservice)'
arch=(x86_64)
url="https://github.com/docker/${pkgname}"
license=('MIT')
depends=('libsecret' 'pass')
makedepends=('go')
provides=(
    "docker-credential-pass=${pkgver}"
    "docker-credential-secretservice=${pkgver}"
)
conflicts=(
    'docker-credential-pass'
    'docker-credential-pass-bin'
    'docker-credential-secretservice'
    'docker-credential-secretservice-bin'
)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7954c8bcb271021a7b3a8a992a5eb2828af3b5668659582112f2dd672c5242ba')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    GOFLAGS='-buildmode=pie -mod=vendor' \
        make CGO_CFLAGS="${CFLAGS}" \
        VERSION="v${pkgver}" REVISION=unknown \
        build-pass build-secretservice
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m 0755 bin/build/docker-credential-pass "${pkgdir}/usr/bin/docker-credential-pass"
    install -D -m 0755 bin/build/docker-credential-secretservice "${pkgdir}/usr/bin/docker-credential-secretservice"
    install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
