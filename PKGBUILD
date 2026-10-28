#!/usr/bin/env bash

pkgname=xerahs-git
pkgver=0.33.6.r5120.gb43fa228
pkgrel=1
pkgdesc='Cross-platform screen capture and sharing tool'
arch=('x86_64')
url='https://github.com/KovaForge/XerahS'
license=('GPL-3.0-or-later')
provides=('xerahs')
conflicts=('xerahs')
# qt6-base, layer-shell-qt, libdeflate and wl-clipboard are needed by the bundled OmaSnap
# capture engine (XIP0088), used on Hyprland/Omarchy sessions and ignored elsewhere.
depends=('glibc' 'gcc-libs' 'fontconfig' 'icu' 'openssl' 'zlib' 'dbus' 'libx11' 'hicolor-icon-theme' 'qt6-base' 'layer-shell-qt' 'libdeflate' 'wl-clipboard')
optdepends=(
    'gnome-shell-extension-appindicator: system tray icon on GNOME'
    'ffmpeg: screen recording and video editing'
    'gst-plugin-pipewire: Wayland portal recording source'
    'gst-plugins-good: native GStreamer recording muxers'
    'gst-plugins-ugly: native GStreamer H.264 encoder'
    'wl-clipboard: Wayland clipboard support'
    'xclip: X11 clipboard support'
    'xdotool: X11 window management'
    'grim: Wayland screenshot utility'
    'slurp: Wayland region selection for screenshots'
    'tesseract: OCR in the OmaSnap editor'
    'tesseract-data-eng: English OCR data for the OmaSnap editor'
)
makedepends=('git' 'dotnet-sdk>=10.0' 'python' 'cmake' 'ninja' 'pkgconf' 'qt6-base' 'layer-shell-qt' 'wayland-protocols' 'libdeflate')
options=('!strip' '!debug')

# Normal AUR builds fetch the public fork. The local packaging helper can explicitly
# select an existing clone, including its committed-but-not-yet-pushed submodules.
_xerahs_repo_root="${XERAHS_REPO_ROOT:-}"
source=('xerahs::git+https://github.com/KovaForge/XerahS.git#branch=develop')
if [[ -n "$_xerahs_repo_root" ]]; then
    source=("xerahs::git+file://${_xerahs_repo_root}")
    # The caller explicitly selected this trusted local clone. Permit upload-pack
    # to fetch missing objects if it is a partial clone (Git otherwise refuses).
    export GIT_NO_LAZY_FETCH=0
fi
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/xerahs"

    local base_version
    local revision_count
    local short_hash

    base_version=$(sed -n 's:.*<Version>\(.*\)</Version>.*:\1:p' Directory.Build.props | head -n 1)
    revision_count=$(git rev-list --count HEAD)
    short_hash=$(git rev-parse --short HEAD)

    printf '%s.r%s.g%s\n' "$base_version" "$revision_count" "$short_hash"
}

prepare() {
    cd "$srcdir/xerahs"

    git submodule init
    git submodule sync --recursive
    local transport=()
    if [[ -n "$_xerahs_repo_root" ]]; then
        # Override local Git config, never the tracked .gitmodules file.
        while IFS= read -r name; do
            local path recorded_sha
            path=$(git config --file .gitmodules "submodule.$name.path")
            recorded_sha=$(git ls-tree HEAD -- "$path" | awk '{print $3}')
            if [[ -n "$recorded_sha" ]] &&
                    git -C "$_xerahs_repo_root/$path" cat-file -e "$recorded_sha^{commit}" 2>/dev/null; then
                git config "submodule.$name.url" "$_xerahs_repo_root/$path"
            fi
        done < <(git config --file .gitmodules --get-regexp 'submodule\..*\.path' |
            sed -E 's/^submodule\.(.+)\.path .*/\1/')
        # Permit file transport only for the explicitly selected local source.
        transport=(-c protocol.file.allow=always)
    fi
    git "${transport[@]}" submodule update --init --recursive --checkout

}

build() {
    cd "$srcdir/xerahs"

    # Compile the editor API paired with this parent revision, never a floating head.
    bash build/verify-submodules.sh "$PWD"

    export XERAHS_ARCHITECTURES='linux-x64'
    # Build the vendored OmaSnap capture engine into the portable tarball (XIP0088).
    export XERAHS_BUILD_OMASNAP=1
    export XERAHS_PLUGIN_JOBS=1

    # Arch needs only the portable payload; do not hide unrelated packaging failures.
    export XERAHS_TARBALL_ONLY=1
    export OMASNAP_BUILD_DIR="$srcdir/omasnap-build"
    ./build/linux/package-linux.sh

}

package() {
    cd "$srcdir/xerahs"

    local app_version
    local publish_tarball

    app_version=$(sed -n 's:.*<Version>\(.*\)</Version>.*:\1:p' Directory.Build.props | head -n 1)
    publish_tarball="$srcdir/xerahs/dist/XerahS-${app_version}-linux-x64.tar.gz"

    install -d "$pkgdir/usr/lib/xerahs"
    bsdtar -xf "$publish_tarball" -C "$pkgdir/usr/lib/xerahs"

    if [[ -f "$pkgdir/usr/lib/xerahs/XerahS" ]]; then
        chmod 755 "$pkgdir/usr/lib/xerahs/XerahS"
    fi

    if [[ -f "$pkgdir/usr/lib/xerahs/xerahs-watchfolder-daemon" ]]; then
        chmod 755 "$pkgdir/usr/lib/xerahs/xerahs-watchfolder-daemon"
    fi

    if [[ -f "$pkgdir/usr/lib/xerahs/omaxerahs" ]]; then
        chmod 755 "$pkgdir/usr/lib/xerahs/omaxerahs"
    fi

    if [[ -f "$pkgdir/usr/lib/xerahs/omasnap/omasnap" ]]; then
        chmod 755 "$pkgdir/usr/lib/xerahs/omasnap/omasnap"
        install -d "$pkgdir/usr/share/licenses/$pkgname/omasnap"
        cp -a "$pkgdir/usr/lib/xerahs/omasnap/licenses/." "$pkgdir/usr/share/licenses/$pkgname/omasnap/"
    elif [[ "$CARCH" == "x86_64" ]]; then
        # XIP0088: OmaSnap is XerahS's capture engine on Omarchy/Hyprland; never ship without it.
        echo "==> package: the portable tarball has no omasnap/omasnap; refusing to package without OmaSnap" >&2
        return 1
    fi

    install -d "$pkgdir/usr/bin"
    ln -s ../lib/xerahs/XerahS "$pkgdir/usr/bin/xerahs"
    ln -s ../lib/xerahs/omaxerahs "$pkgdir/usr/bin/omaxerahs"

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/xerahs.desktop" <<'DESKTOP'
[Desktop Entry]
Name=XerahS
Comment=Cross-platform screen capture and sharing tool
GenericName=Screen Capture
Exec=/usr/bin/xerahs %U
Icon=xerahs
Terminal=false
Type=Application
MimeType=x-scheme-handler/xerahs;
Categories=Utility;Graphics;GTK;
Keywords=screenshot;screen;capture;share;upload;
StartupWMClass=xerahs
X-GNOME-UsesNotifications=true
X-KDE-DBUS-Restricted-Interfaces=org.kde.KWin.ScreenShot2
DESKTOP

    install -Dm644 "$srcdir/xerahs/src/desktop/app/XerahS.UI/Assets/Logo.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/xerahs.png"
}
