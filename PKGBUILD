# Maintainer: taotieren <admin@taotieren.com>

pkgname=bookget
pkgver=25.0517
pkgrel=1
pkgdesc="bookget 数字图书馆下载工具，目前支持约 50+ 个数字图书馆。"
arch=($CARCH)
url="https://github.com/deweizhu/bookget"
license=('GPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname})
#replaces=(${pkgname})
depends=(glibc)
optdepends=('dezoomify-rs: Zoomable image downloader for Google Arts & Culture, Zoomify, IIIF, and others')
makedepends=(
    git
    go
)
backup=(etc/bookget/config.yaml)
options=('!strip' '!debug')
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('2cd297373fd8149b4d2d8b23406a2a8210d77901385a9bafc4052a1cb10add07')

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
    install -Dm0644 "${srcdir}/${pkgname}/config.yaml" -t "${pkgdir}/etc/${pkgname}/"
}
