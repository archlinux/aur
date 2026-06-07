# Maintainer: tioguda  <guda.flavio@gmail.com>
# Contributor: Bruno Goncalves <bigbruno@gmail.com>

pkgbase=biglinux-noise-reduction-pipewire
pkgname=${pkgbase}
pkgver=r257.c64018b
pkgrel=2
arch=('x86_64')
license=('GPL-3.0-or-later')
url="https://github.com/biglinux/biglinux-noise-reduction-pipewire"
pkgdesc="AI-powered microphone noise reduction with GTK4/libadwaita interface for PipeWire"
makedepends=(
    'gtk4>=4.20'
    'libadwaita>=1.8'
    'libpipewire'
    'rust'
    'cargo'
    'gettext'
    'pkgconf'
    'clang'
    'git'
)
provides=('biglinux-microphone')
conflicts=('biglinux-microphone')
replaces=('biglinux-microphone')
install="${pkgbase}.install"
source=("${pkgbase}::git+https://github.com/biglinux/biglinux-noise-reduction-pipewire.git")
sha512sums=(SKIP)

pkgver() {
    cd ${srcdir}/${pkgbase}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgbase}"
    cargo build --release --locked

    # Compile translations (.po → .mo). The .mo basename MUST match the
    # textdomain bound by the Rust binary (`biglinux-microphone`,
    # defined in src/config/paths.rs::GETTEXT_PACKAGE) — gettext looks
    # up `<locale>/LC_MESSAGES/<textdomain>.mo`. Naming after $pkgname
    # would silently install unreachable catalogs.
    _textdomain='biglinux-microphone'
    install -d "${srcdir}/${pkgbase}/build-locale"
    for po in po/*.po; do
        [ -f "$po" ] || continue
        lang=$(basename "$po" .po)
        install -d "build-locale/${lang}/LC_MESSAGES"
        msgfmt "$po" -o "build-locale/${lang}/LC_MESSAGES/${_textdomain}.mo"
    done
}

check() {
    cd "${srcdir}/${pkgbase}"
    cargo test --release --locked
}

package() {
    depends=(
        'pipewire>=1.4'
        'wireplumber>=0.5'
        'gtcrn-ladspa'
        'swh-plugins'
        'gtk4>=4.20'
        'libadwaita>=1.8'
        'libpipewire'
        'glib2'
        'cairo'
        'glibc'
        'gcc-libs'
    )
    optdepends=(
        'inotify-tools: instant Plasma applet sync with the GTK config window'
        'deepfilternet-ladspa: full-band 48 kHz DeepFilterNet3 denoiser (UI exposes it when installed)'
        'plasma-workspace: Plasma 6 system tray applet'
        'qt6-declarative: QML runtime for the Plasma 6 system tray applet'
        'kirigami: Plasma 6 system tray applet styling'
        'libplasma: Plasma 6 system tray applet host'
        'plasma5support: Plasma 6 system tray applet legacy support module'
    )

    cd "${srcdir}/${pkgbase}"

    # Binaries
    install -Dm755 target/release/biglinux-microphone \
        "${pkgdir}/usr/bin/biglinux-microphone"
    install -Dm755 target/release/biglinux-microphone-cli \
        "${pkgdir}/usr/bin/biglinux-microphone-cli"

    # Desktop / metainfo / icons
    install -Dm644 usr/share/applications/br.com.biglinux.microphone.desktop \
        "${pkgdir}/usr/share/applications/br.com.biglinux.microphone.desktop"
    install -Dm644 usr/share/metainfo/br.com.biglinux.microphone.metainfo.xml \
        "${pkgdir}/usr/share/metainfo/br.com.biglinux.microphone.metainfo.xml"

    # systemd user units
    install -Dm644 usr/lib/systemd/user/biglinux-microphone.service \
        "${pkgdir}/usr/lib/systemd/user/biglinux-microphone.service"
    install -Dm644 usr/lib/systemd/user/biglinux-microphone-output.service \
        "${pkgdir}/usr/lib/systemd/user/biglinux-microphone-output.service"

    # systemd drop-in lifting the RT/MEMLOCK budget on the upstream
    # filter-chain.service so module-rt can actually grant rt.prio=88
    # to the data-loop hosting the GTCRN/DFN3 LADSPA node.
    install -Dm644 usr/lib/systemd/user/filter-chain.service.d/10-biglinux-rt.conf \
        "${pkgdir}/usr/lib/systemd/user/filter-chain.service.d/10-biglinux-rt.conf"

    # PipeWire filter-chain priority drop-in: pairs with the systemd
    # rlimits above to override module-rt args (nice=-11 / rt.prio=88)
    # so our denoiser runs at the same scheduling tier as the main
    # PipeWire data loop.
    install -Dm644 usr/share/pipewire/filter-chain.conf.d/50-biglinux-priority.conf \
        "${pkgdir}/usr/share/pipewire/filter-chain.conf.d/50-biglinux-priority.conf"

    # WirePlumber policy hook: keeps the echo-cancel capture stream on
    # the selected physical microphone while devices/defaults change.
    install -Dm644 usr/share/wireplumber/scripts/biglinux/echo-cancel-routing.lua \
        "${pkgdir}/usr/share/wireplumber/scripts/biglinux/echo-cancel-routing.lua"
    install -Dm644 usr/share/wireplumber/wireplumber.conf.d/60-biglinux-echo-cancel-routing.conf \
        "${pkgdir}/usr/share/wireplumber/wireplumber.conf.d/60-biglinux-echo-cancel-routing.conf"

    # Broad ALSA headroom rule (api.alsa.headroom = 1024 frames,
    # ~21 ms at 48 kHz) on USB / PCI-HDA / Bluetooth devices. Absorbs
    # the cross-process scheduling jitter the standalone output
    # filter daemon adds on top of native USB SOF jitter, without
    # forcing a global quantum/rate (which broke other machines).
    install -Dm644 usr/share/wireplumber/wireplumber.conf.d/61-biglinux-alsa-headroom.conf \
        "${pkgdir}/usr/share/wireplumber/wireplumber.conf.d/61-biglinux-alsa-headroom.conf"

    # Pacman hook + helper (BigLinux bluetooth autoswitch)
    install -Dm644 usr/share/libalpm/hooks/pipewire-filter-bluetooth.hook \
        "${pkgdir}/usr/share/libalpm/hooks/pipewire-filter-bluetooth.hook"
    install -Dm755 usr/share/libalpm/scripts/pipewire-filter-bluetooth \
        "${pkgdir}/usr/share/libalpm/scripts/pipewire-filter-bluetooth"

    # App icon (must match the .desktop Icon= and AppStream <id>)
    install -Dm644 usr/share/icons/hicolor/scalable/apps/br.com.biglinux.microphone.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/br.com.biglinux.microphone.svg"
    # Status icons used by the Plasma applet for tray feedback
    install -Dm644 usr/share/icons/hicolor/scalable/status/big-noise-reduction-on.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/status/big-noise-reduction-on.svg"
    install -Dm644 usr/share/icons/hicolor/scalable/status/big-noise-reduction-off.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/status/big-noise-reduction-off.svg"

    # Plasma 6 system-tray applet
    install -Dm644 usr/share/plasma/plasmoids/org.biglinux.micnoise/metadata.json \
        "${pkgdir}/usr/share/plasma/plasmoids/org.biglinux.micnoise/metadata.json"
    install -Dm644 usr/share/plasma/plasmoids/org.biglinux.micnoise/contents/ui/main.qml \
        "${pkgdir}/usr/share/plasma/plasmoids/org.biglinux.micnoise/contents/ui/main.qml"

    # SVG illustrations rendered inside the GTK didactic cards
    install -d "${pkgdir}/usr/share/biglinux-microphone/illustrations"
    install -m644 usr/share/biglinux-microphone/illustrations/*.svg \
        "${pkgdir}/usr/share/biglinux-microphone/illustrations/"

    # Translations
    for mo in build-locale/*/LC_MESSAGES/*.mo; do
        install -Dm644 "$mo" "${pkgdir}/usr/share/${mo#build-}"
    done

    # License + docs
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
}

