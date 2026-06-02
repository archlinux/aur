pkgname=perkeep
pkgver=0.12
pkgrel=1
pkgdesc="Perkeep (née Camlistore) is a set of open source formats, protocols, and software for modeling, storing, searching, sharing and synchronizing data in the post-PC era"
arch=("x86_64" "armv7h")
url="https://perkeep.org"
license=("Apache-2.0")
depends=("glibc")
makedepends=("go>=1.15")
optdepends=(
    "libjpeg-turbo: Fast JPEG support"
    "docker: Run fallback image if ImagesMagick is not installed on the host"
    "imagemagick: HEIC decoding (JPEG thumbnails)"
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/perkeep/perkeep/archive/v$pkgver.tar.gz")
b2sums=('b77c45ed842c8ef8cbbfa02948f0975b50b72540c501db7de1bb66f15147bed6d544b8133fd46ed6c9e4acd8b9da27d5b13892d5f18e281a776bde40efd953fb')

prepare() {
    cd "${pkgname}-$pkgver"
    printf %s "${pkgver}" > VERSION
}

build() {
    cd "${pkgname}-$pkgver"
    export GOBIN="${srcdir}/${pkgname}-$pkgver/bin"
    # NOTE: the build should be done entirely offline, but `make.go` errors out
    # when go is newer than 1.12 (for GopherJS) and requires being built in
    # $GOPATH
    go run make.go -v #-buildWebUI=true -offline=true
}

package() {
    cd "${pkgname}-$pkgver/bin"
    install -Dm755 -t "${pkgdir}"/usr/bin/ \
        devcam \
        hello \
        perkeepd \
        pk \
        pk-get \
        pk-mount \
        pk-put \
        scancab \
        scanningcabinet
}
