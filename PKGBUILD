# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=gitlab.com/mipimipi
pkgname=smsync-git
_pkgname=smsync
pkgver=3.5.1
pkgrel=1
pkgdesc="smsync (Smart Music Sync) keeps huge music collections in sync and is takes care of conversions between different file formats. It's an easy-to-use command line application for Linux"
arch=(x86_64 aarch64)
url="https://${_pkgorg}/${_pkgname}/"
license=(GPL3)
source=("git+https://${_pkgorg}/${_pkgname}.git")
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
sha256sums=('SKIP')
depends=(ffmpeg)
makedepends=(
    bash
    git
    go
    make
)
provides=(smsync)

pkgver() {
    cd "${srcdir}/${_pkgname}"
    ( set -o pipefail
        git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="$pkgdir" install
}
