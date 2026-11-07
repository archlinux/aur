# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=synshell-core-git
pkgver=0.2.0.r0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell: synwm compositor, shell, login screen, on-screen keyboard, screenshots and screen sharing, settings, file manager, terminal, software center'
depends=('mesa' 'libinput' 'seatd' 'systemd-libs' 'libxkbcommon' 'libdrm' 'pixman' 'vulkan-icd-loader' 'fontconfig' 'freetype2' 'ttf-font' 'breeze-icons' 'breeze-cursors' 'hicolor-icon-theme' 'dbus' 'pam' 'alsa-lib' 'ffmpeg' 'sqlite' 'libarchive' 'xdg-desktop-portal' 'pipewire' 'libpipewire' 'polkit')
optdepends=('xorg-xwayland: X11 applications'
            'wireplumber: volume control (wpctl)'
            'sound-theme-freedesktop: freedesktop sound theme (event fallback)'
            'brightnessctl: brightness'
            'networkmanager: network applet'
            'iwd: Wi-Fi (or networkmanager)'
            'bluez: Bluetooth'
            'playerctl: media keys'
            'wl-clipboard: screenshots and paths to the clipboard'
            'xdg-desktop-portal-kde: fallback file chooser portal'
            'shared-mime-info: file types in the file manager'
            'ffmpegthumbnailer: video thumbnails in the file manager'
            'libheif: HEIC/HEIF/AVIF in the image viewer and thumbnails'
            'imagemagick: rare image formats (JPEG XL, RAW…) in the image viewer'
            'archlinux-appstream-data: categories, icons and screenshots in the software center'
            'geoclue: location for applications (Maps, compass)'
            'base-devel: building AUR packages in the software center'
            'pacman-contrib: update checks without root (checkupdates)'
            'udisks2: USB drives and disks in the file manager'
            'gvfs-mtp: Android phones in the file manager (MTP)'
            'gvfs-gphoto2: cameras in the file manager (PTP)'
            'gvfs-afc: iPhone in the file manager'
            'gvfs-smb: Windows and Samba shares in the file manager'
            'git: git status in the file manager'
            'fuse3: archives as folders; files of linked devices'
            'intel-media-driver: hardware video on Intel'
            'libva-mesa-driver: hardware video on AMD'
            'nvidia-utils: NVIDIA driver (NVENC, neural networks on the GPU)')
provides=('synshell-core' 'syndesktop')
conflicts=('synshell-core' 'synshell-core-bin' 'syndesktop')
replaces=('syndesktop')
install=synshell-core.install
makedepends=('cargo' 'rust' 'git' 'clang' 'pkgconf' 'fuse3')
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
    cargo build --offline --release -p syn-wm -p syn-desktop-shell -p syn-login -p syn-keyboard -p syn-screencast -p syn-fsd -p syn-settings -p syn-pkg -p syn-files -p syn-shot -p syn-terminal
}

