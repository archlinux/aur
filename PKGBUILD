# Maintainer: taotieren <admin@taotieren.com>

pkgbase=rapidassist
pkgname=rapidassist
_name=RapidAssist
pkgver=0.10.2
pkgrel=0
pkgdesc="RapidAssist is a lite cross-platform library that assist you with the most c++ repetitive tasks."
arch=($CARCH)
url="https://github.com/end2endzone/RapidAssist"
license=('MIT')
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    gcc-libs
    glibc
)
makedepends=(
    cmake
    doxygen
    gtest
    ninja
    pkgconf
)
checkdepends=()
optdepends=()
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d8708aece3cf5de436617b84b8fff87416255b4e31eac24c18b4830b6f842d59')
options=(!strip !lto !debug)

build() {
    #     export LDFLAGS="-L/lib64"
    #     if test -n "$LD_LIBRARY_PATH"; then
    #         export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/lib64"
    #     else
    #         export LD_LIBRARY_PATH=/lib64
    #     fi
    cd "${srcdir}/${_name}-${pkgver}/"

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DRAPIDASSIST_BUILD_TEST=OFF \
        -DBUILD_SHARED_LIBS=OFF \
        -Wno-dev \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${_name}-${pkgver}/build install
    install -Dm0644 "${srcdir}"/${_name}-${pkgver}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
