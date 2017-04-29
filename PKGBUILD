# Maintainer: Michal Minar <mic.liamg[at]gmail[dot]com>

readonly REPO="github.com/projectatomic/skopeo"

pkgname=skopeo
pkgver=0.1.19
pkgrel=1
pkgdesc='A command line utility for various operations on container images and image repositories.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://${REPO}"
license=('Apache')
makedepends=('go' 'go-md2man' 'gpgme' 'btrfs-progs' 'device-mapper')
depends=('gpgme' 'device-mapper')
source=("https://github.com/projectatomic/${pkgname}/archive/v${pkgver}/${pkgname}.tar.gz")
sha256sums=("b0735a46cada57008803b78330b4822f133f1a5fb9ea3b75d3453d64c4b33ab6")

prepare() {
    rm -rf "${srcdir}/src"
    mkdir -p "${srcdir}/src/$(dirname "${REPO}")"
    mv "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/${REPO}"
    ln -s "src/${REPO}" "${srcdir}/${pkgname}-${pkgver}"
}

build() {
    cd "${srcdir}/src/${REPO}"
    export GOPATH="${srcdir}"
    LDFLAGS="-ldevmapper -lgpgme"
    go build \
        -ldflags "-extldflags '${LDFLAGS}'" \
        -tags btrfs_noversion \
        -o skopeo ./cmd/skopeo
    make docs
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
