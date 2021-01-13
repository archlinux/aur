pkgname=perkeep
pkgver=0.11
pkgrel=2
pkgdesc="Perkeep (née Camlistore) is a set of open source formats, protocols, and software for modeling, storing, searching, sharing and synchronizing data in the post-PC era"
arch=("x86_64" "armv7h")
url="https://perkeep.org/"
license=("Apache")
depends=("glibc")
makedepends=("go>=1.15")
optdepends=(
    "libjpeg-turbo: Fast JPEG support"
    "docker: Run fallback image if ImagesMagick is not installed on the host"
    "imagemagick: HEIC decoding (JPEG thumbnails)"
)

source=("https://perkeep.org/dl/perkeep-${pkgver}-src.zip")
sha256sums=("9ca95022a5b7547dbcfa0cc6558676c02d3a282f8a4b3c950d8d68291b40a4eb")

prepare() {
    cd "${srcdir}/${pkgname}.org"
    printf %s "${pkgver}" > VERSION
}

build() {
    cd "${srcdir}/${pkgname}.org"
    export GOBIN="${srcdir}/${pkgname}.org/bin"
    # NOTE: the build should be done entirely offline, but `make.go` errors out
    # when go is newer than 1.12 (for GopherJS) and requires being built in
    # $GOPATH
    go run make.go -v #-buildWebUI=true -offline=true
}

package() {
    cd "${srcdir}/${pkgname}.org/bin"
    install -Dm755 -t "${pkgdir}"/usr/bin/ \
        perkeepd \
        pk \
        pk-get \
        pk-mount \
        pk-put \
        publisher \
        scancab \
        scanningcabinet
}
