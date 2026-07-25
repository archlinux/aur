# Maintainer: Octra Labs <contact@octra.org>
pkgname=octra-wallet
# pkgver format: <commit-date:YYYYMMDD>.<short-sha>  e.g. 20260422.a42c32e
# Both pkgver and _commit are rewritten by the release workflow.
pkgver=20260724.6c090cc
_commit=6c090ccce71c91451d3f5698ad499b45f61dd9c3
pkgrel=1
pkgdesc="Octra network web client (webcli): send txs, encrypt/decrypt balances, stealth txs"
arch=('x86_64' 'aarch64')
url="https://github.com/octra-labs/webcli"
license=('GPL-2.0-or-later')
depends=('openssl' 'leveldb' 'gcc-libs' 'glibc')
makedepends=('gcc' 'make')
provides=('octra-wallet')
conflicts=('octra-wallet-bin' 'octra-wallet-git')
source=("${pkgname}-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz"
        "octra-wallet.sh")
sha256sums=('8c50a8ab8e2a3ef3057d8ab7c605681bcaa929408eba3cff2c23b7dd4668a8fc'
            'f8f64d1d92d47ac5cf88c687f3a591b98db99ca6a09c4821dbb6ff70cda929e0')

build() {
    cd "${srcdir}/webcli-${_commit}"
    make
}

package() {
    cd "${srcdir}/webcli-${_commit}"

    # binary and bundled libpvac.so keep their relative rpath ($ORIGIN/pvac/build)
    install -Dm755 octra_wallet "${pkgdir}/usr/lib/${pkgname}/octra_wallet"
    install -Dm755 pvac/build/libpvac.so "${pkgdir}/usr/lib/${pkgname}/pvac/build/libpvac.so"

    # static assets (served at /)
    install -d "${pkgdir}/usr/share/${pkgname}"
    cp -r static "${pkgdir}/usr/share/${pkgname}/static"

    # user-facing launcher
    install -Dm755 "${srcdir}/octra-wallet.sh" "${pkgdir}/usr/bin/octra-wallet"

    # license
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
