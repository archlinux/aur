# Maintainer: Gautham Velchuru <gvelchuru@gmail.com>
# Co-Maintainer: Konstantin Gizdov <arch at kge dot pw>
pkgname=vale
pkgver=2.4.0
pkgrel=1
pkgdesc="A customizable, syntax-aware linter for prose"
arch=('i686' 'x86_64')
url="https://github.com/errata-ai/vale"
license=('MIT')
makedepends=('go' 'go-bindata' 'rsync')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d99aeea5d0e93a96088f849db05520f7b531f211d158e9538a46eb2ca7931f3e')

build() {
    cd "${srcdir}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export GOPATH="${srcdir}/gopath"
    export PATH="${srcdir}/gopath/bin:$PATH"
    mkdir -p "${srcdir}/gopath/src/github.com/errata-ai/vale"
    cp -r "${srcdir}/${pkgname}-${pkgver}"/* "${srcdir}/gopath/src/github.com/errata-ai/vale/"
    cd "${srcdir}/gopath/src/github.com/errata-ai/vale"

    go env
    make LAST_TAG=${pkgver} exe=vale rules
    make LAST_TAG=${pkgver} exe=vale build
}

package() {
    cd "${srcdir}/gopath/src/github.com/errata-ai/vale"
    make LAST_TAG=${pkgver} DESTDIR="${pkgdir}" install
    install -Dm755 "${srcdir}/gopath/bin/vale" "${pkgdir}/usr/bin/vale"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/vale/README.md"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/vale/LICENSE"
    install -d "${pkgdir}/usr/share/vale/styles"
    cp -r "${srcdir}/gopath/src/github.com/errata-ai/vale/styles"/* "${pkgdir}/usr/share/vale/styles/"
}
