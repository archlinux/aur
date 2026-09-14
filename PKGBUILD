# Maintainer: taotieren <admin@taotieren.com>

pkgname=bookget
pkgver=25.0701
pkgrel=2
pkgdesc="bookget 数字图书馆下载工具，目前支持约 50+ 个数字图书馆。"
arch=($CARCH)
url="https://github.com/deweizhu/bookget"
license=('GPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname})
#replaces=(${pkgname})
depends=()
optdepends=('dezoomify-rs: Zoomable image downloader for Google Arts & Culture, Zoomify, IIIF, and others')
makedepends=(
    git
    go
)
backup=()
options=('!strip' '!debug')
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('8072e9df522d2049ed954a12f19e746efccd53b0125cbf4a5dca0dc906d4db7b')

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
    go build -o build/${pkgname} ./cmd/
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 build/${pkgname} -t ${pkgdir}/usr/bin/
    install -Dm0644 "${srcdir}/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
