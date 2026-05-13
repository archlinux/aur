# Maintainer: taotieren <admin@taotieren.com>

pkgname=mcp-gitee
pkgver=1.0.0
pkgrel=1
pkgdesc="Gitee MCP Server is a Model Context Protocol (MCP) server implementation for Gitee."
arch=($CARCH)
url="https://gitee.com/oschina/mcp-gitee"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
#replaces=(${pkgname})
depends=(glibc)
optdepends=()
makedepends=(
    git
    go
)
backup=()
options=('!strip' '!debug')
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('8b83d90dbcbc3ff63f2b547111b8fce253b41e6aea0ff8c817e8af25219321fb')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.cn,direct

    mkdir -pv build/
    go build -o build/${pkgname}
}

package() {
    cd "${srcdir}/${pkgname}"

    install -vDm755 build/${pkgname} -t ${pkgdir}/usr/bin/
    install -vDm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -R docs "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
