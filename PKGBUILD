# Maintainer: Gautham Velchuru <gvelchuru@gmail.com>
pkgname=vale
pkgver=1.3.2
pkgrel=1
pkgdesc="A customizable, syntax-aware linter for prose."
arch=('i686' 'x86_64')
url="https://github.com/errata-ai/vale"
license=('MIT')
makedepends=('go-pie' 'go-bindata')
source=("${url}/archive/v${pkgver}.zip")
sha256sums=('b143c227cdbd502afef612216ede2ba5fd8158ff45e43b99a8a0f77da851a20e')

build() {
    cd "${srcdir}"
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
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/vale/LICENSE"
    install -d "${pkgdir}/usr/share/vale/styles"
    cp -r "${srcdir}/gopath/src/github.com/errata-ai/vale/styles"/* "${pkgdir}/usr/share/vale/styles/"
}
