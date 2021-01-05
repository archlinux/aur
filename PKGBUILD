# Maintainer: Gautham Velchuru <gvelchuru@gmail.com>
# Co-Maintainer: Konstantin Gizdov <arch at kge dot pw>
pkgname=vale
pkgver=2.6.8
pkgrel=1
pkgdesc="A customizable, syntax-aware linter for prose"
arch=('i686' 'x86_64')
url="https://github.com/errata-ai/vale"
license=('MIT')
makedepends=('go' 'go-bindata' 'rsync')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7a01dbe5370b61a16a3126b752399174256722885946111ceea995d8cfb9e70f')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GOPATH="${srcdir}/gopath"
    export PATH="${srcdir}/gopath/bin:$PATH"

    go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-s -w -X main.version=\"${pkgver}\" -linkmode external -extldflags \"${LDFLAGS}\"" \
      -o bin/vale
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/bin/vale" "${pkgdir}/usr/bin/vale"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/vale/README.md"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/vale/LICENSE"
    install -d "${pkgdir}/usr/share/vale/styles"
    cp -r "${srcdir}/${pkgname}-${pkgver}/styles"/* "${pkgdir}/usr/share/vale/styles/"
}
