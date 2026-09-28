# Maintainer: HowieDuhzit <contact@howieduhzit.best>
#
# Build from the published repository:   makepkg -si
# Build the working tree you are in:      OMACHAT_SRC=$PWD/../.. makepkg -si
#
# The Omarchy shell plugin is not part of this package; it is installed and
# removed independently with `omarchy plugin add|remove` (see README).

pkgname=omachat
pkgver=0.2.0
pkgrel=1
pkgdesc="Native voice, text and screen chat for Omarchy and Linux (client, daemon, CLI and self-hostable server)"
arch=('x86_64' 'aarch64')
url="https://github.com/Sleepy-Studio/OmaChat"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-wayland' 'qtkeychain-qt6' 'protobuf' 'abseil-cpp'
         'libsodium' 'opus' 'libpipewire' 'openssl' 'tomlplusplus' 'rnnoise' 'ffmpeg' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'git' 'gtest')
optdepends=('gnome-keyring: store session tokens in the Secret Service keyring'
            'kwallet: alternative Secret Service keyring'
            'xdg-desktop-portal: screen sharing, with a backend such as xdg-desktop-portal-hyprland')
backup=()
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
if [[ -n ${OMACHAT_SRC:-} ]]; then
    source=()
    sha256sums=()
fi

_src() {
    if [[ -n ${OMACHAT_SRC:-} ]]; then
        echo "${OMACHAT_SRC}"
    else
        echo "${srcdir}/OmaChat"
    fi
}

build() {
    cmake -S "$(_src)" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DOMACHAT_BUILD_TESTS=ON
    cmake --build build
}

check() {
    # Hardware-free suites; integration tests use loopback TLS/UDP only.
    QT_QPA_PLATFORM=offscreen ctest --test-dir build -L 'unit|fuzz|integration' --output-on-failure
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "$(_src)/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "$(_src)/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
