# Maintainer: taotieren <admin@taotieren.com>

pkgname=mcp-gitee-ent
pkgver=0.2.8
pkgrel=1
pkgdesc="Gitee Enterprise MCP Server is a Model Context Protocol (MCP) server implementation for Gitee Enterprise."
arch=($CARCH)
url="https://github.com/oschina/mcp-gitee-ent"
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
    'mcp-gitee: Gitee MCP Server is a Model Context Protocol (MCP) server implementation for Gitee.'
)
backup=()
options=('!strip' '!debug')
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('79b654d27a204cea9f65ca0c99b0470a17c77b22c2db935b7aa8b5c91bbb6c16')

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
