# Maintainer: AxisForge <hello@axisforge.app>
#
# axisforge-bin — Linux HOTAS / joystick remapper with action graphs,
# response curves, trim, voice-pack folder import, and an AI setup assistant.
#
# This is the binary distribution of AxisForge (a commercial product).
# Source is not published; the package extracts and installs the official
# AppImage build from GitHub Releases.
#
# To bump: change pkgver, paste the new sha256 of the AppImage tarball,
# regenerate .SRCINFO with `makepkg --printsrcinfo > .SRCINFO`.

pkgname=axisforge-bin
_pkgname=axisforge
pkgver=1.0.4
pkgrel=2
pkgdesc="Linux HOTAS / joystick remapper with action graphs, trim, and an AI setup assistant"
arch=('x86_64')
url="https://axisforge.app"
license=('LicenseRef-Proprietary')
depends=(
    'webkit2gtk-4.1'    # Tauri runtime
    'gtk3'
    'alsa-lib'           # audio output for play_audio
    'libayatana-appindicator'
)
optdepends=(
    'pipewire-alsa: ALSA-bridged audio under PipeWire (recommended)'
    'xdg-utils: opens profiles/logs folders from the GUI menus'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')     # binaries are already stripped + RELR-relocated
install="${_pkgname}.install"
source=(
    "${_pkgname}-${pkgver}.AppImage::https://github.com/silentcid/axisforge-releases/releases/download/v${pkgver}/AxisForge-${pkgver}-x86_64.AppImage"
    "${_pkgname}.desktop"
    "99-${_pkgname}.rules"
)
# Replace placeholder hashes with the actual sha256 of the upstream files.
# After editing pkgver, run:
#   updpkgsums
sha256sums=(
    'd90a9a2568530f1c6746745228e5d332e9a16b9d7c51552702e51bd64074caed'   # AxisForge-1.0.4-x86_64.AppImage (modern build)
    '7b8d44f8021b81c470e80799fe73e04feba8a90e330ed53034116c07a4bc1116'   # axisforge.desktop
    '04a92c0cc0eb37ae82a466cf55a6d93d11a1b7002b51b9e4060bb6e9a18cde27'   # 99-axisforge.rules
)
noextract=("${_pkgname}-${pkgver}.AppImage")

prepare() {
    cd "${srcdir}"
    chmod +x "${_pkgname}-${pkgver}.AppImage"
    # AppImages are self-mounting squashfs files. --appimage-extract dumps
    # the AppDir contents into ./squashfs-root/ which we then cherry-pick.
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract >/dev/null
}

package() {
    cd "${srcdir}/squashfs-root"

    # Binaries — both the GUI and the standalone CLI shipped inside the AppImage.
    install -Dm755 usr/bin/axisforge-gui "${pkgdir}/usr/bin/axisforge-gui"
    install -Dm755 usr/bin/axisforge     "${pkgdir}/usr/bin/axisforge"

    # App-private payloads only. The AppDir's usr/lib and usr/share also
    # carry the AppImage's whole bundled dependency closure (GTK, glib,
    # gstreamer, …) staged for portable execution — installing those
    # wholesale claims files owned by system packages and pacman aborts
    # with "conflicting files". System libraries come from depends=();
    # ship nothing but AxisForge's own files.
    for d in usr/lib/"${_pkgname}"* usr/share/"${_pkgname}"*; do
        [ -e "${d}" ] || continue
        mkdir -p "${pkgdir}/${d%/*}"
        cp -a "${d}" "${pkgdir}/${d%/*}/"
    done

    # XDG metadata — replace whatever Tauri produced with our curated entries
    # so the menu listing, icon ref, and StartupWMClass are canonical.
    install -Dm644 "${srcdir}/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon — pick the largest one Tauri put in the AppDir; fall back to 128.
    for size in 256 128 64; do
        icon_src="usr/share/icons/hicolor/${size}x${size}/apps/axisforge-gui.png"
        if [ -f "${icon_src}" ]; then
            install -Dm644 "${icon_src}" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
            break
        fi
    done

    # udev rules — grants the user access to joystick evdev nodes without
    # `sudo chmod` dances. Required for AxisForge to grab physical sticks.
    install -Dm644 "${srcdir}/99-${_pkgname}.rules" \
        "${pkgdir}/usr/lib/udev/rules.d/99-${_pkgname}.rules"
}
