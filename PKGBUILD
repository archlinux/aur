# Maintainer: Stella <stellarinfinity@riseup.net>
pkgname=danser
url="https://github.com/Wieku/danser-go"
pkgver=0.8.3
pkgrel=1
pkgdesc="Dancing visualizer of osu! maps and custom osu! client written in Go."
arch=('any')
license=('GPL3')
conflicts=('danser-git')
source=(
    "https://github.com/Wieku/danser-go/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('0fbef177cf7341fc3a30cb8ab900a5794c661887d6cf556ff3e3976fe2e47968')
depends=(
    'libyuv'
    'ffmpeg'
    'gtk3'
)
makedepends=(
    'gcc'
    'go>=1.17'
    'libxi'
    'libxinerama'
    'libxrandr'
    'xorg-server-devel'
)

build() {
    cd "${srcdir}/danser-go-${pkgver}"

    # build the library first for the gui and the hollowed out cli
    go build \
        -trimpath \
        -modcacherw \
        -mod=readonly \
        -ldflags "-s -w -X 'github.com/wieku/danser-go/build.VERSION=$pkgver'
            -X 'github.com/wieku/danser-go/build.Stream=Release'
            -X 'github.com/wieku/danser-go/build.DanserExec=danser'" \
        -buildmode=c-shared \
        -o danser-core.so \
        -v -x

    mv danser-core.so libdanser-core.so

    # build the CLI
    cc -o danser -I. cmain/main_danser.c -Wl,-rpath,. -Wl,-rpath,/usr/lib/danser -L. -ldanser-core
    # build the launcher
    cc -D LAUNCHER -o danser-launcher -I. cmain/main_danser.c -Wl,-rpath,. -Wl,-rpath,/usr/lib/danser -L. -ldanser-core


    go run tools/assets/assets.go ./

}

package() {
    cd "${srcdir}/danser-go-${pkgver}"
    mkdir -p "${pkgdir}/usr/lib/danser" "${pkgdir}/usr/bin"

    install -Dm755 libdanser-core.so libbass.so libbass_fx.so libbassmix.so assets.dpak "${pkgdir}/usr/lib/danser"
    install -Dm755 danser "${pkgdir}/usr/lib/danser/danser"
    install -Dm755 danser-launcher "${pkgdir}/usr/lib/danser/danser-gui"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ln -s "/usr/lib/danser/danser" "${pkgdir}/usr/bin/danser"
    ln -s "/usr/lib/danser/danser-gui" "${pkgdir}/usr/bin/danser-gui"
}
