# Maintainer: taotieren <admin@taotieren.com>

pkgname=xbltools-git
pkgver=r1.dd62298
pkgrel=1
epoch=
pkgdesc="Tools for manipulating Qualcomm XBL images."
arch=($CARCH)
url="https://github.com/linux-msm/xbltools"
license=('MIT')
groups=()
depends=(glibc)
makedepends=(
    git
    meson
    ninja)
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^QSaharaServer//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    arch-meson ${pkgname} build
    ninja -C build
}

# check() {
#     meson test -C ${srcdir}/build
# }

package() {
    DESTDIR="${pkgdir}" ninja -C ${srcdir}/build install
}
