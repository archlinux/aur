# Maintainer: AnRan <2318621872 at qq dot com>
#
# Packaged from the official AppImage release; upstream also ships a from-source
# PKGBUILD at packaging/arch/PKGBUILD.
#
# herta-bin repacks the official upstream AppImage. Only the application
# payload (resources/) is installed; the Chromium runtime comes from Arch's
# electron${_electronversion} package instead of the AppImage's bundled copy, which
# keeps the installed size roughly 270 MiB smaller and lets Electron security
# updates arrive through pacman.
#
# The AppImage is fetched from the project's own release page, so no
# game-derived artwork or voice asset is redistributed here -- see the
# exclusion list in the project LICENSE.

pkgname=herta-bin
_appname=${pkgname%-bin}
_electronversion=43
_appdir="/usr/lib/${pkgname}"
pkgver=0.1.6
pkgrel=2
pkgdesc="The self that uses the agent - desktop companion (AppImage payload, system Electron)"
arch=('x86_64')
url="https://github.com/PersonaCLI/Herta"
license=('MIT')
depends=(
    "electron${_electronversion}"
    'libxss'
    'libnotify'
    'libxtst'
    'hicolor-icon-theme'
)
optdepends=(
    'gnome-keyring: keep the stored API key encrypted at rest'
    'xdg-utils: open external links from the application'
)
provides=('herta')
conflicts=('herta')
makedepends=('asar')
# The ASAR is not strip-safe and the bundled TTS addon must keep its symbols.
options=('!strip' '!debug')
source=(
    "Herta-x86_64.AppImage::https://github.com/PersonaCLI/Herta/releases/download/v${pkgver}/Herta-x86_64.AppImage"
    "${_appname}.sh"
    "herta.desktop"
)
sha256sums=('58488abb85e8a53583779c77edfc06c80ee5dbfc7f742d47a5c6ca7cc40554e1'
            'SKIP'
            'SKIP')

prepare() {
    cd "${srcdir}"
    # makepkg does not keep the executable bit on downloaded sources.
    chmod +x Herta-x86_64.AppImage
    # The AppImage type-2 runtime unpacks itself without FUSE.
    ./Herta-x86_64.AppImage --appimage-extract >/dev/null

    # The app resolves its payload through process.resourcesPath, which under a
    # system Electron points at /usr/lib/electron${_electronversion}/resources.
    # Repoint every occurrence at the directory this package installs.
    asar extract squashfs-root/resources/app.asar app.asar.tree
    rm -f squashfs-root/resources/app.asar
    while read -r _file; do
        sed -i "s|process\.resourcesPath|'${_appdir}/resources'|g" "${_file}"
    done < <(grep -rlI 'process\.resourcesPath' app.asar.tree || true)
    asar pack app.asar.tree squashfs-root/resources/app.asar
    rm -rf app.asar.tree

    sed -i -e "s|@electronversion@|${_electronversion}|g" \
           -e "s|@appdir@|${_appdir}|g" \
           -e "s|@appname@|${_appname}|g" "${srcdir}/${_appname}.sh"
}

package() {
    cd "${srcdir}"

    install -Dm755 "${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"

    install -dm755 "${pkgdir}${_appdir}/resources"
    # --no-preserve=ownership: fakeroot records the files as root anyway, and it
    # keeps packaging independent of the builder's surroundings.
    cp -a --no-preserve=ownership squashfs-root/resources/. "${pkgdir}${_appdir}/resources/"

    install -Dm644 squashfs-root/usr/share/icons/hicolor/1024x1024/apps/herta.png \
        "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/herta.png"

    # Upstream's own desktop entry (packaging/arch/herta.desktop), with Exec
    # pointed at this package's launcher. Keeps the translated name and the
    # search keywords that a hand-rolled entry would drop.
    install -Dm644 herta.desktop "${pkgdir}/usr/share/applications/${_appname}.desktop"

    install -Dm644 squashfs-root/resources/LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 squashfs-root/resources/THIRD-PARTY-NOTICES.md \
        "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES.md"
}
