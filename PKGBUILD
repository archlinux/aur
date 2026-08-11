# Maintainer: loteran <https://github.com/loteran>
pkgname=arctis-sound-manager
pkgver=1.2.27
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
    # D-Bus service backend (dbus_service.py) — in official Arch repos (extra/).
    'python-dbus-next'
    # PulseAudio/PipeWire control bindings — not in official Arch repos, but
    # available in the AUR (same situation as noise-suppression-for-voice
    # below: pacman prompts paru/yay to build it as part of the transaction).
    'python-pulsectl'
    # Used by asm-setup to download HRIR (~/.local/share/pipewire/
    # hrir_hesuvi/EAC_Default.wav) on first run — Spatial Audio is
    # silent without it. asm-setup falls back to wget but a default
    # Arch base install ships curl, not wget.
    'curl'
    # LADSPA Steve Harris pack — provides plate_1423 used by the HeSuVi
    # 7.1 surround filter-chain (issue #23). In the official 'extra' repo,
    # so pacman satisfies it directly.
    'swh-plugins'
)
optdepends=(
    # rnnoise LADSPA plugin for the ClearCast / mic noise-suppression toggle.
    # AUR-only, so it CANNOT be a hard depend: pacman can't satisfy it from the
    # official repos, and `pacman -S arctis-sound-manager` from the signed repo
    # would abort on an unresolvable dependency (#175, and the #96 rule that this
    # must never be a Depends). It stays optional — the mic noise-cancel toggle
    # degrades gracefully when it's missing (and DeepFilterNet is an alternative
    # engine). The signed pacman repo ships a build of it, so it's one
    # `pacman -S noise-suppression-for-voice` away; on the AUR, paru offers it.
    'noise-suppression-for-voice: RNNoise mic noise cancellation (ClearCast)'
)
makedepends=('python-installer' 'uv')
install=arctis-sound-manager.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/loteran/Arctis-Sound-Manager/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('12e8b3b648aad6b188685f7ba894dc3af91c1c663fa8ee79f3598f83d6974936')

build() {
    cd "Arctis-Sound-Manager-$pkgver"

    # Never let uv download or select a Python interpreter other than the
    # system one — the produced wheel is pure-Python (py3-none-any) so the
    # interpreter used to build it doesn't matter for content, but a
    # mismatched interpreter here can still lead uv to create a venv keyed
    # to a different Python version than what's actually installed.
    export UV_PYTHON_DOWNLOADS=never
    export UV_SYSTEM_PYTHON=1
    uv build --wheel --python /usr/bin/python
}

package() {
    cd "Arctis-Sound-Manager-$pkgver"

    # Install Python package
    python -m installer --destdir="$pkgdir" dist/*.whl

    # udev rules (generated from device YAMLs — never hardcode PIDs here).
    # Run with the system python3 directly (no uv/venv involved): the script
    # only needs the stdlib plus the local arctis_sound_manager.udev_rules
    # module and inserts src/ onto sys.path itself when run from the repo.
    python3 scripts/generate_udev_rules.py \
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
    install -Dm644 systemd/arctis-stream-guard.service \
        "$pkgdir/usr/lib/systemd/user/arctis-stream-guard.service"
    install -Dm644 systemd/arctis-gui.service \
        "$pkgdir/usr/lib/systemd/user/arctis-gui.service"

    # dinit user service templates (Artix Linux / dinit init systems)
    install -Dm644 dinit/arctis-manager \
        "$pkgdir/usr/share/$pkgname/dinit/arctis-manager"
    install -Dm644 dinit/arctis-video-router \
        "$pkgdir/usr/share/$pkgname/dinit/arctis-video-router"
    install -Dm644 dinit/arctis-stream-guard \
        "$pkgdir/usr/share/$pkgname/dinit/arctis-stream-guard"
    install -Dm644 dinit/arctis-gui \
        "$pkgdir/usr/share/$pkgname/dinit/arctis-gui"
    install -Dm644 dinit/pipewire-filter-chain \
        "$pkgdir/usr/share/$pkgname/dinit/pipewire-filter-chain"

    # dinit diagnostic script
    install -Dm755 scripts/asm-diag-dinit.py \
        "$pkgdir/usr/bin/asm-diag-dinit"

    # Post-upgrade helper: restarts the user services so the new code is the
    # code that runs. Not in /usr/bin — it is packaging machinery, not a
    # command users are meant to invoke.
    install -Dm755 scripts/restart-user-services.sh \
        "$pkgdir/usr/lib/$pkgname/restart-user-services.sh"

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

    # AppStream metainfo (releases injected from CHANGELOG.md — never hardcode).
    # Stdlib-only script, no uv/venv needed.
    python3 scripts/generate_metainfo_releases.py --in-place
    install -Dm644 src/arctis_sound_manager/desktop/com.github.loteran.arctis-sound-manager.metainfo.xml \
        "$pkgdir/usr/share/metainfo/com.github.loteran.arctis-sound-manager.metainfo.xml"

    # AppStream catalog entry. The metainfo above describes the app; only this
    # ties it to a package name, which is what a software centre needs to show
    # it at all. Arch's archlinux-appstream-data covers the official repos only,
    # so a package from anywhere else is invisible in Discover without it.
    python3 scripts/generate_appstream_catalog.py \
        --output "$pkgdir/usr/share/swcatalog/xml/$pkgname.xml.gz"
    chmod 644 "$pkgdir/usr/share/swcatalog/xml/$pkgname.xml.gz"

    # First-run autostart (triggers asm-setup on first graphical login)
    install -Dm644 debian/asm-first-run.desktop \
        "$pkgdir/etc/xdg/autostart/asm-first-run.desktop"
}
