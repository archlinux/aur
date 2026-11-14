# Maintainer: pakrohk <pakrohk@gmail.com>

_pkgname=hiddify-desktop
pkgname=${_pkgname}-bin
pkgver=5.5.5
pkgrel=1
pkgdesc="Multi-platform auto-proxy client supporting Sing-box, X-ray, TUIC, Hysteria, Reality, Trojan, SSH, and more. Open-source, secure, and ad-free."
arch=('x86_64')
url='https://github.com/hiddify/hiddify-app'
license=('GPL-3.0-only')
options=('!debug')
install="${pkgname}.install"

depends=(
    'at-spi2-core'
    'ayatana-ido'
    'cairo'
    'curl'
    'fontconfig'
    'gcc-libs'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'harfbuzz'
    'hicolor-icon-theme'
    'libayatana-appindicator'
    'libayatana-indicator'
    'libdbusmenu-glib'
    'libepoxy'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxinerama'
    'libxkbcommon'
    'libxrandr'
    'libxss'
    'pango'
    'wayland'
    'xdg-utils'
)

optdepends=(
    'gnome-shell-extension-appindicator: system tray icon in GNOME'
    'nftables: required for TUN mode firewall rules'
    'systemd: required for HiddifyTunnelService'
)

provides=('hiddify' 'hiddify-app')
conflicts=(
    'hiddify'
    'hiddify-bin'
    'hiddify-git'
    'hiddify-next'
    'hiddify-next-bin'
    'hiddify-next-git'
    'hiddify-app'
    'hiddify-app-bin'
    'hiddify-app-git'
    'hiddify-app-appimage'
    'hiddify-desktop'
    'hiddify-desktop-git'
)

source=(
    "${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Hiddify-Debian-x64.deb"
    "${pkgname}.install"
)
sha256sums=('2cd4b830a3db146a123fb3a69b02e7d6e6f5399c2b12236a5e3a639ba6b61492'
            'e7b5e75683e0a50b98471c8acb6ed5fc641428475aba9e3c2a80ec54f11b196d')

# Install prefix.
#
# Deliberately /usr/lib/$_pkgname rather than /opt/$_pkgname:
#   * namcap's ELF-path check accepts /usr/lib but (incorrectly) rejects
#     every file under /opt/<pkg>/<subdir>/. Every Flutter or Electron
#     payload triggers that false positive, and it cannot be silenced
#     without teaching namcap about the path.
#   * /usr/lib/<name>/ is what Firefox, Chromium, and most AUR Electron
#     packages use; it is FHS-compliant and keeps the whole app tree
#     self-contained, so relative lookups (./lib/, ./data/) still work.
_install_path="/usr/lib/${_pkgname}"

prepare() {
    cd "${srcdir}"

    # The .deb payload is a nested tarball whose compression can change
    # between upstream releases (currently zst; xz/gz/bz2 are possible).
    local inner
    for inner in data.tar.zst data.tar.xz data.tar.gz data.tar.bz2 data.tar; do
        [[ -f $inner ]] && break
    done
    if [[ -z $inner || ! -f $inner ]]; then
        echo "error: no data.tar.* found inside the .deb" >&2
        return 1
    fi
    bsdtar -xf "$inner"
    rm -f -- "$inner"

    # Normalize the .desktop entry:
    #  - drop the informational Version= field (pacman warns about it)
    #  - pin StartupWMClass so the window manager associates the window
    #    with the desktop entry
    #  - force Exec=hiddify so PATH lookup is used (upstream may ship a
    #    hardcoded path that does not exist in Arch)
    local dt="${srcdir}/usr/share/applications/hiddify.desktop"
    if [[ -f $dt ]]; then
        sed -i '/^Version=/d' "$dt"
        grep -q '^StartupWMClass=' "$dt" \
            || sed -i '/^\[Desktop Entry\]/a StartupWMClass=app.hiddify.com' "$dt"
        sed -i -E 's|^Exec=[^ ]+|Exec=hiddify|' "$dt"
    fi
}

package() {
    cd "${srcdir}"

    # Locate the launcher. Upstream layout has varied:
    #   <= 4.x : usr/share/hiddify/hiddify
    #   >= 5.x : opt/hiddify/hiddify
    # Finding the executable is more robust than hardcoding either path,
    # and keeps this PKGBUILD building across future reorgs.
    local hiddify_bin
    hiddify_bin=$(find . -maxdepth 5 -type f -name 'hiddify' -perm -u+x | head -n1)
    if [[ -z $hiddify_bin ]]; then
        echo "error: cannot locate the hiddify executable in the extracted .deb" >&2
        find . -maxdepth 3 -type d | sort >&2
        return 1
    fi
    local app_src; app_src=$(dirname "$hiddify_bin")
    echo "==> Found app at: $app_src"

    # Install the application tree at the canonical /usr/lib location.
    install -dm755 "${pkgdir}${_install_path}"
    cp -a "${app_src}/." "${pkgdir}${_install_path}/"
    chmod -R u=rwX,go=rX "${pkgdir}${_install_path}"

    # Strip GitHub Actions RUNPATHs. The Flutter plugins were linked on CI
    # with a RUNPATH pointing at /home/runner/work/..., which does not
    # exist on end-user systems and is a security hazard (dlopen could
    # silently load a library from there on a compromised machine).
    #
    # We only touch files that actually carry the offending string, so the
    # operation is a no-op on anything already clean. The binaries HiddifyCli
    # and hiddify, plus every plugin .so, go through the same loop.
    local f
    while IFS= read -r f; do
        if patchelf --print-rpath "$f" 2>/dev/null | grep -q '/home/runner/'; then
            echo "==> Clearing insecure RUNPATH in: ${f##*/}"
            patchelf --remove-rpath "$f"
        fi
    done < <(find "${pkgdir}${_install_path}" -type f)

    # Icons, desktop entry, and AppStream metadata.
    local d
    for d in icons applications metainfo; do
        if [[ -d "usr/share/$d" ]]; then
            install -dm755 "${pkgdir}/usr/share/$d"
            cp -a "usr/share/$d/." "${pkgdir}/usr/share/$d/"
        fi
    done

    # Launcher on PATH.
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/hiddify" "${pkgdir}/usr/bin/hiddify"
}
