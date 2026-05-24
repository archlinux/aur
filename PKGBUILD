# Maintainer: wypifu <lilington80@gmail.com>
pkgname=bkpview
pkgver=0.6.3
pkgrel=1
pkgdesc="Fast Vulkan-based 3D model viewer for GLTF, OBJ, PLY and STL files. Replaces Microsoft 3D Viewer."
arch=('x86_64')
url="https://github.com/wypifu/bkpview"
license=('MIT')
install=bkpview.install
depends=('vulkan-icd-loader' 'glfw' 'blukpast>=1.0.5')
makedepends=('cmake' 'ninja' 'shaderc')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/wypifu/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "imgui::git+https://github.com/ocornut/imgui.git"
)
sha256sums=(
    '2aac93210e6391fb674a87e8924aa7534f7a7f4fc1a349cdaeec2c71097ad745'
    'SKIP'
)


build() {
    cd "${pkgname}-${pkgver}"
    mkdir -p thirdparty
    cp -r "${srcdir}/imgui" thirdparty/imgui
    mkdir -p build && cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBKP_ROOT=/usr/include/blukpast \
        -DBKPVIEW_SHADER_DIR=/usr/share/bkpview \
        -G Ninja
    ninja
}

package() {
    cd "${pkgname}-${pkgver}/build"
    DESTDIR="${pkgdir}" ninja install
}
