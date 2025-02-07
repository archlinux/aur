# Maintainer: taotieren <admin@taotieren.com>

pkgbase=bin2cpp
pkgname=bin2cpp
pkgver=3.0.0
pkgrel=0
pkgdesc="bin2cpp: The easiest way to embed small files into a c++ executable. bin2cpp converts text or binary files to C++ files (*.h, *.cpp) for easy access within the code."
arch=($CARCH)
url="https://github.com/end2endzone/bin2cpp"
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
    git
    ninja
    pkgconf
    #AUR
    rapidassist
)
checkdepends=()
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('10d45ff85333b4769b32173cf8dbfe5508aac4426af5c131e8668b95a42c0961')
options=(!strip !lto !debug)

build() {
    #     export LDFLAGS="-L/lib64"
    #     if test -n "$LD_LIBRARY_PATH"; then
    #         export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/lib64"
    #     else
    #         export LD_LIBRARY_PATH=/lib64
    #     fi
    cd "${srcdir}/${pkgname}-${pkgver}/"

    sed -e 's|"."|"share/bin2cpp"|g' \
        -e 's|"docs"|"share/doc/bin2cpp"|g' \
        -i CMakeLists.txt
    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBIN2CPP_BUILD_TEST=OFF \
        -DBIN2CPP_BUILD_SAMPLES=OFF \
        -DBUILD_SHARED_LIBS=ON \
        -Wno-dev \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}-${pkgver}/build install
    install -Dm0644 "${srcdir}"/${pkgname}-${pkgver}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
