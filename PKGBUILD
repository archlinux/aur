# Maintainer: taotieren <admin@taotieren.com>

_pkgname=SuperTabbar
pkgname=supertabbar-git
pkgver=r26.6c8dc30
pkgrel=1
pkgdesc="SuperTabbar 超级标签栏"
arch=($CARCH)
url="https://gitee.com/Limexb/SuperTabbar"
license=('GPL3')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=('dtkwidget' 'dtkgui')
makedepends=('git' 'qconf')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${_pkgname}" clean -dfx
}
build() {
    cd "${srcdir}/${_pkgname}"
    qmake ./${_pkgname}.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
    make -C ./build
}

package() {
    install -Dm0755 "${srcdir}/${_pkgname}/build/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm0644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -Dm0644 "${srcdir}/${_pkgname}/debian/top.yzzi.${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/top.yzzi.${pkgname%-git}.desktop"
    install -Dm0644 "${srcdir}/${_pkgname}/debian/top.yzzi.${pkgname%-git}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/top.yzzi.${pkgname%-git}.svg"
}
