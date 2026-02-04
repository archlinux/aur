# Maintainer: lostmason <lostmason@tutamail.com>
pkgname=infinipaint
pkgver=0.4.0
pkgrel=1
pkgdesc="Infinite canvas with infinite zoom for collaborative sketching"
arch=('x86_64' 'aarch64')
url="https://github.com/ErrorAtLine0/infinipaint"
license=('MIT')
depends=(
    'glibc'
    'gcc-libs'
    'libglvnd'
    'tbb'
    'hwloc'
    'hicolor-icon-theme'
    'libx11'
    'libxcursor'
    'libxi'
    'libxkbcommon'
    'libxrandr'
    'libxss'
    'libxxf86vm'
)
makedepends=(
    'cmake'
    'python'
    'git'
    'conan-bin'
    'libfontenc'
    'libxkbfile'
    'xcb-util-cursor'
    'libxaw'
    'libxcomposite'
    'libxdamage'
    'libxfixes'
    'libxinerama'
    'libxmu'
    'libxpm'
    'libxres'
    'libxshmfence'
    'libxt'
    'libxtst'
    'libxv'
    'xcb-util'
    'xcb-util-image'
    'xcb-util-keysyms'
    'xcb-util-renderutil'
    'xcb-util-wm'
    'xorg-util-macros'
    'xorgproto'
)
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a54a21b71dff9bd100dfd68e7e16479b3ea83b310bbcac75f3569fce6745c25a')

prepare() {
    cd "${pkgname}-${pkgver}"
    conan profile detect
    ./conan/export_libs.sh
}

build() {
    cd "${pkgname}-${pkgver}"
    
    local _profile="conan/profiles/linux-x86_64"
    [[ "$CARCH" == "aarch64" ]] && _profile="conan/profiles/linux-arm64"
    
    conan install . --build=missing -pr="${_profile}" -o 'hwloc/*:shared=True'
    
    cd build/Release
    source generators/conanbuild.sh
    cmake ../.. \
        -DCMAKE_TOOLCHAIN_FILE=generators/conan_toolchain.cmake \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build . -j"$(nproc)"
    source generators/deactivate_conanbuild.sh
}

package() {
    cd "${pkgname}-${pkgver}"
    
    install -Dm755 build/Release/infinipaint "${pkgdir}/usr/lib/${pkgname}/infinipaint"
    cp -r data "${pkgdir}/usr/lib/${pkgname}/"
    
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/infinipaint" <<'EOF'
#!/bin/bash
exec /usr/lib/infinipaint/infinipaint "$@"
EOF
    
    install -Dm644 linuxinstall/com.infinipaint.infinipaint.desktop \
        "${pkgdir}/usr/share/applications/com.infinipaint.infinipaint.desktop"
    
    install -Dm644 data/progicons/icon.png \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.infinipaint.infinipaint.png"
    
    install -Dm644 linuxinstall/com.infinipaint.infinipaint.metainfo.xml \
        "${pkgdir}/usr/share/metainfo/com.infinipaint.infinipaint.metainfo.xml"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
