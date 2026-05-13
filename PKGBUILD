# Maintainer: taotieren <admin@taotieren.com>

pkgname=gitee-lfs-multipart-uploader-git
pkgver=1.0.4.r16.g0ad46f4
pkgrel=1
pkgdesc="Gitee LFS high-speed object storage direct transfer tool"
arch=($CARCH)
url="https://gitee.com/oscstudio/gitee-lfs-multipart-uploader"
license=('Apache-2.0')
provides=(${pkgname%-git} multipart-transfer)
conflicts=(${pkgname%-git} multipart-transfer)
#replaces=(${pkgname})
depends=(
    glibc
    git
    git-lfs
)
makedepends=(
    git
    go
)
optdepends=(
    'mcp-gitee: Gitee MCP Server is a Model Context Protocol (MCP) server implementation for Gitee.'
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
    go build -o build/multipart-transfer ./cmd/multipart-transfer
}

package() {
    cd "${srcdir}/${pkgname}"

    install -vDm755 build/multipart-transfer -t ${pkgdir}/usr/bin/
    install -vDm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -R docs "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
