# Maintainer: BryanLiang <liangrui.ch at gmail dot com>

# shellcheck disable=SC2034,SC2154,SC2164

pkgname=tcping-go
pkgver=2.7.0
pkgrel=1
pkgdesc="A cross-platform ping program for TCP ports inspired by the Linux's ping utility."
arch=('x86_64' 'aarch64')
url='https://github.com/pouriyajamshidi/tcping'
license=('MIT')
conflicts=("${pkgname}-bin" "${pkgname}-git" "tcping")
makedepends=('go')
depends=('glibc')

source=("tcping-go-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('f5d70320fe4cdb7a3dfb6f40899287fb1212a8c74e1527f63915174c0533e4fb')

build() {
    cd "tcping-${pkgver}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export GOPATH="${srcdir}"

    go build -o ./tcping -ldflags "-s -w -X main.version=${pkgver}"
}

package() {
    cd "${srcdir}/tcping-${pkgver}"
    install -Dm 755 tcping "${pkgdir}/usr/bin/tcping"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/tcping-go/LICENSE"
}
