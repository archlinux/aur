# Maintainer: AkusenArcade <akudesyn@gmail.com>

pkgname=bioma-shell
_tag=v1.0.0-beta.19
pkgver=1.0.0beta19
pkgrel=1
pkgdesc="A desktop shell for niri, built with Quickshell: living surfaces rather than a bar"
arch=('x86_64' 'aarch64')
url="https://github.com/AkusenArcade/Bioma"
license=('GPL-3.0-or-later')
# Everything Bioma draws or runs is a dependency, so the package is the whole
# shell and nothing is left to fetch by hand. Only two things stay optional:
# dictation, half a gigabyte of model for one button, and the company network
# wizard, which serves one kind of machine.
depends=(
    'niri'
    'quickshell'
    'qt6-5compat'
    'python'
    'glib2'
    'wl-clipboard'
    'imagemagick'
    'libpipewire'
    'gcc-libs'
    'glibc'
    'util-linux'
    'fontconfig'
    # The two voices (Typography): expressive and technical.
    'ttf-spectral'
    'ttf-orbitron'
    # Theme: palettes from the wallpaper, the wallpaper folder picker.
    'matugen'
    'zenity'
    # Capture: screenshots, text recognition (capture.ocr_language is eng),
    # screen recording.
    'grim'
    'tesseract'
    'tesseract-data-eng'
    'wl-screenrec'
    # Audio: pw-play for the alarm, pw-record for the microphone.
    'pipewire'
    'pipewire-audio'
    # Connectivity: networks, Bluetooth, printers.
    'networkmanager'
    'bluez'
    'bluez-utils'
    'cups'
    'avahi'
    # System and vitals: backlight, external monitors, battery, power profile
    # (tuned-ppd provides it too), the graphics card.
    'brightnessctl'
    'ddcutil'
    'upower'
    'power-profiles-daemon'
    'pciutils'
    # Timer and alarm notifications.
    'libnotify'
    # niri's portal configuration sends notifications to the gtk backend, and
    # the avatar's file picker goes through the portal.
    'xdg-desktop-portal'
    'xdg-desktop-portal-gtk'
    # Session: the lock screen's fallback (assets/hyprlock), the greeter, and
    # greetd's plain greeter, which asks for the password while there is no
    # copy of Bioma's to run (scripts/greeter-session).
    'hyprlock'
    'greetd'
    'greetd-agreety'
)
makedepends=('cargo' 'clang')
optdepends=(
    'whisper-cpp: dictation, the engine'
    'ggml-vulkan: dictation on the GPU; without it, the CPU'
    'whisper.cpp-model-large-v3-turbo-q5_0: dictation, the model (AUR)'
    'python-evdev: dictation, pasting into the window'
    'business-network-wizard: company network setup (NTLM proxy, VPN, 802.1X, shares), opened from the connectivity cell'
)
# libspa builds a small C shim that makepkg's LTO turns into bitcode, which
# Rust's linker cannot resolve (undefined spa_format_parse_libspa_rs).
options=('!lto')
install=bioma-shell.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('952b3980e24e2da24e27c446ce0cf3d2c39d77a263d0c17d3153df24caaf4b04')

_srcdir() {
    printf '%s/Bioma-%s' "$srcdir" "${_tag#v}"
}

prepare() {
    cd "$(_srcdir)/tools/sinestesia-bands"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$(_srcdir)/tools/sinestesia-bands"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$(_srcdir)"

    local share="$pkgdir/usr/share/bioma"
    install -d "$share"

    # What the shell, the lock screen and the greeter read at runtime. The
    # design documents and their media stay in the repository.
    cp -r --no-preserve=ownership \
        assets cells components config core greeter lock services structure scripts \
        "$share/"
    install -m644 shell.qml lock.qml greeter.qml "$share/"

    # The spectrum tool is architecture-dependent, so it lives in /usr/lib;
    # the shell looks for it where a build in the repository puts it.
    install -Dm755 tools/sinestesia-bands/target/release/sinestesia-bands \
        "$pkgdir/usr/lib/bioma/sinestesia-bands"
    install -d "$share/tools/sinestesia-bands/target/release"
    ln -s /usr/lib/bioma/sinestesia-bands \
        "$share/tools/sinestesia-bands/target/release/sinestesia-bands"

    # The scripts find the shell through their own path, links resolved.
    install -d "$pkgdir/usr/bin"
    ln -s /usr/share/bioma/scripts/bioma "$pkgdir/usr/bin/bioma"
    ln -s /usr/share/bioma/scripts/install "$pkgdir/usr/bin/bioma-install"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 docs/configuration.md "$pkgdir/usr/share/doc/$pkgname/configuration.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Dictation pastes through a uinput keyboard: the seat's user gets
    # /dev/uinput, as steam-devices gives it for controllers.
    install -Dm644 packaging/system/70-bioma-uinput.rules \
        "$pkgdir/usr/lib/udev/rules.d/70-bioma-uinput.rules"
    install -Dm644 packaging/system/bioma-uinput.conf \
        "$pkgdir/usr/lib/modules-load.d/bioma-uinput.conf"
}
