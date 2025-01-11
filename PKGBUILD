# Maintainer: taotieren <admin@taotieren.com>

pkgname=res-downloader
pkgver=3.0.2
pkgrel=1
pkgdesc="This is a high-value and high-performance and diverse resource downloader called res-downloader"
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
optdepends=(
    'motrix: A full-featured download manager (release version)'
    'gopeed: High speed downloader that supports all platforms.(Prebuilt version)'
)
backup=()
options=(!debug !strip !lto)
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    ${pkgname}.install)
sha256sums=('a4312e1e1cdb8e814c715dada939566376e77f1a0d9f5161a2dbc50445cfe503'
            '23a4cbb1eb388d0a847bbc9918a103769b15ad22d462840fe5d9d6bd6a720cbe')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.cn,direct

    sed -i -e 's|/usr/local/share/ca-certificates/|/usr/share/ca-certificates/trust-source/|g' \
        -e 's|update-ca-certificates|update-ca-trust|g' core/system_linux.go
    wails build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    install -Dvm755 build/bin/${pkgname} -t ${pkgdir}/usr/bin
    install -Dvm644 build/appicon.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png
    install -Dvm644 build/linux/Debian/usr/share/applications/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
