# Maintainer: taotieren <admin@taotieren.com>

pkgname=bookget
pkgver=25.0501
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
backup=(etc/bookget/config.ini)
options=('!strip' '!debug')
#install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c0653efa23328d3357078d1da96a2a894d5ed91bd3f1cc01516bbcebd6558ac3')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.cn,direct

    mkdir -pv build/
    go build -o build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 build/${pkgname} -t ${pkgdir}/usr/bin/
    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/config.ini" -t "${pkgdir}/etc/${pkgname}/"
}
