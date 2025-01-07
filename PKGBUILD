# Maintainer: taotieren <admin@taotieren.com>

pkgname=res-downloader
pkgver=3.0.1
pkgrel=1
pkgdesc="支持视频号、小程序、抖音、快手、小红书、直播流、酷狗、QQ音乐等常见网络资源! "
arch=($CARCH)
url="https://github.com/putyy/res-downloader"
license=('Apache-2.0')
provides=(${pkgname})
conflicts=(${pkgname})
# replaces=(${pkgname})
depends=(
    ca-certificates-utils
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
sha256sums=('952ba006706972e3464e5da9834c4cc1c04a63ae55823ee3cd4feb3be26e8512')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.cn,direct

    sed -i -e 's|/usr/local/share/ca-certificates/|/usr/share/ca-certificates/trust-source/anchors/|g' \
        -e 's|update-ca-certificates|update-ca-trust|g' core/system_linux.go
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
