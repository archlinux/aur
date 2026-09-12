# Maintainer: GG2R10 <herc2435 at gmail dot com>
pkgname=micdroid-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="Use an Android phone's microphone as a PC microphone (system tray app) - scrcpy/adb routed into a PipeWire virtual mic"
arch=('any')
url="https://github.com/GG2R10/micdroid-scrcpy"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'pyside6'
    'python-dbus-next'
    'python-zeroconf'
    'scrcpy'
    'android-tools'
    'libpulse'
    'pipewire-audio'
)
optdepends=(
    'avahi: mDNS fallback when a paired device changes wireless-debugging port'
    'libnotify: desktop notifications on connect/disconnect/mute'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'imagemagick'
)
provides=("micdroid=${pkgver}")
conflicts=('micdroid')
# NOTE: this PKGBUILD makes real assumptions about micdroid-scrcpy's
# current structure (tray-app/'s pyproject.toml layout, the
# micdroid-daemon/micdroid-tray package boundary, the daemon's systemd
# unit shape) - being a -git package, it always builds off upstream's
# latest master with no version pin to catch drift. If the install/setup
# story for either the daemon or the tray app ever changes upstream,
# double check this PKGBUILD still builds. See upstream's PACKAGING.md
# for the full detail.
install=micdroid.install
source=(
    "$pkgname::git+$url.git"
    "micdroid-tray.desktop"
)
sha256sums=(
    'SKIP'
    '3c0d218ac4a6d7e3f20c1a075645b227b5f211466e084e98f58b8d41fdd9ed78'
)

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    # Two independent wheels, not one combined package: micdroid_daemon and
    # micdroid_tray are already separate Python packages upstream (see
    # tray-app/README.md - the daemon has no Plasma or Qt dependency at
    # all, the tray app is just one of its clients), each with its own
    # pyproject.toml. Building/installing them separately here mirrors
    # that boundary instead of blurring it.
    cd "$srcdir/$pkgname/tray-app"
    python -m build --wheel --no-isolation

    cd "$srcdir/$pkgname/package/contents/daemon"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"

    python -m installer --destdir="$pkgdir" tray-app/dist/*.whl
    python -m installer --destdir="$pkgdir" package/contents/daemon/dist/*.whl

    # Derived from upstream's own unit (package/contents/daemon/systemd/
    # micdroid.service) via a single sed substitution, rather than hand-
    # maintaining a full duplicate here - only the ExecStart line actually
    # needs to differ (this package's `depends=` guarantees the daemon's
    # dependencies are system-installed already, so it runs the system
    # Python directly instead of upstream's private per-user venv, which
    # exists only for the checkout/KDE-Store install path). Any other
    # future change to the unit (Restart behaviour, a new Environment=
    # line, etc.) flows through here automatically instead of silently
    # drifting between two independently hand-copied files.
    install -Dm644 package/contents/daemon/systemd/micdroid.service \
        "$pkgdir/usr/lib/systemd/user/micdroid.service"
    sed -i 's|^ExecStart=.*|ExecStart=/usr/bin/python3 -m micdroid_daemon|' \
        "$pkgdir/usr/lib/systemd/user/micdroid.service"

    install -Dm644 "$srcdir/micdroid-tray.desktop" \
        "$pkgdir/usr/share/applications/micdroid-tray.desktop"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Single 512x512 master, resized down per hicolor convention - same
    # approach as ucs-git's own packaging, for the same reason (one source
    # image to keep in sync instead of one file per size).
    for size in 16 22 24 32 48 64 128 256 512; do
        install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        magick assets/micdroid_icon_512.png -resize "${size}x${size}" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/micdroid-tray.png"
    done
}
