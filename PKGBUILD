# Maintainer: Michal Minar <mic.liamg[at]gmail[dot]com>

readonly REPO="github.com/projectatomic/skopeo"

pkgname=skopeo
pkgver=0.1.27
pkgrel=1
pkgdesc='A command line utility for various operations on container images and image repositories.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://${REPO}"
license=('Apache')
makedepends=('go' 'go-md2man' 'btrfs-progs')
depends=('gpgme' 'device-mapper' 'ostree')
source=("https://github.com/projectatomic/${pkgname}/archive/v${pkgver}/${pkgname}.tar.gz")
sha256sums=("a72a920bc13260ac167f938e9b7dbbb0a53bf0a82c5d76109b2b5aaba62be71a")

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
