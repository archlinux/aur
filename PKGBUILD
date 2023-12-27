# Maintainer: taotieren <admin@taotieren.com>

pkgname=bookget-git
pkgver=23.1227.3.g9c75fa4
pkgrel=2
pkgdesc="bookget 数字图书馆下载工具，目前支持约50+个数字图书馆。"
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/deweizhu/bookget"
license=('GPL-3.0')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=(go)
optdepends=('dezoomify-rs: Zoomable image downloader for Google Arts & Culture, Zoomify, IIIF, and others')
makedepends=(git)
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

prepare()
{
    git -C "${srcdir}/${pkgname%-git}" clean -dfx
    
    cd "${srcdir}/${pkgname%-git}"
    git tag --delete nightly
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

    mkdir -pv build/
    go build -o build
}

package() {
    cd "${srcdir}/${pkgname%-git}"

    install -Dm755 build/${pkgname%-git} -t ${pkgdir}/usr/bin/
    install -Dm0644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
    install -Dm0644 "${srcdir}/${pkgname%-git}/config.ini" -t "${pkgdir}/etc/${pkgname%-git}/"
}
