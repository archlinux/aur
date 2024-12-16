# Maintainer: taotieren <admin@taotieren.com>

pkgname=manhuagui-downloader
pkgver=0.9
pkgrel=0
pkgdesc="漫画柜 manhuagui 看漫画 下载器，带图形界面，支持下载隐藏内容、导出PDF"
arch=($CARCH)
url="https://github.com/lanyeeee/manhuagui-downloader"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
# replaces=(${pkgname})
depends=(
    gdk-pixbuf2
    glib2
    glibc
    gtk3
    hicolor-icon-theme
    webkit2gtk
)
makedepends=(
    pnpm
    go
    wails
)
backup=()
options=(!debug !strip !lto)
#install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('864688bdae980ad2ad21e2797a2b08ffbc4ef3d910aa53e32383d34087d3b32d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.cn,direct

    wails build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    install -Dvm755 build/bin/${pkgname} -t ${pkgdir}/usr/bin
    install -Dvm644 build/appicon.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png
    install -Dvm644 /dev/stdin ${pkgdir}/usr/share/applications/${pkgname}.desktop <<EOF
[Desktop Entry]
Categories=
Comment=${pkgdesc}
Exec=${pkgname}
Icon=${pkgname}.png
Name=${pkgname}
Terminal=false
Type=Application

EOF
}
