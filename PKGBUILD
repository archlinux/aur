# Maintainer: taotieren <admin@taotieren.com>

_pkgname=GX_CodeGen
pkgname=gx-codegen-git
pkgver=1.0.r5.gf7217e2
pkgrel=6
pkgdesc="GX (感芯科技)芯片代码生成器，Qt编写，用于方便的配置各个线程的相关主频及栈空间参数，生成对应的lds文件与.h文件"
arch=($CARCH)
url="https://gitee.com/gxchip/${_pkgname}"
license=('LGPL-3.0-or-later')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    glibc
    gcc-libs
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
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^V//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
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
