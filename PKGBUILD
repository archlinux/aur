# Maintainer: taotieren <admin@taotieren.com>

pkgname=nuc980-nuwriter-git
pkgver=r23.20fb730
pkgrel=6
epoch=
pkgdesc="The Nu-writer Command Tool is a linux console application consisting of functions to access storage(eg. DRAM,NAND,SPINOR,SPINAND,SD) in a NUC980 family processors"
arch=($CARCH)
url="https://gitee.com/OpenNuvoton/NUC980_NuWriter_CMD"
license=('GPL-3.0-only')
groups=()
depends=(
    glibc
    libusb)
makedepends=(git
    automake
    pkgconf)
checkdepends=()
optdepends=()
provides=('NUC980_NuWriter_CMD')
conflicts=(${pkgname%-git})
replaces=("nuwriter-git")
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname%-git}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    autoreconf -f -i
    #     ./configure --prefix=$PWD/install
    make
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    #     make install
    install -Dm0755 nuwriter "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm0755 run.ini "${pkgdir}/usr/share/nudata/run.ini"
    cp -rv nudata "${pkgdir}/usr/share/"
}
