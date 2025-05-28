# Maintainer: taotieren <admin@taotieren.com>

pkgname=bookget-git
pkgver=25.0517.3.g123917c
pkgrel=2
pkgdesc="bookget 数字图书馆下载工具，目前支持约 50+ 个数字图书馆。"
arch=($CARCH)
url="https://github.com/deweizhu/bookget"
license=('GPL-3.0-only')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
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
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
    git -C "${srcdir}/${pkgname%-git}" clean -dfx

    #     cd "${srcdir}/${pkgname%-git}"
    #     git tag --delete nightly
}

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.cn,direct

    mkdir -pv build/
    go build -o build/${pkgname%-git} ./cmd/
}

package() {
    cd "${srcdir}/${pkgname%-git}"

    install -Dm755 build/${pkgname%-git} -t ${pkgdir}/usr/bin/
    install -Dm0644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
    install -Dm0644 "${srcdir}/${pkgname%-git}/config.yaml" -t "${pkgdir}/etc/${pkgname%-git}/"
}
