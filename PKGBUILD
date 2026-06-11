# Maintainer: Alex Macocian <amacocian@yahoo.com>
pkgname=rainbeau
pkgver=0.2.0
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
    'quickshell'
    'rlottie'
    'waybar'
)
makedepends=('go')
optdepends=(
    'bluetuith: Bluetooth panel launched from generated Waybar config'
    'code: generated VS Code settings'
    'firefox: generated Firefox theme files'
    'dunst: notification daemon config generation and reload'
    'glslviewer: GLSL shader wallpaper rendering'
    'hyprchat: generated HyprChat theme'
    'hyprlock: generated lock screen config'
    'hyprtoolkit: generated Hyprtoolkit config'
    'mpvpaper: video, Lottie, and shader wallpapers'
    'neovim: generated Neovim colorscheme and live reload'
    'omni-launcher: generated Omni Launcher config'
    'quick-visor: generated Quick Visor theme'
    'wofi: generated launcher style'
    'jq: monitor discovery in generated wallpaper scripts'
    'bluez-utils: Bluetooth status script'
    'nvidia-utils: NVIDIA GPU usage and temperature scripts'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AlexMacocian/rainbeau/archive/v${pkgver}.tar.gz")
sha256sums=('5a66bc03228d3502c2b20c6e7830768bb46319710d57ac161c4dc824b350eb5a')

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
