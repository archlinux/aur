# Maintainer: taotieren <admin@taotieren.com>

pkgname=mwtool-git
pkgver=0.0.1.3.r9.g429fba8
pkgrel=1
pkgdesc="云固件配置工具箱"
arch=('any')
url="https://gitee.com/xish-cc/MWTool"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(sh
    yad)
makedepends=(
    git
    dos2unix)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=('!strip' '!debug')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

package() {
    dos2unix "${srcdir}"/${pkgname}/bash/mw.sh
    install -Dm755 "${srcdir}"/${pkgname}/bash/mw.sh ${pkgdir}/usr/bin/mw
    install -dm777 ${pkgdir}/media/me/
}
