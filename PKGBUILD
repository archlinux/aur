# Maintainer: Niko Teressi <nikoteressi@gmail.com>
# Contributor: Niko Teressi <nikoteressi@gmail.com>

pkgname=alpaka-desktop-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Native Tauri v2 desktop client for Ollama — Arch Linux / KDE Plasma 6 / Wayland"
arch=('x86_64')
url="https://github.com/nikoteressi/alpaka-desktop"
license=('MIT')

provides=('alpaka-desktop')
conflicts=('alpaka-desktop')

depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'glib2'
    'cairo'
    'pango'
    'gdk-pixbuf2'
    'libsoup3'
    'dbus'
    'openssl'
    'libappindicator-gtk3'
    'hicolor-icon-theme'
    'desktop-file-utils'
    'xdg-utils'
)

# AppImage ships its own runtime; no build-time tools needed beyond fuse2
makedepends=('fuse2')

options=(!strip)

_appimage="alpaka-desktop-${pkgver}.AppImage"

source=("${_appimage}::https://github.com/nikoteressi/alpaka-desktop/releases/download/v${pkgver}/alpaka-desktop_${pkgver}_amd64.AppImage")
sha256sums=('24dc67247cced5a0478fbf4c18b5943dc345b716321cf8267d1d329832d873e1')

noextract=("${_appimage}")

prepare() {
    chmod +x "${srcdir}/${_appimage}"
    "${srcdir}/${_appimage}" --appimage-extract
}

package() {
    # Install the extracted squashfs-root as our working tree
    local _squash="${srcdir}/squashfs-root"

    # --- Binary ---
    # Use the actual Tauri binary, not AppRun. AppRun is the AppImage launcher
    # and expects apprun-hooks/ to be co-located — that path doesn't exist after
    # extraction and installation to /usr/bin.
    _bin="${_squash}/usr/bin/alpaka-desktop"
    [[ ! -f "${_bin}" ]] && _bin="${_squash}/AppRun"
    install -Dm755 "${_bin}" "${pkgdir}/usr/bin/alpaka-desktop"

    # --- Desktop entry ---
    # Use the .desktop shipped inside the AppImage if present, otherwise install
    # a generated fallback so the AUR package is always self-contained.
    if [[ -f "${_squash}/alpaka-desktop.desktop" ]]; then
        install -Dm644 "${_squash}/alpaka-desktop.desktop" \
            "${pkgdir}/usr/share/applications/alpaka-desktop.desktop"
    elif [[ -f "${_squash}/usr/share/applications/alpaka-desktop.desktop" ]]; then
        install -Dm644 "${_squash}/usr/share/applications/alpaka-desktop.desktop" \
            "${pkgdir}/usr/share/applications/alpaka-desktop.desktop"
    else
        install -dm755 "${pkgdir}/usr/share/applications"
        cat > "${pkgdir}/usr/share/applications/alpaka-desktop.desktop" <<EOF
[Desktop Entry]
Name=Alpaka Desktop
Comment=Native Ollama desktop client for Linux
Exec=alpaka-desktop
Icon=alpaka-desktop
Type=Application
Categories=Utility;Network;
StartupWMClass=alpaka-desktop
Keywords=ollama;ai;llm;chat;
EOF
    fi

    # --- Icons ---
    # Install all hicolor icon sizes that ship inside the AppImage
    local _icon_base="${_squash}/usr/share/icons/hicolor"
    if [[ -d "${_icon_base}" ]]; then
        local _size
        for _size_dir in "${_icon_base}"/*/; do
            _size="$(basename "${_size_dir}")"
            if [[ -f "${_size_dir}/apps/alpaka-desktop.png" ]]; then
                install -Dm644 "${_size_dir}/apps/alpaka-desktop.png" \
                    "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/alpaka-desktop.png"
            fi
        done
    fi

    # Fallback: install the 128x128 icon directly from squashfs root if hicolor
    # tree is absent (Tauri sometimes places icons at the top level)
    if [[ ! -d "${_icon_base}" ]]; then
        if [[ -f "${_squash}/usr/share/icons/hicolor/128x128/apps/alpaka-desktop.png" ]]; then
            install -Dm644 "${_squash}/usr/share/icons/hicolor/128x128/apps/alpaka-desktop.png" \
                "${pkgdir}/usr/share/icons/hicolor/128x128/apps/alpaka-desktop.png"
        elif [[ -f "${_squash}/.DirIcon" ]]; then
            install -Dm644 "${_squash}/.DirIcon" \
                "${pkgdir}/usr/share/icons/hicolor/128x128/apps/alpaka-desktop.png"
        fi
    fi
}
