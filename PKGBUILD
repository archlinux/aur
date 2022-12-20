# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=rtsp-simple-server
pkgver=0.21.0
pkgrel=1
pkgdesc="Ready-to-use and zero-dependency RTSP / RTMP / HLS server and proxy."
arch=('any')
url="https://github.com/aler9/rtsp-simple-server/"
license=('MIT')
makedepends=('go')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=(
    "https://github.com/aler9/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.service"
)
sha256sums=(
    'd466bef6068ddb74abc5d5956bebb2bbbcd4bfca5a7238f8ce81eb7c3ae96d32'
    'a6e8d22224fc76b28a7daeec4d0eb604224e136748ec760403ba1446a24f532f'
)

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p build/
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build .
}

package() {
    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.yml" "${pkgdir}/etc/${pkgname}/${pkgname}.yml"
}
