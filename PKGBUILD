# Maintainer: taotieren <admin@taotieren.com>

pkgname=fantascene-dynamic-wallpaper-git
pkgver=2.1.1.r1.g466d06d
pkgrel=1
pkgdesc=" dynamic wallpaper. A very nice animated wallpaper on X11 systems.Support Movie and Web animated wallpaper."
arch=($CARCH)
url="https://github.com/dependon/fantascene-dynamic-wallpaper"
license=('GPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-git})
_qt=qt6
depends=(
    glib2
    glibc
    libstdc++
    libgcc
    libglvnd
    libx11
    libxcb
    libxext
    xcb-util-wm
    mpv
    ${_qt}-charts
    ${_qt}-base
    ${_qt}-multimedia
)
makedepends=(
    git
    ${_qt}-tools
    ${_qt}-webengine
    pkgconfig
    make
)
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    git -C "${srcdir}/${pkgname%-git}" clean -dfx

    cd "${srcdir}/${pkgname%-git}"

    # Qt6 最低要求 C++17，.pro 中写的 c++11 已被 qmake6 忽略（实际编译用的是 C++20）
    # 改为 c++17 与 Qt6 要求一致
    sed -i 's/CONFIG += c++11/CONFIG += c++17/' src/*.pro

    # Fix: C++20 中 u8 前缀生成 char8_t*，Qt6 的 QByteArray 不接受 char8_t*
    # 源码中的 u8"" 字符串全是 ASCII，移除 u8 前缀即可
    find . \( -name '*.cpp' -o -name '*.h' -o -name '*.hpp' \) | \
        while IFS= read -r f; do
            sed -i 's/u8"/"/g' "$f"
        done
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    export CXXFLAGS="${CXXFLAGS} -fpermissive"
    qmake6 ./${pkgname%-git}.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
    make -C ./build
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make INSTALL_ROOT="${pkgdir}" -C ./build install
}
