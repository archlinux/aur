# Maintainer: taotieren <admin@taotieren.com>

pkgbase=bcu-git
pkgname=bcu-git
pkgver=1.1.100.r5.ga3efbea
pkgrel=1
epoch=
pkgdesc="bcu (Board Control Utilities)"
arch=($CARCH)
url="https://github.com/nxp-imx/bcu"
license=('Custom')
groups=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(bzip2
    zlib
    confuse
    curl
    libftdi
    libyaml
    libusb
    libzip
    openssl)
makedepends=('cmake' 'git' 'ninja')
checkdepends=()
optdepends=("mfgtools-git: uuu (Universal Update Utility), mfgtools 3.0. Freescale/NXP I.MX Chip image deploy tools.")
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgbase%-git}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgbase%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/bcu_//g;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgbase%-git}"
    #     git submodule update --init --recursive
    sed -i '/pkg_check_modules(LIBUSB REQUIRED libusb-1.0)/a pkg_check_modules(LIBCURL REQUIRED libcurl)' CMakeLists.txt
    sed -i 's|${PROJECT_SOURCE_DIR}/libcurl/include|${LIBCURL_INCLUDE_DIRS}/include|g' CMakeLists.txt
    sed -i 's|${LIBFTDI_LIBRARY_DIRS}|${LIBFTDI_LIBRARY_DIRS} ${LIBCURL_LIBRARY_DIRS}|g' CMakeLists.txt
    sed -i 's|${PROJECT_SOURCE_DIR}/libcurl/build.bcu/lib/libcurl.a|${LIBCURL_LIBRARY_DIRS}/libcurl.so|g' CMakeLists.txt
    sed -i 's|COMMAND ${PROJECT_SOURCE_DIR}/build_libs.sh ${PROJECT_SOURCE_DIR})|)|g' CMakeLists.txt
}

build() {
    cd "${srcdir}/${pkgbase%-git}"
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -GNinja

    ninja -C build
}

package() {
    DESTDIR="$pkgdir/" ninja -C "${srcdir}/${pkgname%-git}/build" install
    install -Dm0644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
