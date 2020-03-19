# Maintainer: Gautham Velchuru <gvelchuru@gmail.com>
# Co-Maintainer: Konstantin Gizdov <arch@kge.pw>
pkgname=vale
pkgver=2.1.0
pkgrel=1
pkgdesc="A customizable, syntax-aware linter for prose"
arch=('i686' 'x86_64')
url="https://github.com/errata-ai/vale"
license=('MIT')
makedepends=('go' 'go-bindata' 'rsync')
source=("${pkgname}-${pkgver}.zip::${url}/archive/v${pkgver}.zip")
sha256sums=('1f76b380cebc7fec044be3b626f31c2c7e838722f45fe744a3e90d317a97060c')

build() {
    cd "${srcdir}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
    export GOPATH="${srcdir}/gopath"
    export PATH="${srcdir}/gopath/bin:$PATH"
    mkdir -p "${srcdir}/gopath/src/github.com/errata-ai/vale"
    cp -r "${srcdir}/${pkgname}-${pkgver}"/* "${srcdir}/gopath/src/github.com/errata-ai/vale/"
    cd "${srcdir}/gopath/src/github.com/errata-ai/vale"

    go env
    make LAST_TAG=${pkgver} rules
    make LAST_TAG=${pkgver} build
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
