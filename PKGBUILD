# Maintainer: Xuda Ye <abneryepku at outlook dot com>
pkgname=sound-blasterx-g6-control-git
_pkgname=sound-blasterx-g6-control
pkgver=r8.d53a56c
pkgrel=1
pkgdesc="Linux controller for the Creative Sound BlasterX G6 (USB 041e:3256): DSP, EQ, output mode, DAC filter"
arch=('x86_64')
url="https://github.com/xuda-ye-math/Sound-BlasterX-G6-Control"
license=('MIT')

depends=(
    'libusb'         # rusb (USB reset) + hidapi linux-static-libusb backend
    'systemd-libs'   # libudev for hidapi device enumeration
    'alsa-utils'     # amixer / arecord for `init`, `watch`, `test mic`
    'libpulse'       # pactl / paplay (works against pipewire-pulse or pulseaudio)
    'wayland'        # GUI: eframe wayland backend
    'libxkbcommon'   # GUI: egui input
    'mesa'           # GUI: OpenGL via glow
    'fontconfig'     # GUI: font discovery
)

makedepends=(
    'git'
    'rust'           # >= 1.85 (workspace edition = "2024"); use rustup if your repo's rust is older
    'cargo'
    'pkgconf'
)

optdepends=(
    'polkit: required for the GUI Setup buttons (pkexec)'
    'hyprpolkitagent: Hyprland polkit authentication agent'
    'polkit-gnome: GNOME / XFCE polkit authentication agent'
    'polkit-kde-agent: KDE polkit authentication agent'
    'sudo: terminal fallback when no polkit agent is running'
    'pipewire-pulse: provides the Pulse-compatible server for pactl/paplay (or use pulseaudio)'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

# makepkg's default `lto` option injects -flto=auto into CFLAGS, which cc-rs
# then passes when compiling hidapi's bundled C backend. GCC emits LTO bitcode
# (only .gnu.lto_* sections, no native .text bodies) into the static archive,
# and rust-lld cannot resolve hid_* symbols against GCC LTO objects.
options=('!lto')

source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    export CARGO_TARGET_DIR=target
    cargo build --release --locked --workspace
}

package() {
    cd "$pkgname"

    install -Dm755 target/release/g6-cli "$pkgdir/usr/bin/g6-cli"
    install -Dm755 target/release/g6-gui "$pkgdir/usr/bin/g6-gui"

    # udev rule. /etc/udev/rules.d/ is where `g6-cli init` checks for "already
    # installed", so installing here lets init skip the sudo prompt entirely.
    install -Dm644 udev/91-soundblaster-g6.rules \
        "$pkgdir/etc/udev/rules.d/91-soundblaster-g6.rules"

    install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# User-saved profiles live in ~/.config/sound-blasterx-g6-control/ regardless of
# install location. The three built-ins (default/scout/sbx) are baked into the
# binary, so no profile JSONs need to ship in /usr/share/.
