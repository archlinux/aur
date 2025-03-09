# Maintainer: taotieren <admin@taotieren.com>

_pkgname=GX_ISPTool
pkgname=gx-isptool-git
pkgver=r20.dac5b44
pkgrel=6
pkgdesc="GX (感芯科技) 芯片下载工具，用于连接USB给GX芯片下载固件/调试固件，持续开发中，欢迎支持~"
arch=($CARCH)
url="https://gitee.com/gxchip/${_pkgname}"
license=('LGPL-3.0-or-later')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    glibc
    gcc-libs
    hidapi
    # fonts depends
    #     noto-fonts-cjk
    qt5-base)
makedepends=(git
    qt5-tools)
backup=()
options=()
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd "${srcdir}/${pkgname}"
    qmake ${_pkgname}.pro
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    INSTALL_ROOT=${pkgdir} make install
}
