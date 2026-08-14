# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=deepseek-reasonix-desktop-bin
pkgver=1.25.1
pkgrel=1
# Reasonix Desktop is a Wails shell around WebKitGTK, not an Electron app —
# upstream's own control file says so ("a Wails shell around the Go kernel")
# and the binary links libwebkit2gtk-4.1 / libjavascriptcoregtk-4.1.
pkgdesc="Reasonix Desktop - Wails/WebKitGTK desktop client for DeepSeek-Reasonix"
arch=('x86_64')
url="https://github.com/esengine/DeepSeek-Reasonix"
license=('MIT')
# The direct DT_NEEDED set of reasonix-desktop, nothing more. The list this
# replaces was written for an Electron app: it omitted webkit2gtk-4.1 (so the
# package installed fine and then failed to start on hosts without it) while
# carrying nss, nspr, libcups and alsa-lib, which the binary never links.
# at-spi2-core / mesa / libx* are real but arrive transitively via gtk3.
depends=(
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'webkit2gtk-4.1'
    # The app is a shell around the reasonix kernel and needs it at runtime.
    # Upstream installs the CLI next to the desktop binary, but that path is
    # owned by deepseek-reasonix-tui-bin (which also declares
    # conflicts=('reasonix')), so it can't be shipped from here — see
    # package(). Depending on the virtual name instead resolves against either
    # deepseek-reasonix-tui-bin or deepseek-reasonix-tui, both of which
    # provide it.
    'reasonix'
)
provides=('deepseek-reasonix-desktop' 'reasonix-desktop')
conflicts=('deepseek-reasonix-desktop' 'reasonix-desktop')
options=('!strip' '!debug')

_relurl="https://github.com/esengine/DeepSeek-Reasonix/releases/download/desktop-v${pkgver}"

# Sourced from the .deb rather than Reasonix-linux-amd64.tar.gz: it carries
# byte-identical reasonix-desktop / reasonix-launcher binaries (verified with
# cmp against the tarball) plus upstream's desktop entry and pre-rendered icons
# at 8 sizes and a scalable SVG. That is one 44 MB download instead of two, and
# it drops the imagemagick resize step the old appicon.png handling needed.
source=("${pkgname}-${pkgver}.deb::${_relurl}/Reasonix-linux-amd64.deb")
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=('faa962d5d60517ed6ce3494d24ff1d6f4126cab396adbb2a24c4075924a9bfd1')

prepare() {
    # .deb is an ar archive of {debian-binary, control.tar.*, data.tar.*};
    # bsdtar (libarchive, always present) unpacks both layers.
    rm -rf "${srcdir}/debroot"
    mkdir -p "${srcdir}/debroot"
    bsdtar -xOf "${srcdir}/${pkgname}-${pkgver}.deb" data.tar.gz \
        | bsdtar -xf - -C "${srcdir}/debroot"
}

package() {
    cd "${srcdir}/debroot"

    # Both binaries are needed. reasonix-launcher is what upstream's .desktop
    # actually executes: it resolves the app through a versioned current.json
    # layout, so starting reasonix-desktop directly bypasses upstream's startup
    # path. The previous revision installed only reasonix-desktop.
    install -Dm755 usr/bin/reasonix-desktop "${pkgdir}/usr/bin/reasonix-desktop"
    install -Dm755 usr/bin/reasonix-launcher "${pkgdir}/usr/bin/reasonix-launcher"

    # Deliberately not installed:
    #   usr/bin/reasonix — the CLI kernel; deepseek-reasonix-tui-bin owns that
    #     path, so shipping it here would put the two packages in file
    #     conflict. It is pulled in through depends=('reasonix') instead.
    #   usr/lib/reasonix/reasonix-update-helper + its polkit policy — they let
    #     the app install a .deb over itself through pkexec, which is wrong on
    #     Arch; upgrades go through pacman.
    # The tarball additionally ships reasonix-guard, which this package must not
    # install either: as a sibling of the launcher it sends it down a legacy
    # migration path that always fails ("migrate: flat CLI binary reasonix-cli
    # is required" — no release asset ships a reasonix-cli). The .deb omits it,
    # which is why sourcing from the .deb avoids the problem by construction.

    install -Dm644 usr/share/applications/reasonix.desktop \
        "${pkgdir}/usr/share/applications/reasonix.desktop"

    # Upstream sets StartupWMClass=reasonix-desktop, but the app_id the window
    # reports on Wayland is "Reasonix"; leaving upstream's value means the
    # compositor can't match the window to this entry and shows no icon.
    sed -i 's/^StartupWMClass=.*/StartupWMClass=Reasonix/' \
        "${pkgdir}/usr/share/applications/reasonix.desktop"
    grep -q '^StartupWMClass=Reasonix$' \
        "${pkgdir}/usr/share/applications/reasonix.desktop" || {
        printf 'ERROR: failed to rewrite StartupWMClass in reasonix.desktop\n' >&2
        return 1
    }

    # Upstream's pre-rendered icons, 16x16 through 512x512 plus scalable.
    local _icon _dir
    for _icon in usr/share/icons/hicolor/*/apps/reasonix-desktop.*; do
        _dir="$(basename "$(dirname "$(dirname "${_icon}")")")"
        install -Dm644 "${_icon}" \
            "${pkgdir}/usr/share/icons/hicolor/${_dir}/apps/$(basename "${_icon}")"
    done

    install -Dm644 usr/share/pixmaps/reasonix-desktop.png \
        "${pkgdir}/usr/share/pixmaps/reasonix-desktop.png"
}
