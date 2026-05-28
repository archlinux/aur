# Maintainer: taotieren <admin@taotieren.com>

pkgname=wine-cn-font
pkgver=0.0.1
pkgrel=1
pkgdesc="a gtk+ calendar widget for chinese lunar library."
arch=(x86_64)
url="https://github.com/yetist/wine-cn-fonts"
license=('LGPL-2.1-or-later')
depends=()
makedepends=(
    git
    meson
    mingw-w64-gcc
    mingw-w64-winpthreads
)
optdepends=(
    "wine: A compatibility layer for running Windows programs"
)
install=${pkgname}.install
source=(
    "$pkgname::git+${url}.git#tag=v$pkgver"
    ${pkgname}.install
)
sha256sums=('a71d4a56f978a33f8c5e821d3b38d58defb0d50e297bef1f86802c4c97c5b451'
            '0d615e1b2469a295710ac037bab4949e29f3e8c378808804dfa61b8a714fa134')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    local meson_options=(
        --cross-file cross/linux-mingw-w64-64bit.txt
        -D b_lto=false           # 禁用 LTO
        -D b_ndebug=true         # 禁用调试
        -D b_pie=false           # 禁用 PIE（Windows 不支持）
        -D c_winlibs=''          # 清空 Windows 库
        -D c_link_args=''        # 清空链接参数
        -D cpp_link_args=''      # 清空 C++ 链接参数
    )

    cd "${srcdir}/${pkgname}"

    meson setup _build "${meson_options[@]}"
    meson compile -C _build
}

package() {
    cd "${srcdir}/${pkgname}"
    install -vDm755 _build/*.exe -t "${pkgdir}/opt/${pkgname}/"
    install -vDm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    # install -vDm644 "${srcdir}/${pkgname}"/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
