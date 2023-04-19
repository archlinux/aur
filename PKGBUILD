# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=authy-export-git
_bin=authy-export
_gitname=authy
pkgver=c4f25fd
pkgrel=1
pkgdesc='Export your TOTP secret tokens from Authy.'
arch=('x86_64')
url="https://github.com/alexzorin/authy"
license=('MIT')
makedepends=('go')
optdepends=('qrencode: Import tokens into a mobile app with authy-qrcode-helper.sh')
source=(
    "git+${url}.git"
    'authy-qrcode-helper.sh'
)
sha256sums=(
    'SKIP'
    '9a1209265ee938ca0931aae3c74fff17a6141c8a05f4170e3a4c294d8e635772'
)


prepare(){
    cd ${srcdir}/${_gitname}
    go get -v -d
}

build() {
    cd ${srcdir}/${_gitname}
    go build \
        -buildmode=pie \
        -trimpath \
        -mod=readonly \
        -modcacherw \
        -v -o $_bin cmd/authy-export/authy-export.go
}

package() {
    cd ${srcdir}/${_gitname}
    install -Dm755 $_bin "${pkgdir}/usr/bin/${_bin}"
    install -Dm755 "${startdir}/authy-qrcode-helper.sh" "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/doc/${_bin}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_bin}/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/doc/${_bin}/"
}
