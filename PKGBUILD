# Maintainer: HowieDuhzit <contact@howieduhzit.best>
#
# Build from the published repository:   makepkg -si
# Build the working tree you are in:      OMACHAT_SRC=$PWD/../.. makepkg -si
#
# build() and check() are quiet by default (a short OK/summary line each,
# full output only on failure). For full compiler and per-test output:
#   OMACHAT_VERBOSE=1 makepkg -si
#
# The Omarchy bar widget plugin is not force-installed into any user's
# ~/.config (pacman runs as root and must not touch user home directories),
# but its files ship in the package and `omachat-omarchy-plugin install`
# wires it up per-user in one command. See omachat.install for the reminder
# shown after install/upgrade.

pkgname=omachat
pkgver=0.2.2
pkgrel=1
pkgdesc="Native voice, text and screen chat for Omarchy and Linux (client, daemon, CLI and self-hostable server)"
arch=('x86_64' 'aarch64')
url="https://github.com/Sleepy-Studio/OmaChat"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-wayland' 'qt6-multimedia' 'qtkeychain-qt6' 'protobuf' 'abseil-cpp'
         'libsodium' 'opus' 'libpipewire' 'openssl' 'tomlplusplus' 'rnnoise' 'ffmpeg' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'git' 'gtest')
optdepends=('gnome-keyring: store session tokens in the Secret Service keyring'
            'kwallet: alternative Secret Service keyring'
            'mpv: open video attachments in MPV'
            'xdg-desktop-portal: screen sharing, with a backend such as xdg-desktop-portal-hyprland')
backup=()
install=omachat.install
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
    if [[ ${OMACHAT_VERBOSE:-0} == 1 ]]; then
        cmake -S "$(_src)" -B build -G Ninja \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DOMACHAT_BUILD_TESTS=ON
        cmake --build build
        return
    fi
    # Quiet by default: hundreds of compiler lines are noise for an install.
    # Full output is still shown, unabridged, the moment anything fails.
    local log
    log="$(mktemp)"
    if ! { cmake -S "$(_src)" -B build -G Ninja \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DOMACHAT_BUILD_TESTS=ON \
        && cmake --build build; } >"$log" 2>&1; then
        cat "$log"
        rm -f "$log"
        return 1
    fi
    echo "build: OK (set OMACHAT_VERBOSE=1 to see full compiler output)"
    rm -f "$log"
}

check() {
    # Hardware-free suites; integration tests use loopback TLS/UDP only.
    if [[ ${OMACHAT_VERBOSE:-0} == 1 ]]; then
        QT_QPA_PLATFORM=offscreen ctest --test-dir build -L 'unit|fuzz|integration' --output-on-failure
        return
    fi
    # Quiet by default: 150+ individual PASS lines are noise for an install.
    # Full ctest output is still shown, unabridged, the moment anything fails.
    local log
    log="$(mktemp)"
    if ! QT_QPA_PLATFORM=offscreen ctest --test-dir build -L 'unit|fuzz|integration' --output-on-failure >"$log" 2>&1; then
        cat "$log"
        rm -f "$log"
        return 1
    fi
    grep -E '^[0-9]+% tests (passed|failed)|^Total Test time' "$log"
    rm -f "$log"
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "$(_src)/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "$(_src)/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    local plugin_src="$(_src)/integrations/omarchy"
    local plugin_dest="${pkgdir}/usr/share/omachat/omarchy-plugin"
    install -Dm755 "${plugin_src}/omachat-omarchy-plugin" "${plugin_dest}/omachat-omarchy-plugin"
    install -d "${plugin_dest}/io.github.howieduhzit.omachat"
    install -m644 "${plugin_src}"/io.github.howieduhzit.omachat/*.qml \
        "${plugin_src}"/io.github.howieduhzit.omachat/manifest.json \
        "${plugin_src}"/io.github.howieduhzit.omachat/README.md \
        "${plugin_dest}/io.github.howieduhzit.omachat/"
    install -d "${pkgdir}/usr/bin"
    ln -s /usr/share/omachat/omarchy-plugin/omachat-omarchy-plugin "${pkgdir}/usr/bin/omachat-omarchy-plugin"
}
