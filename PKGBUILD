pkgname=mpv-uosc
pkgver=5.13.0
pkgrel=1
pkgdesc="Feature-rich minimalist proximity-based UI for MPV player."
arch=("x86_64")
url="https://github.com/tomasklaen/uosc"
license=("LGPL-2.1-or-later")
optdepends=("mpv-thumbfast: for showing thumbnails on-the-fly on seek")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/tomasklaen/uosc/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('18fb38bd7d3ff3ca03f394b4d57daaa5a3f68051dcc31fdbfff3fbc874468913')

prepare(){
    cd "${srcdir}/uosc-${pkgver}"
    go get -modcacherw ./src/ziggy
}

build(){
    cd "${srcdir}/uosc-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-s -w -linkmode=external" -o ./ziggy-linux ./src/ziggy/ziggy.go
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
