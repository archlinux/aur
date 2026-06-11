# Maintainer: Ron <thefangeddeity>
pkgname=hls-livecam-server
pkgver=5.1.7
pkgrel=1
pkgdesc="Stream a USB webcam via HLS using MediaMTX and ffmpeg, with browser viewer, camdash monitor, and family presence features"
arch=('any')
url="https://github.com/thefangeddeity/hls-livecam-server"
license=('GPL-3.0-or-later')
depends=('ffmpeg' 'nginx' 'python' 'python-psutil' 'python-flask' 'python-pillow' 'python-numpy' 'python-pyfakewebcam' 'v4l2loopback-dkms' 'smartmontools' 'v4l-utils' 'wget' 'ttf-dejavu')
install=hls-livecam-server.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/thefangeddeity/hls-livecam-server/archive/refs/tags/v$pkgver.tar.gz"
        "hls-livecam-server.install")
sha256sums=('c165ed9eee375fd31633b1be1c8eb379c8d2556abfa23919481e814ed7c94724'
            'SKIP')

package() {
    cd "$pkgname-$pkgver"

    # ── Executables ──────────────────────────────────────────────────────────
    install -Dm755 pkg/usr/share/hls-livecam-server/hls-livecam-setup-arch \
                   "$pkgdir/usr/local/bin/hls-livecam-setup"
    install -Dm755 pkg/usr/local/bin/camdash          "$pkgdir/usr/local/bin/camdash"
    install -Dm755 pkg/usr/local/bin/hls-livecam-repair "$pkgdir/usr/local/bin/hls-livecam-repair"
    install -Dm755 pkg/usr/local/bin/hls-livecam-dark  "$pkgdir/usr/local/bin/hls-livecam-dark"
    install -Dm755 pkg/usr/local/bin/broadcast-api     "$pkgdir/usr/local/bin/broadcast-api"

    # ── Shared data ──────────────────────────────────────────────────────────
    install -Dm755 pkg/usr/share/hls-livecam-server/camdash \
                   "$pkgdir/usr/share/hls-livecam-server/camdash"
    install -Dm755 pkg/usr/share/hls-livecam-server/hls-livecam-setup-arch \
                   "$pkgdir/usr/share/hls-livecam-server/hls-livecam-setup"
    install -Dm755 pkg/usr/share/hls-livecam-server/hls-livecam-repair \
                   "$pkgdir/usr/share/hls-livecam-server/hls-livecam-repair"
    install -Dm644 pkg/usr/share/hls-livecam-server/block_art.py \
                   "$pkgdir/usr/share/hls-livecam-server/block_art.py"
    install -Dm644 pkg/usr/share/hls-livecam-server/index.html \
                   "$pkgdir/usr/share/hls-livecam-server/index.html"
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
    # Ships http user for broadcast-api (Arch has no www-data).
    # Per-user entries (hls-livecam-dark, hls-livecam-services, camdash-smart)
    # are written dynamically by hls-livecam-setup at configure time.
    install -Dm440 pkg/etc/sudoers.d/hls-livecam-dark \
                   "$pkgdir/etc/sudoers.d/hls-livecam-dark"
}
