# Maintainer: BryanLiang <liangrui.ch at gmail dot com>

# shellcheck disable=SC2034,SC2154,SC2164

pkgname=tcping-go
pkgver=2.6.0
pkgrel=1
pkgdesc="A cross-platform ping program for TCP ports inspired by the Linux's ping utility."
arch=('x86_64' 'aarch64')
url='https://github.com/pouriyajamshidi/tcping'
license=('MIT')
conflicts=("${pkgname}-bin" "${pkgname}-git" "tcping")
makedepends=('go')
depends=('glibc')

source=("tcping-go-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('170d2261af1b226dbcbef9342067d7e89573b3b4f2efccd5a9656c06040416b8')

build() {
    cd "tcping-${pkgver}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export GOPATH="${srcdir}"

    go build -o ./tcping -ldflags "-s -w"
}

package() {
    cd "${srcdir}/tcping-${pkgver}"
    install -Dm 755 tcping "${pkgdir}/usr/bin/tcping"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/tcping-go/LICENSE"
}
