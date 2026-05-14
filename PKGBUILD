# Maintainer: Valerii Trembovetskyy <your@email>
pkgname=exiled-traders
pkgver=0.1.0
pkgrel=1
pkgdesc="PoE 2 overlay tool for Wayland/Hyprland — price checking, market browsing, live search"
arch=('x86_64')
url="https://github.com/vtrembo/Exiled-Traders-2"
license=('LicenseRef-Proprietary')
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-wayland'
    'layer-shell-qt'
    'xdotool'
    'xclip'
)
makedepends=('cmake' 'ninja' 'gcc')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cmake -B build -S "Exiled-Traders-2-${pkgver}" -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j
}

package() {
    install -Dm755 "build/app/exiled-traders" "${pkgdir}/usr/bin/exiled-traders"
    install -Dm755 "build/input-daemon/exiled-traders-input" "${pkgdir}/usr/bin/exiled-traders-input"
    install -Dm644 "Exiled-Traders-2-${pkgver}/packaging/exiled-traders.desktop" \
        "${pkgdir}/usr/share/applications/exiled-traders.desktop"
    install -Dm644 "Exiled-Traders-2-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
    echo ">>> Add your user to the input group for hotkey support:"
    echo ">>>   sudo usermod -aG input \$USER"
    echo ">>> Then log out and back in."
}
