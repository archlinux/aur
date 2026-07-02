# Maintainer: BryanLiang <liangrui.ch at gmail dot com>

# shellcheck disable=SC2034,SC2154,SC2164

pkgname=tcping-go
pkgver=2.8.0
pkgrel=1
pkgdesc="A cross-platform ping program for TCP ports inspired by the Linux's ping utility."
arch=('x86_64' 'aarch64')
url='https://github.com/pouriyajamshidi/tcping'
license=('MIT')
conflicts=("${pkgname}-bin" "${pkgname}-git" "tcping")
makedepends=('go')
depends=('glibc')

source=("tcping-go-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('dc736e38202236b3bd49ce9610429d2ad79937ba641f202fbf01bf75ae10515a')

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
