# Maintainer: taotieren <admin@taotieren.com>

pkgname=gitee-cli-git
pkgver=0.3.3.r0.gb9500a1
pkgrel=1
pkgdesc="Gitee CLI is a tool which interact with gitee server seamlessly via terminal"
arch=($CARCH)
url="https://gitee.com/oschina/gitee-cli"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
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
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^[vV]//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

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
    go build -o build/${pkgname%-git} ./cmd/gitee
}

package() {
    cd "${srcdir}/${pkgname}"

    install -vDm755 build/${pkgname%-git} -t ${pkgdir}/usr/bin/
    install -vDm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -R docs "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
