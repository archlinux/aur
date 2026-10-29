# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=ergochat-dnsbl
_upstream_pkgname=ergo-dnsbl
pkgver=r8.3e66d08
_commit=3e66d083e859c5ac36d826db3b381ab509d461b7
pkgrel=2
pkgdesc="DNSBL plugin for the IRC server Ergo"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/ergochat/ergo-dnsbl"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+$url#commit=$_commit")
sha512sums=('0bf604ea51130e3ebd93917b5c611dbc77cc4bd38658df29fd6a85c6c1a3c503d235352dac81e23487c1993f73620fa9d976ee9ce59fd6337315dcc178c297b4')
b2sums=('b44ed57edc860cc7cdc2f9a3751172e836ae76cb4b3ef3017db37d54492dd976589a7c08f04f807afc77a93f0e002a86418e28140bc2c855b09f7654b68b8e71')
backup=("etc/ergochat/dnsbl-config.yaml")

build() {
    export GOPATH="$srcdir/gopath"
    cd "${srcdir}/$_upstream_pkgname" || exit

    GIT_COMMIT="$(git rev-parse HEAD)" # 2>/dev/null)"

    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=vendor \
        -modcacherw \
        -ldflags "-X main.commit=${GIT_COMMIT} -compressdwarf=false -linkmode external -extldflags \"${LDFLAGS}\"" \
        -v \
        .
}

package() {
    cd "$srcdir/$_upstream_pkgname" || exit
    install -Dm755 oragono-dnsbl "$pkgdir/usr/bin/$pkgname"
    install -Dm644 config.yaml "$pkgdir/etc/ergochat/dnsbl-config.yaml"
}
