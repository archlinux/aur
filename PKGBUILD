# Maintainer: ThorHexSec <thorhexsec@proton.me>
# GitHub profile: https://github.com/ThorHexSec
# Upstream repository: https://github.com/Aitum/obs-aitum-multistream

pkgname=obs-plugin-aitum-multistream-git-hexsec
_pkgname=obs-aitum-multistream
pkgver=1.0.0.r0.gabcdef
pkgrel=4
pkgdesc="OBS Studio plugin for Aitum Multistream — stream to multiple platforms simultaneously (HexSec version)"
arch=('x86_64')
url="https://github.com/Aitum/obs-aitum-multistream"
license=('GPL2')
depends=('obs-studio>=30.0.0' 'qt6-base' 'curl')
makedepends=('cmake' 'git' 'gcc' 'qt6-base' 'qt6-tools')
provides=('obs-plugin-aitum-multistream')
conflicts=()
options=()
source=("git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags --always | sed 's/^v//;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    echo ">>> Removing Qt::GuiPrivate and patching OBS deprecated functions..."

    # Remove Qt::GuiPrivate link
    sed -i '/Qt::GuiPrivate/d' CMakeLists.txt

    # Replace obsolete OBS functions with modern ones
    sed -i '
      s/obs_data_has_autoselect_value/obs_data_has_user_value/g;
      s/obs_data_get_autoselect_int/obs_data_get_int/g;
      s/obs_data_get_autoselect_double/obs_data_get_double/g;
      s/obs_data_get_autoselect_string/obs_data_get_string/g
    ' config-dialog.cpp

    # Remove -Werror flag
    sed -i 's/-Werror//g' CMakeLists.txt

    # Ignore deprecation warnings
    echo 'set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-deprecated-declarations")' >> CMakeLists.txt
}

build() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p build
    cd build

    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_FLAGS="-Wno-deprecated-declarations -Wno-error=deprecated-declarations" \
        -Wno-dev

    make
}

package() {
    cd "${srcdir}/${_pkgname}/build"

    install -Dm755 aitum-multistream.so "${pkgdir}/usr/lib/obs-plugins/aitum-multistream.so"
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    mkdir -p "${pkgdir}/usr/share/obs/obs-plugins/aitum-multistream"
    cp -r ../data/locale "${pkgdir}/usr/share/obs/obs-plugins/aitum-multistream/locale"
}

