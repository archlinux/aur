# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=synshell-mobile-git
pkgver=0.2.0.r0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell for phones: mobile shell, modem (calls, SMS, data), NFC, compass, step counter'
depends=('synshell-core')
provides=('synshell-mobile')
conflicts=('synshell-mobile' 'synshell-mobile-bin')
makedepends=('cargo' 'rust' 'git' 'clang' 'pkgconf' 'mesa' 'libinput' 'seatd' 'libxkbcommon' 'libdrm' 'fontconfig' 'freetype2' 'dbus' 'ffmpeg' 'sqlite' 'libarchive' 'pipewire' 'alsa-lib' 'fuse3')
options=('!lto')
source=("synshell::git+https://github.com/VitaminDB/synshell.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/synshell"
    if git describe --tags >/dev/null 2>&1; then
        git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf '%s.r%s.g%s' '0.2.0' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

prepare() {
    cd "$srcdir/synshell"
    export RUSTUP_TOOLCHAIN=stable
    # Без --locked: git-зависимости (syngui и др.) свежие, Cargo.lock обновится.
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/synshell"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo build --offline --release -p syn-mobile-shell -p syn-modem -p syn-nfcd -p syn-phone -p syn-sms -p syn-nfc -p syn-compass -p syn-health
}

package() {
    local _root="$srcdir/synshell" _bins="$srcdir/synshell/target/release"
    cd "$_root"
    install -Dm755 "$_bins/synmobile-shell" "$pkgdir/usr/bin/synmobile-shell"
    install -Dm755 "$_bins/synmodem" "$pkgdir/usr/bin/synmodem"
    install -Dm755 "$_bins/synmodemd" "$pkgdir/usr/bin/synmodemd"
    install -Dm755 "$_bins/synnfc" "$pkgdir/usr/bin/synnfc"
    install -Dm755 "$_bins/synnfcd" "$pkgdir/usr/bin/synnfcd"
    install -Dm755 "$_bins/synphone" "$pkgdir/usr/bin/synphone"
    install -Dm755 "$_bins/synsms" "$pkgdir/usr/bin/synsms"
    install -Dm755 "$_bins/syn-nfc" "$pkgdir/usr/bin/syn-nfc"
    install -Dm755 "$_bins/syn-compass" "$pkgdir/usr/bin/syn-compass"
    install -Dm755 "$_bins/syn-health" "$pkgdir/usr/bin/syn-health"
    install -Dm644 'crates/syn-phone/data/synphone.desktop' "$pkgdir/usr/share/applications/synphone.desktop"
    install -Dm644 'crates/syn-sms/data/synsms.desktop' "$pkgdir/usr/share/applications/synsms.desktop"
    install -Dm644 'crates/syn-nfc/data/syn-nfc.desktop' "$pkgdir/usr/share/applications/syn-nfc.desktop"
    install -Dm644 'crates/syn-nfc/data/icons/syn-nfc.svg' "$pkgdir/usr/share/icons/hicolor/scalable/apps/syn-nfc.svg"
    install -Dm644 'crates/syn-compass/data/syn-compass.desktop' "$pkgdir/usr/share/applications/syn-compass.desktop"
    install -Dm644 'crates/syn-compass/data/icons/syn-compass.svg' "$pkgdir/usr/share/icons/hicolor/scalable/apps/syn-compass.svg"
    install -Dm644 'crates/syn-health/data/syn-health.desktop' "$pkgdir/usr/share/applications/syn-health.desktop"
    install -Dm644 'crates/syn-health/data/icons/syn-health.svg' "$pkgdir/usr/share/icons/hicolor/scalable/apps/syn-health.svg"
    install -dm755 "$pkgdir/usr/lib/systemd/system/"
    for _f in 'crates/syn-modem/systemd/synmodem.service'; do
        [ -e "$_f" ] || { echo "нет crates/syn-modem/systemd/synmodem.service" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/usr/lib/systemd/system/"; else install -m644 "$_f" "$pkgdir/usr/lib/systemd/system/"; fi
    done
    install -dm755 "$pkgdir/usr/lib/systemd/system/"
    for _f in 'crates/syn-nfcd/systemd/synnfc.service'; do
        [ -e "$_f" ] || { echo "нет crates/syn-nfcd/systemd/synnfc.service" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/usr/lib/systemd/system/"; else install -m644 "$_f" "$pkgdir/usr/lib/systemd/system/"; fi
    done
    install -dm755 "$pkgdir/etc/xdg/autostart/"
    for _f in 'crates/syn-health/autostart/syn-health-tracker.desktop'; do
        [ -e "$_f" ] || { echo "нет crates/syn-health/autostart/syn-health-tracker.desktop" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/etc/xdg/autostart/"; else install -m644 "$_f" "$pkgdir/etc/xdg/autostart/"; fi
    done
}
