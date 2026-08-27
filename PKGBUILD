# Maintainer: Ron <thefangeddeity>
pkgname=hls-livecam-server
pkgver=6.0.3
pkgrel=1
pkgdesc="Stream a USB webcam via HLS using MediaMTX and ffmpeg, with browser viewer, camdash monitor, and family presence features"
arch=('any')
url="https://github.com/thefangeddeity/hls-livecam-server"
license=('GPL-3.0-or-later')
depends=('ffmpeg' 'nginx' 'python' 'python-psutil' 'python-flask' 'python-pillow' 'python-numpy' 'python-opencv' 'python-pyfakewebcam' 'pyside6' 'v4l2loopback-dkms' 'smartmontools' 'v4l-utils' 'wget' 'ttf-dejavu')
install=hls-livecam-server.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/thefangeddeity/hls-livecam-server/archive/refs/tags/v$pkgver.tar.gz"
        "hls-livecam-server.install")
sha256sums=('0058c35de06090ab960c2f18a73efa73fe2270a4ecc132e4ed6f5a4fcb1afc69'
            'SKIP')

package() {
    cd "$pkgname-$pkgver"

    # ── Executables ──────────────────────────────────────────────────────────
    install -Dm755 pkg/usr/share/hls-livecam-server/hls-livecam-setup-arch \
                   "$pkgdir/usr/local/bin/hls-livecam-setup"
    install -Dm755 pkg/usr/local/bin/camdash          "$pkgdir/usr/local/bin/camdash"
    install -Dm755 pkg/usr/local/bin/camstack         "$pkgdir/usr/local/bin/camstack"
    install -Dm755 pkg/usr/local/bin/hls-livecam-repair "$pkgdir/usr/local/bin/hls-livecam-repair"
    install -Dm755 pkg/usr/local/bin/hls-livecam-dark  "$pkgdir/usr/local/bin/hls-livecam-dark"
    install -Dm755 pkg/usr/local/bin/broadcast-api     "$pkgdir/usr/local/bin/broadcast-api"
    install -Dm755 camdash-gui                         "$pkgdir/usr/local/bin/camdash-gui"

    # ── Operator GUI ─────────────────────────────────────────────────────────
    # gui/ lives at the repo root rather than under pkg/, deliberately: pkg/ is
    # packaged wholesale into the .deb, and PySide6 is not available in Debian
    # bookworm (the pyside6 split packages start at trixie), nor is there a
    # display on the headless Debian node. Arch installs it from here; the deb
    # simply never sees it.
    for f in __init__ app probes tokens video widgets; do
        install -Dm644 "gui/$f.py" "$pkgdir/usr/share/hls-livecam-server/gui/$f.py"
    done
    install -Dm644 gui/assets/icon_1024.png \
                   "$pkgdir/usr/share/hls-livecam-server/gui/assets/icon_1024.png"
    # The desktop entry is registered by hls-livecam-setup, which also prepares
    # the per-user config dir the GUI persists window geometry into; shipping it
    # to share/ keeps setup's copy source in the package.
    install -Dm644 camdash-gui.desktop \
                   "$pkgdir/usr/share/hls-livecam-server/camdash-gui.desktop"

    # ── Shared data ──────────────────────────────────────────────────────────
    install -Dm755 pkg/usr/share/hls-livecam-server/camdash \
                   "$pkgdir/usr/share/hls-livecam-server/camdash"
    install -Dm755 pkg/usr/share/hls-livecam-server/camstack \
                   "$pkgdir/usr/share/hls-livecam-server/camstack"
    install -Dm755 pkg/usr/share/hls-livecam-server/hls-livecam-setup-arch \
                   "$pkgdir/usr/share/hls-livecam-server/hls-livecam-setup"
    install -Dm755 pkg/usr/share/hls-livecam-server/hls-livecam-repair \
                   "$pkgdir/usr/share/hls-livecam-server/hls-livecam-repair"
    install -Dm644 pkg/usr/share/hls-livecam-server/block_art.py \
                   "$pkgdir/usr/share/hls-livecam-server/block_art.py"
    install -Dm644 pkg/usr/share/hls-livecam-server/cv_processor.py \
                   "$pkgdir/usr/share/hls-livecam-server/cv_processor.py"
    install -Dm644 pkg/usr/share/hls-livecam-server/cv_detect.py \
                   "$pkgdir/usr/share/hls-livecam-server/cv_detect.py"
    install -Dm644 pkg/usr/share/hls-livecam-server/cv_notify.py \
                   "$pkgdir/usr/share/hls-livecam-server/cv_notify.py"
    install -Dm644 pkg/usr/share/hls-livecam-server/cv_scene.py \
                   "$pkgdir/usr/share/hls-livecam-server/cv_scene.py"
    # cv_persist and cv_occupancy are imported behind try/except in
    # cv_processor -- absent, they disable themselves and say nothing. That
    # is the right runtime behaviour and exactly why leaving them out of the
    # package was invisible: an Arch install simply had no persistence and
    # no occupancy, with nothing in the log to suggest either had been asked
    # for. Optional at import time, mandatory in the payload.
    install -Dm644 pkg/usr/share/hls-livecam-server/cv_persist.py \
                   "$pkgdir/usr/share/hls-livecam-server/cv_persist.py"
    install -Dm644 pkg/usr/share/hls-livecam-server/cv_occupancy.py \
                   "$pkgdir/usr/share/hls-livecam-server/cv_occupancy.py"
    # The viewer's header asks for /brand.png. Ship the source of it here;
    # hls-livecam-setup and post_upgrade put it in the web root.
    install -Dm644 pkg/usr/share/hls-livecam-server/brand.png \
                   "$pkgdir/usr/share/hls-livecam-server/brand.png"
    install -Dm755 pkg/usr/share/hls-livecam-server/cv_scene_register.py \
                   "$pkgdir/usr/share/hls-livecam-server/cv_scene_register.py"
    install -Dm644 pkg/usr/share/hls-livecam-server/index.html \
                   "$pkgdir/usr/share/hls-livecam-server/index.html"
    # VERSION and PRODUCT are read by broadcast-api at /api/info time. They
    # were never installed here, so an Arch node reported an empty version
    # tag in its header and fell back to the built-in product identity --
    # correct for this fleet by luck, wrong for anyone forking it. Shipping
    # them makes the header true on a fresh install rather than only on a
    # node someone hand-copied them to. A forked node overrides PRODUCT in
    # /etc/hls-livecam/PRODUCT, which no installer touches.
    install -Dm644 pkg/usr/share/hls-livecam-server/VERSION \
                   "$pkgdir/usr/share/hls-livecam-server/VERSION"
    install -Dm644 pkg/usr/share/hls-livecam-server/PRODUCT \
                   "$pkgdir/usr/share/hls-livecam-server/PRODUCT"
    install -Dm644 pkg/usr/share/hls-livecam-server/cams/cams.html \
                   "$pkgdir/usr/share/hls-livecam-server/cams/cams.html"
    install -Dm644 pkg/usr/share/hls-livecam-server/ffmpeg-cam.service \
                   "$pkgdir/usr/share/hls-livecam-server/ffmpeg-cam.service"

    # NOTE: var/www/hls-livecam/index.html is NOT installed here.
    # hls-livecam-setup populates /var/www/hls-livecam/ at configure time,
    # substituting @HOSTNAME@ into share/index.html. Installing a pre-baked
    # file here would overwrite it with the wrong hostname on every upgrade.

    # ── Systemd services ─────────────────────────────────────────────────────
    # Arch convention: vendor units go to /usr/lib/systemd/system/
    install -Dm644 pkg/usr/share/hls-livecam-server/broadcast-api-arch.service \
                   "$pkgdir/usr/lib/systemd/system/broadcast-api.service"
    install -Dm644 pkg/etc/systemd/system/ffmpeg-cam-dark.service \
                   "$pkgdir/usr/lib/systemd/system/ffmpeg-cam-dark.service"
    install -Dm644 pkg/usr/lib/systemd/system/ffmpeg-cam.service \
                   "$pkgdir/usr/lib/systemd/system/ffmpeg-cam.service"

    # ── tmpfiles.d ───────────────────────────────────────────────────────────
    install -Dm644 pkg/usr/lib/tmpfiles.d/hls-livecam.conf \
                   "$pkgdir/usr/lib/tmpfiles.d/hls-livecam.conf"

    # ── nginx ────────────────────────────────────────────────────────────────
    install -Dm644 pkg/etc/nginx/conf.d/hls-livecam.conf                    "$pkgdir/etc/nginx/conf.d/hls-livecam.conf"

    # ── Sudoers ───────────────────────────────────────────────────────────────
    # All sudoers.d entries (hls-livecam-dark, hls-livecam-services, camdash-smart)
    # are written dynamically by hls-livecam-setup at configure time — setup owns
    # sudoers, package() does not ship a static copy (v5.2.1: the shipped copy was
    # a stale fossil that setup immediately overwrites on first run anyway).
}
