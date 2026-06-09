# Maintainer: Alex Macocian <amacocian@yahoo.com>
pkgname=rainbeau
pkgver=0.1.0
pkgrel=1
pkgdesc="Hyprland theme engine that generates desktop configs and animated wallpapers"
arch=('x86_64')
url="https://github.com/AlexMacocian/rainbeau"
license=('MIT')
depends=(
    'ffmpeg'
    'glib2'
    'hyprland'
    'hyprpaper'
    'kitty'
    'libnotify'
    'rlottie'
    'waybar'
)
makedepends=('go')
optdepends=(
    'dunst: notification daemon config generation and reload'
    'glslviewer: GLSL shader wallpaper rendering'
    'mpvpaper: video, Lottie, and shader wallpapers'
    'jq: monitor discovery in generated wallpaper scripts'
    'bluez-utils: Bluetooth status script'
    'nvidia-utils: NVIDIA GPU usage and temperature scripts'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AlexMacocian/rainbeau/archive/v${pkgver}.tar.gz")
sha256sums=('9b27d36d12b26537e577081c72aacc13e1723202c8d0efd3e6dbf70d0d78454e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-linkmode=external -X main.version=${pkgver}" -o "${pkgname}" .
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
