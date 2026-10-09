# Maintainer: Radu Potop <radu@wooptoo.com>

pkgname=docker-credential-helpers
pkgver=0.9.10
pkgrel=1
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
sha256sums=('547d0cb12c15faedced31487e6a456c63c0faa6e53895da076619733ef8917eb')

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
