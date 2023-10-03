# Maintainer: Helle Vaanzinn <glitsj16 at riseup dot net >

_gitname=st
_pkgname=${_gitname}e
pkgname=${_pkgname}-git
pkgver=r24.3067a91
pkgrel=1
pkgdesc="Command Space-Time explorer"
arch=(x86_64)
url="https://github.com/fabiensanglard/st"
license=(MIT)
depends=(
    gcc-libs
)
makedepends=(
    git
)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"

    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${srcdir}/${_gitname}"
    make
}

package() {
    cd "${srcdir}/${_gitname}"
    make DESTDIR="$pkgdir" install prefix=/usr
    # setuid
    chmod 4755 "${pkgdir}/usr/bin/${_pkgname}"

    # license
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
