# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
# Contributor: database64128 <free122448@hotmail.com>
pkgname=qv2ray-v3
_base_commit=f1adda6cc8c3370929aae86399731a5fad981346
_libuv_commit=04289fa326b790c1a4abb236d1f9d913bacfc8c6
_uvw_commit=97c02c4f572179c4b31656d54bf78b5ab8b05f81
_plugin_commit=56197d32330df1ea47d846e574a2a9a0ec1df6ab
_tag=v3.0.0-rc1
pkgver=3.0.0rc1
pkgrel=5
pkgdesc="A cross platform connection manager for V2Ray and other backends."
arch=(x86_64)
url="https://github.com/Shadowsocks-NET/Qv2ray"
license=('GPL3')
depends=('grpc' 'hicolor-icon-theme' 'qt6-svg')
makedepends=('cmake' 'git' 'grpc-cli' 'ninja' 'qt6-declarative' 'qt6-tools')
optdepends=(
    'qt6-wayland: Wayland support (experimental)'
    'v2ray: Default V2Ray core'
)
provides=('qv2ray' 'libqv2ray' 'qv2ray-plugin-interface')
conflicts=('qv2ray' 'libqv2ray' 'qv2ray-plugin-interface')
source=(
    "libqv2ray-$_base_commit.zip::https://github.com/Shadowsocks-NET/Qv2rayBase/archive/$_base_commit.zip"
    "plugin-$_plugin_commit.zip::https://github.com/Shadowsocks-NET/Qv2rayBase-PluginInterface/archive/$_plugin_commit.zip"
    "$pkgname::git+$url.git#tag=$_tag"
    "git+https://github.com/itay-grudev/SingleApplication.git"
    "git+https://github.com/cpeditor/QCodeEditor.git"
    "git+https://github.com/danielsanfr/qt-qrcode.git"
    "git+https://github.com/xiaokangwang/v2ray-core-1.git"
    "git+https://github.com/moodyhunter/libRoutingA.git"
    "git+https://github.com/fukuchi/libqrencode.git"
    "git+https://github.com/libuv/libuv.git#commit=$_libuv_commit"
    "git+https://github.com/skypjack/uvw.git#commit=$_uvw_commit"
)
sha512sums=('2670d8579eeb48979740a20d56a67adb310d483bf23a63d63ac5f3a38605d172e74e0b7215203ad54f54f765ebfb694fd03b0d0b7aaa21ab5927b930cb7e426c'
            '504fcddd0d21273c427a4d5f092652031c85f96653ca749e8146fefd087911e71bb2d452cedceea9b4f4b557326f88d5a2c877c99fc0f5d844b6951d5388a9ad'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

patch_gitmodules() {
    sed -i "s|https://github.com/.*/|${srcdir}/|;s|.git||" .gitmodules
}

prepare() {
    cd $srcdir/$pkgname
    patch_gitmodules
    git submodule update --init \
        3rdparty/SingleApplication \
        3rdparty/QCodeEditor \
        3rdparty/qt-qrcode \
        src/plugins/v2ray/3rdparty/v2ray-core \
        src/plugins/routingA/core
    
    _base_dir=src/Qv2rayBase
    rmdir $_base_dir
    ln -s ${srcdir}/Qv2rayBase-$_base_commit $_base_dir
    cd $_base_dir/3rdparty
    rmdir libuv uvw
    ln -s ${srcdir}/libuv .
    ln -s ${srcdir}/uvw .
    cd ../src
    rmdir PluginInterface
    ln -s ${srcdir}/Qv2rayBase-PluginInterface-$_plugin_commit PluginInterface
    
    cd $srcdir/$pkgname/3rdparty/qt-qrcode
    patch_gitmodules
    git submodule update --init
}

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build && cd build
    cmake .. \
        -DBUILD_TESTING=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
        -DQV2RAY_BUILD_INFO="$pkgname AUR package" \
        -DQV2RAY_BUILD_EXTRA_INFO="r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)" \
        -DQV2RAY_DEFAULT_VASSETS_PATH="/usr/share/v2ray" \
        -DQV2RAY_DEFAULT_VCORE_PATH="/usr/bin/v2ray" \
        -DQV2RAY_AUTO_UPDATE=OFF \
        -GNinja
    cmake --build . --parallel
}

package() {
    cd "$srcdir/$pkgname/build"
    cmake --install .
}
