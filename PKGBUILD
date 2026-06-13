# Maintainer: loteran <https://github.com/loteran>
pkgname=arctis-sound-manager
pkgver=1.1.72
pkgrel=1
pkgdesc="Linux GUI for SteelSeries Arctis headsets — all GG/Sonar features: mixer, EQ, ANC, mic processing, surround"
arch=('any')
url="https://github.com/loteran/Arctis-Sound-Manager"
license=('GPL-3.0-or-later')
depends=(
    'python>=3.10'
    'pyside6'
    'qt6-svg'
    'python-babel'
    'python-pillow'
    'python-pyudev'
    'python-pyusb'
    'python-ruamel-yaml'
    'pipewire'
    'pipewire-pulse'
    'wireplumber'
    'libusb'
    'libpulse'
    # Used by asm-setup to download HRIR (~/.local/share/pipewire/
    # hrir_hesuvi/EAC_Default.wav) on first run — Spatial Audio is
    # silent without it. asm-setup falls back to wget but a default
    # Arch base install ships curl, not wget.
    'curl'
    # LADSPA Steve Harris pack — provides plate_1423 used by the HeSuVi
    # 7.1 surround filter-chain (issue #23). Promoted from optdepends
    # to depends per the "no soft deps" mandate.
    'swh-plugins'
    # rnnoise LADSPA plugin used by the ClearCast / mic noise-suppression
    # toggle in the Settings page. Lives in the AUR — pacman will refuse
    # to satisfy this from the official repos, so users installing the
    # AUR PKGBUILD via paru/yay will be prompted to build it as part of
    # the same transaction. This is intentional — the alternative
    # (optdepends) means the toggle silently does nothing.
    'noise-suppression-for-voice'
)
makedepends=('python-installer' 'uv')
install=arctis-sound-manager.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/loteran/Arctis-Sound-Manager/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8ff35eab2e1068fc8b9b60d90b01947a0b402dcba2ae6f8214ad75616c11b769')

build() {
    cd "Arctis-Sound-Manager-$pkgver"
    uv build --wheel
}

package() {
    cd "Arctis-Sound-Manager-$pkgver"

    # Install Python package
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Bundle dbus-next and pulsectl (not in official Arch repos)
    uv pip install --no-deps --python /usr/bin/python --prefix "$pkgdir/usr" dbus-next pulsectl

    # udev rules (generated from device YAMLs — never hardcode PIDs here)
    uv run python3 scripts/generate_udev_rules.py \
        | install -Dm644 /dev/stdin "$pkgdir/usr/lib/udev/rules.d/91-steelseries-arctis.rules"

    # Desktop entry
    install -Dm644 src/arctis_sound_manager/desktop/ArctisManager.desktop \
        "$pkgdir/usr/share/applications/ArctisManager.desktop"

    # Icon
    install -Dm644 src/arctis_sound_manager/gui/images/steelseries_logo.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/arctis-manager.svg"

    # Systemd user services (single source of truth in systemd/, not heredocs)
    install -Dm644 systemd/arctis-manager.service \
        "$pkgdir/usr/lib/systemd/user/arctis-manager.service"
    install -Dm644 systemd/arctis-video-router.service \
        "$pkgdir/usr/lib/systemd/user/arctis-video-router.service"
    install -Dm644 systemd/arctis-gui.service \
        "$pkgdir/usr/lib/systemd/user/arctis-gui.service"

    # dinit user service templates (Artix Linux / dinit init systems)
    install -Dm644 dinit/arctis-manager \
        "$pkgdir/usr/share/$pkgname/dinit/arctis-manager"
    install -Dm644 dinit/arctis-video-router \
        "$pkgdir/usr/share/$pkgname/dinit/arctis-video-router"
    install -Dm644 dinit/arctis-gui \
        "$pkgdir/usr/share/$pkgname/dinit/arctis-gui"
    install -Dm644 dinit/pipewire-filter-chain \
        "$pkgdir/usr/share/$pkgname/dinit/pipewire-filter-chain"

    # dinit diagnostic script
    install -Dm755 scripts/asm-diag-dinit.py \
        "$pkgdir/usr/bin/asm-diag-dinit"

    # PipeWire configs (shared, copied to user dir on first run by asm-setup)
    install -Dm644 scripts/pipewire/10-arctis-virtual-sinks.conf \
        "$pkgdir/usr/share/$pkgname/pipewire/10-arctis-virtual-sinks.conf"
    install -Dm644 scripts/pipewire/sink-virtual-surround-7.1-hesuvi.conf \
        "$pkgdir/usr/share/$pkgname/pipewire/sink-virtual-surround-7.1-hesuvi.conf"

    # filter-chain.service (for distros that don't ship one; Arch ships it via pipewire-audio)
    install -Dm644 scripts/filter-chain.service \
        "$pkgdir/usr/share/$pkgname/filter-chain.service"

    # Device configs
    install -Dm644 src/arctis_sound_manager/devices/*.yaml \
        -t "$pkgdir/usr/share/$pkgname/devices/"

    # AppStream metainfo (releases injected from CHANGELOG.md — never hardcode)
    uv run python3 scripts/generate_metainfo_releases.py --in-place
    install -Dm644 src/arctis_sound_manager/desktop/com.github.loteran.arctis-sound-manager.metainfo.xml \
        "$pkgdir/usr/share/metainfo/com.github.loteran.arctis-sound-manager.metainfo.xml"

    # First-run autostart (triggers asm-setup on first graphical login)
    install -Dm644 debian/asm-first-run.desktop \
        "$pkgdir/etc/xdg/autostart/asm-first-run.desktop"
}
