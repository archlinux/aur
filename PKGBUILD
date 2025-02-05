# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2164

pkgname=diskm8
pkgver=0.6.1
pkgrel=1
pkgdesc="Apple II disk image manipulation, cataloging and analysis tool"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/paleotronic/diskm8"
license=('GPL-3.0-only')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        xdg-path.patch)
sha256sums=('8a5d1e86e7401fe2de7988994a9926f2197f1c466603f33edb59505561cd5cac'
            '183b50acb2998ec820cf334fea02f9b807b520dc598a5e47a94a11cabb14fb19')

prepare() {
    cd "${pkgname}-${pkgver}"

    # prefer XDG path (https://github.com/paleotronic/diskm8/pull/25)
    patch --no-backup-if-mismatch -Np1 -i ../xdg-path.patch
}

build() {
    mkdir build || true
    cd "${pkgname}-${pkgver}"

    export CGO_CFLAGS="${CFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o ../build .
}

package() {
    install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
