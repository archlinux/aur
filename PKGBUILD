pkgname=mpv-uosc
pkgver=5.6.0
pkgrel=1
pkgdesc="Feature-rich minimalist proximity-based UI for MPV player."
arch=("x86_64")
url="https://github.com/tomasklaen/uosc"
license=("LGPL-2.1-or-later")
optdepends=(
    "mpv-thumbfast: for showing thumbnails on-the-fly on seek"
)
makedepends=("go" "upx")
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/tomasklaen/uosc/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('bee4f976300b18b65e8596ddf24ee8ff6f23559d88a363d4ec6d16365cfcfa6f')
options=('!strip') # UPX will break this. So we strip manually before upx the binary.

build(){
    cd "${srcdir}/uosc-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o ./ziggy-linux ./src/ziggy/ziggy.go
    strip "${STRIP_BINARIES}" ./ziggy-linux
    upx ./ziggy-linux
}
package(){
    depends=("mpv")
    cd "${srcdir}/uosc-${pkgver}"
    mkdir -p "${pkgdir}/usr/share/mpv/scripts"
    cp -a --no-preserve=ownership ./src/uosc "${pkgdir}/usr/share/mpv/scripts/uosc"
    install -Dm755 ziggy-linux "${pkgdir}/usr/share/mpv/scripts/uosc/bin/ziggy-linux"
    install -Dm644 ./src/uosc.conf "${pkgdir}/usr/share/mpv/script-opts/uosc.conf"
    for font in uosc_icons.otf uosc_textures.ttf
    do
        install -Dm644 ./src/fonts/${font} "${pkgdir}/usr/share/mpv/fonts/${font}"
    done
}
