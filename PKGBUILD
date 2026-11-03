# Maintainer: taotieren <admin@taotieren.com>

pkgname=gitee-cli
pkgver=0.3.3
pkgrel=1
pkgdesc="Gitee CLI is a tool which interact with gitee server seamlessly via terminal"
arch=($CARCH)
url="https://gitee.com/oschina/gitee-cli"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
#replaces=(${pkgname})
depends=()
makedepends=(
    git
    go
)
optdepends=(
    'gitee-lfs-multipart-uploader: Gitee LFS high-speed object storage direct transfer tool'
    'mcp-gitee: Gitee MCP Server is a Model Context Protocol (MCP) server implementation for Gitee'
    'mcp-gitee-ent: Gitee Enterprise MCP Server is a Model Context Protocol (MCP) server implementation for Gitee Enterprise.'
)
backup=()
options=('!strip' '!debug')
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('36dfeddded07659bc7437a8d7d96bbfeccaf5cad98d1c66cc05cdaf446599a64')

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
    go build -o build/${pkgname} ./cmd/gitee
}

package() {
    cd "${srcdir}/${pkgname}"

    install -vDm755 build/${pkgname} -t ${pkgdir}/usr/bin/
    install -vDm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -R docs "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
