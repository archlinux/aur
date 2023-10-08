# Maintainer: fardragon <michaldrozd@protonmail.ch>

pkgname=imgui-sfml
pkgver=2.6
pkgrel=1
pkgdesc="Library which allows you to use ImGui with SFML"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/eliasdaler/imgui-sfml/"
license=("MIT")
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/eliasdaler/${pkgname}/archive/v${pkgver}.tar.gz"
    "use_system_imgui.patch"
)
sha512sums=('c8f2ed21ad5dfac417474f0caed1c59105b7dd8bf2dcb1db3b1f46a4fb07cec3c199d6fda0ff05ec5040a18000a0168f1a8caa978dee356c2b6874b5b2e10ec4'
'889e4d4e8c95297b3d4f905f200bd0ce0c719b3f9538606616e6c520547ea109c119bda27d48a205587a026e9a115ffa8ba6d70d91381234106df39e78d42c34')

depends=(
    "sfml>=2.5.0"
    "imgui>=1.80.0"
)
makedepends=("cmake")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch --strip=1 --binary --input="${srcdir}/use_system_imgui.patch"
}

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake -DCMAKE_CXX_FLAGS="-ffile-prefix-map=${srcdir}=." -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -DBUILD_SHARED_LIBS=ON .
    cmake --build .
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake --build . --target install
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/${pkgname}-LICENSE"
}
