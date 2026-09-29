# Maintainer: AkusenArcade <akudesyn@gmail.com>

pkgname=bioma-shell
_tag=v1.0.0-beta.10
pkgver=1.0.0beta10
pkgrel=1
pkgdesc="A desktop shell for niri, built with Quickshell: living surfaces rather than a bar"
arch=('x86_64' 'aarch64')
url="https://github.com/AkusenArcade/Bioma"
license=('GPL-3.0-or-later')
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
    # Dictation (PRD §9.6): installing Bioma installs all of it.
    'whisper-cpp'
    'ggml-vulkan'
    'whisper.cpp-model-large-v3-turbo-q5_0'
    'python-evdev'
)
makedepends=('cargo' 'clang' 'pipewire')
optdepends=(
    'matugen: palettes computed from the wallpaper'
    'grim: screenshots'
    'tesseract: text recognition from a region'
    'wl-screenrec: screen recording (VAAPI)'
    'wf-recorder: screen recording, fallback'
    'networkmanager: Wi-Fi, wired, VPN profiles and proxy triggers'
    'bluez-utils: Bluetooth'
    'cups: printers in the connectivity cell'
    'avahi: network printers found and added driverless'
    'ddcutil: the brightness of external monitors'
    'pipewire: audio and the alarm sound'
    'upower: the battery, on a laptop'
    'pciutils: the graphics card in the System cell'
    'libnotify: timer and alarm notifications'
    'hyprlock: the fallback lock screen'
    'swaylock: the fallback lock screen, if hyprlock is not installed'
    'greetd: the Bioma greeter'
    'xdg-desktop-portal: the desktop file picker for the avatar'
    'ttf-spectral: the expressive typeface'
    'ttf-orbitron: the technical typeface'
)
# libspa builds a small C shim that makepkg's LTO turns into bitcode, which
# Rust's linker cannot resolve (undefined spa_format_parse_libspa_rs).
options=('!lto')
install=bioma-shell.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('717c87ca43cff10bcd5354f8fe8b2bf77f36b351ef816e4337649b8ca3219ac0')

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
