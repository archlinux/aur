pkgname=mpv-uosc
pkgver=5.1.1
pkgrel=1
pkgdesc="Feature-rich minimalist proximity-based UI for MPV player."
arch=("x86_64")
url="https://github.com/tomasklaen/uosc"
license=("GPL3")
optdepends=(
    "mpv-thumbfast: for showing thumbnails on-the-fly on seek"
)
makedepends=("git" "go" "upx")
source=(
    "git+${url}.git#tag=${pkgver}"
)
sha256sums=(
    'SKIP'
)

build(){
    cd "${srcdir}/uosc"
    go build -ldflags "-s -w" -o ./ziggy-linux ./src/ziggy/ziggy.go
    upx ./ziggy-linux
}
package(){
    depends=("mpv")
    cd "${srcdir}/uosc"
    mkdir -p "${pkgdir}/usr/share/mpv/scripts"
    cp -r ./src/uosc "${pkgdir}/usr/share/mpv/scripts/uosc"
    install -Dm755 ziggy-linux "${pkgdir}/usr/share/mpv/scripts/uosc/bin/ziggy-linux"
    install -Dm644 ./src/uosc.conf "${pkgdir}/usr/share/mpv/script-opts/uosc.conf"
    for font in uosc_icons.otf uosc_textures.ttf
    do
        install -Dm644 ./src/fonts/${font} "${pkgdir}/usr/share/mpv/fonts/${font}"
    done
}
