# Maintainer: taotieren <admin@taotieren.com>

pkgbase=pcanflash-git
pkgname=pcanflash-git
pkgver=r94.ff6be26
pkgrel=7
pkgdesc="Linux Tool to flash PCAN Routers"
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/peak-system/pcanflash"
license=('GPL-2.0-only')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(glibc
    linux-api-headers)
makedepends=(git)
optdepends=('iproute2: IP Routing Utilities')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    make -C $pkgname PREFIX=/usr
}

package() {
    cd "${srcdir}/${pkgname}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm0644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}/"
}