package() {
    local _root="$srcdir/synshell" _bins="$srcdir/synshell/target/release"
    cd "$_root"
    install -Dm755 "$_bins/synwm" "$pkgdir/usr/bin/synwm"
    install -Dm755 "$_bins/syndesktop-shell" "$pkgdir/usr/bin/syndesktop-shell"
    install -Dm755 "$_bins/synlogin" "$pkgdir/usr/bin/synlogin"
    install -Dm755 "$_bins/synkeyboard" "$pkgdir/usr/bin/synkeyboard"
    install -Dm755 "$_bins/syn-screencast" "$pkgdir/usr/bin/syn-screencast"
    install -Dm755 "$_bins/synfsd" "$pkgdir/usr/bin/synfsd"
    install -Dm755 "$_bins/synsettings" "$pkgdir/usr/bin/synsettings"
    install -Dm755 "$_bins/synpkg" "$pkgdir/usr/bin/synpkg"
    install -Dm755 "$_bins/synfiles" "$pkgdir/usr/bin/synfiles"
    install -Dm755 "$_bins/synshot" "$pkgdir/usr/bin/synshot"
    install -Dm755 "$_bins/syn-terminal" "$pkgdir/usr/bin/syn-terminal"
    install -Dm644 'crates/syn-settings/data/synsettings.desktop' "$pkgdir/usr/share/applications/synsettings.desktop"
    install -Dm644 'crates/syn-pkg/data/synpkg.desktop' "$pkgdir/usr/share/applications/synpkg.desktop"
    install -Dm644 'crates/syn-files/data/synfiles.desktop' "$pkgdir/usr/share/applications/synfiles.desktop"
    install -Dm644 'crates/syn-shot/data/synshot.desktop' "$pkgdir/usr/share/applications/synshot.desktop"
    install -Dm644 'crates/syn-terminal/data/syn-terminal.desktop' "$pkgdir/usr/share/applications/syn-terminal.desktop"
    install -Dm644 'crates/syn-terminal/data/icons/syn-terminal.svg' "$pkgdir/usr/share/icons/hicolor/scalable/apps/syn-terminal.svg"
    install -dm755 "$pkgdir/usr/share/applications/"
    for _f in 'crates/syn-files/data/synfiles-viewer.desktop'; do
        [ -e "$_f" ] || { echo "нет crates/syn-files/data/synfiles-viewer.desktop" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/usr/share/applications/"; else install -m644 "$_f" "$pkgdir/usr/share/applications/"; fi
    done
    install -dm755 "$pkgdir/usr/bin/"
    for _f in 'data/synshell-session'; do
        [ -e "$_f" ] || { echo "нет data/synshell-session" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/usr/bin/"; else install -m755 "$_f" "$pkgdir/usr/bin/"; fi
    done
    install -dm755 "$pkgdir/usr/share/wayland-sessions/"
    for _f in 'data/synshell.desktop'; do
        [ -e "$_f" ] || { echo "нет data/synshell.desktop" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/usr/share/wayland-sessions/"; else install -m644 "$_f" "$pkgdir/usr/share/wayland-sessions/"; fi
    done
    install -dm755 "$pkgdir/usr/share/sounds/"
    for _f in data/sounds/themes/*; do
        [ -e "$_f" ] || { echo "нет data/sounds/themes/*" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/usr/share/sounds/"; else install -m644 "$_f" "$pkgdir/usr/share/sounds/"; fi
    done
    install -dm755 "$pkgdir/usr/share/xdg-desktop-portal/"
    for _f in 'data/synshell-portals.conf'; do
        [ -e "$_f" ] || { echo "нет data/synshell-portals.conf" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/usr/share/xdg-desktop-portal/"; else install -m644 "$_f" "$pkgdir/usr/share/xdg-desktop-portal/"; fi
    done
    install -dm755 "$pkgdir/usr/share/xdg-desktop-portal/portals/"
    for _f in 'data/synshell.portal'; do
        [ -e "$_f" ] || { echo "нет data/synshell.portal" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/usr/share/xdg-desktop-portal/portals/"; else install -m644 "$_f" "$pkgdir/usr/share/xdg-desktop-portal/portals/"; fi
    done
    install -dm755 "$pkgdir/usr/lib/synpkg/"
    for _f in 'crates/syn-pkg/data/pacman-helper'; do
        [ -e "$_f" ] || { echo "нет crates/syn-pkg/data/pacman-helper" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/usr/lib/synpkg/"; else install -m755 "$_f" "$pkgdir/usr/lib/synpkg/"; fi
    done
    install -dm755 "$pkgdir/usr/share/polkit-1/actions/"
    for _f in 'crates/syn-pkg/data/org.synshell.synpkg.policy'; do
        [ -e "$_f" ] || { echo "нет crates/syn-pkg/data/org.synshell.synpkg.policy" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/usr/share/polkit-1/actions/"; else install -m644 "$_f" "$pkgdir/usr/share/polkit-1/actions/"; fi
    done
    ( echo '[Default Applications]'; cat crates/*/data/defaults.mimeapps | grep -v '^#' | grep '=' ) | install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/synshell-mimeapps.list"
    install -Dm644 'crates/synshell-ui/data/syndesktop-lock.pam' "$pkgdir/etc/pam.d/syndesktop-lock"
    install -Dm644 'crates/syn-login/data/synlogin.pam' "$pkgdir/etc/pam.d/synlogin"
    install -dm755 "$pkgdir/usr/lib/systemd/system/"
    for _f in 'crates/syn-login/data/synlogin.service'; do
        [ -e "$_f" ] || { echo "нет crates/syn-login/data/synlogin.service" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/usr/lib/systemd/system/"; else install -m644 "$_f" "$pkgdir/usr/lib/systemd/system/"; fi
    done
    install -dm755 "$pkgdir/usr/lib/systemd/system/"
    for _f in 'crates/syn-fsd/data/synfsd.service'; do
        [ -e "$_f" ] || { echo "нет crates/syn-fsd/data/synfsd.service" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/usr/lib/systemd/system/"; else install -m644 "$_f" "$pkgdir/usr/lib/systemd/system/"; fi
    done
    install -Dm644 'data/geoclue-synshell.conf' "$pkgdir/etc/geoclue/conf.d/90-synshell.conf"
    install -dm755 "$pkgdir/usr/share/doc/synshell/"
    for _f in 'docs/FSD.md'; do
        [ -e "$_f" ] || { echo "нет docs/FSD.md" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/usr/share/doc/synshell/"; else install -m644 "$_f" "$pkgdir/usr/share/doc/synshell/"; fi
    done
    install -Dm644 'crates/synshell-common/default-config.toml' "$pkgdir/usr/share/doc/synshell/config.toml.example"
    install -dm755 "$pkgdir/usr/bin"
    ln -sf 'synwm' "$pkgdir/usr/bin/syndesktop"
}
