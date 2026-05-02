# Maintainer: Ron <thefangeddeity>
pkgname=hls-livecam-server
pkgver=2.8.9
pkgrel=1
pkgdesc="Stream a USB webcam via HLS using MediaMTX and ffmpeg, with browser viewer, camstack monitor, and family presence features"
arch=('any')
url="https://github.com/thefangeddeity/hls-livecam-server"
license=('GPL-3.0-or-later')
depends=('ffmpeg' 'nginx' 'python' 'python-psutil' 'python-flask' 'python-pillow' 'smartmontools' 'v4l-utils' 'wget')
install=hls-livecam-server.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/thefangeddeity/hls-livecam-server/archive/refs/tags/v$pkgver.tar.gz"
        "hls-livecam-server.install")
sha256sums=('7c3194986967f08a0124b9edf6594c607e00dd29680498fb85e4aca0a873bc8f'
            'aab8d136f606ee05f7bb96ee51d2fcd1730edfa632ec4b832817e2901edf9f2e')

package() {
    cd "$pkgname-$pkgver"

    # ── Executables ──────────────────────────────────────────────────────────
    install -Dm755 pkg/usr/share/hls-livecam-server/hls-livecam-setup-arch \
                   "$pkgdir/usr/local/bin/hls-livecam-setup"
    install -Dm755 pkg/usr/local/bin/camstack          "$pkgdir/usr/local/bin/camstack"
    install -Dm755 pkg/usr/local/bin/hls-livecam-repair "$pkgdir/usr/local/bin/hls-livecam-repair"
    install -Dm755 pkg/usr/local/bin/hls-livecam-dark  "$pkgdir/usr/local/bin/hls-livecam-dark"
    install -Dm755 pkg/usr/local/bin/broadcast-api     "$pkgdir/usr/local/bin/broadcast-api"

    # ── Shared data ──────────────────────────────────────────────────────────
    install -Dm755 pkg/usr/share/hls-livecam-server/camstack \
                   "$pkgdir/usr/share/hls-livecam-server/camstack"
    install -Dm755 pkg/usr/share/hls-livecam-server/hls-livecam-setup-arch \
                   "$pkgdir/usr/share/hls-livecam-server/hls-livecam-setup"
    install -Dm755 pkg/usr/share/hls-livecam-server/hls-livecam-repair \
                   "$pkgdir/usr/share/hls-livecam-server/hls-livecam-repair"
    install -Dm644 pkg/usr/share/hls-livecam-server/block_art.py \
                   "$pkgdir/usr/share/hls-livecam-server/block_art.py"
    install -Dm644 pkg/usr/share/hls-livecam-server/index.html \
                   "$pkgdir/usr/share/hls-livecam-server/index.html"
    install -Dm644 pkg/usr/share/hls-livecam-server/ffmpeg-cam.service \
                   "$pkgdir/usr/share/hls-livecam-server/ffmpeg-cam.service"

    # NOTE: var/www/hls-livecam/index.html is NOT installed here.
    # hls-livecam-setup populates /var/www/hls-livecam/ at configure time,
    # substituting @HOSTNAME@ into share/index.html. Installing a pre-baked
    # file here would overwrite it with the wrong hostname on every upgrade.

    # ── Systemd services ─────────────────────────────────────────────────────
    # Arch convention: vendor units go to /usr/lib/systemd/system/
    install -Dm644 pkg/etc/systemd/system/broadcast-api.service \
                   "$pkgdir/usr/lib/systemd/system/broadcast-api.service"
    install -Dm644 pkg/etc/systemd/system/ffmpeg-cam-dark.service \
                   "$pkgdir/usr/lib/systemd/system/ffmpeg-cam-dark.service"
    install -Dm644 pkg/etc/systemd/system/ffmpeg-cam.service \
                   "$pkgdir/usr/lib/systemd/system/ffmpeg-cam.service"

    # ── Sudoers ───────────────────────────────────────────────────────────────
    # Ships www-data entry for broadcast-api dark toggle.
    # Per-user entries (hls-livecam-dark, hls-livecam-services, camstack-smart)
    # are written dynamically by hls-livecam-setup at configure time.
    install -Dm440 pkg/etc/sudoers.d/hls-livecam-dark \
                   "$pkgdir/etc/sudoers.d/hls-livecam-dark"
}
