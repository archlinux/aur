# Maintainer: hiruocha <hiruocha[at]outlook[dot]com>
# Contributor: Small_Fox <smallfox0305@gmail.com>

pkgname=miacode
pkgver=2.0.1
pkgrel=1
pkgdesc="A Simai editor built for professional chart creators"
arch=('x86_64')
url="https://github.com/fanfaredash/MiaCode"
license=('GPL-3.0-only')
depends=(
    'ffmpeg'
    'libva'
    'qt6-base'
    'qt6-declarative'
    'qt6-multimedia'
    'libglvnd'
    'libgcc'
    'libstdc++'
    'hicolor-icon-theme'
)
makedepends=(
    'git'
    'cmake'
    'qt6-tools'
    'qt6-shadertools'
)
source=("${pkgname}::git+${url}.git#tag=${pkgver}"
        'git+https://github.com/imakris/ScintillaQuick.git'
        'disable-update-check.patch')
sha256sums=('dcb6aee740d467175721d87ce8e3ae4610a727ea86848157c09d4d3d833d86e6'
            'SKIP'
            '14db8a53e29b67bda810d95f7e652b29cab535433c2ec840be4d7251831b13e4')

prepare() {
    cd "${pkgname}"

    export SOURCE_DATE_EPOCH=$(git log -1 --format=%ct)

    patch -Np1 -i "${srcdir}/disable-update-check.patch"

    git submodule init
    git config submodule.third_party/ScintillaQuick.url "${srcdir}/ScintillaQuick"
    git -c protocol.file.allow=always submodule update

    sed -i '1i#include <cstdint>' \
    third_party/ScintillaQuick/third_party/scintilla/include/ScintillaTypes.h

    # 临时解决方案：上游忘记改版本号
    sed -i 's/set(MIACODE_VERSION_PATCH "0")/set(MIACODE_VERSION_PATCH "1")/' \
    CMakeLists.txt

    cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DMIACODE_RELEASE_CHANNEL=release \
    -DCMAKE_CXX_FLAGS="$CPPFLAGS $CXXFLAGS" \
    -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
    -DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS" \
    -DCMAKE_MODULE_LINKER_FLAGS="$LDFLAGS" \
    -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
    -DCMAKE_INSTALL_RPATH='$ORIGIN'
}

build() {
    cd "${pkgname}"
    cmake --build build --target MiaCode --parallel 4
}

package() {

    install -Dm644 "${pkgname}/resources/icons/app.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/MiaCode.png"

    install -Dm644 "${pkgname}/resources/icons/app.ico" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/MiaCode.ico"

    cd "${pkgname}/build/"

    install -dm755 "$pkgdir/usr/lib/${pkgname}"
    cp -a bin/. "$pkgdir/usr/lib/${pkgname}/"

    install -dm755 "$pkgdir/usr/share/applications"

    cat > "$pkgdir/usr/share/applications/MiaCode.desktop" <<'EOF'
[Desktop Entry]
Name=MiaCode
Comment=MiaCode
Exec=/usr/lib/miacode/MiaCode
Icon=MiaCode
Terminal=false
Type=Application
Categories=Game;ArcadeGame;
EOF
}
