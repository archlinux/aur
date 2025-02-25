# Maintainer: taotieren <admin@taotieren.com>

pkgname=bouffalo-isp-git
pkgver=r2.7caf644
pkgrel=1
pkgdesc="bouffalo_isp is an ISP tool that supports flashing firmware into BouffaloLab chips for MPUs running on the Linux platform."
arch=($CARCH)
url="https://github.com/bouffalolab/bouffalo_isp"
license=('Apache-2.0')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    glibc
)
makedepends=(
    cmake
    git
    pkgconf
)
optdepends=()
backup=()
options=()
install=bouffalo-isp-git.install
source=(
    "${pkgname}::git+${url}.git"
    "bouffalo-isp-git.install"
)
sha256sums=('SKIP'
            '45b92e9788ac186a4fa2bad728fe7956b2afb52c4f4b01481ddd2b26ed47bdc3')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/"

    cmake -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B build \
        -Wno-dev

    cmake --build build
}

# check() {
#     cd "${srcdir}/${pkgname}/"
# }

package() {
    cd "${srcdir}/${pkgname}/"
    #     DESTDIR="$pkgdir" cmake --install build
    install -vDm755 build/bouffalo_isp "$pkgdir"/usr/bin/${pkgname%-git}
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
