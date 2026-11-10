# Maintainer: thefangeddeity
pkgname=laptop-livecam
pkgver=7.2.1
pkgrel=1
pkgdesc="Stream a USB webcam via HLS using MediaMTX and ffmpeg, with browser viewer, camdash monitor, and family presence features"
arch=('any')
# RENAMED from hls-livecam-server, matching the upstream repo rename. These
# three are what make it a rename rather than a second package: pacman
# replaces the installed hls-livecam-server instead of refusing to install
# alongside it. The on-disk layout is deliberately UNCHANGED --
# /usr/share/hls-livecam-server, /etc/hls-livecam and the unit names stay --
# because every script, systemd unit and config on a live node refers to
# them, and renaming the package is not a reason to break a running fleet.
provides=('hls-livecam-server')
conflicts=('hls-livecam-server')
replaces=('hls-livecam-server')
url="https://github.com/thefangeddeity/laptop-livecam"
license=('GPL-3.0-or-later')
depends=('ffmpeg' 'nginx' 'python' 'python-psutil' 'python-flask' 'python-pillow' 'python-numpy' 'python-opencv' 'pyside6' 'v4l2loopback-dkms' 'smartmontools' 'v4l-utils' 'wget' 'ttf-dejavu' 'alsa-utils')
# alsa-utils: setup finds the microphone with arecord -l and the publisher sets
# capture levels with amixer. Without it a fresh node points AUDIO_DEVICE at
# the hw:0,0 default, which is often the HDMI sink or the ALSA loopback.
optdepends=('avahi: announce this node to peers over mDNS (livecam-capabilities)'
            'tailscale: HTTPS on the tailnet (tailscale serve)'
            'python-apprise: alert destinations other than Telegram')
install=laptop-livecam.install
# The detector model is fetched here, not carried in the repo. It used to be
# a 12.3 MiB blob in every clone that NOTHING installed -- the file the nodes
# loaded was hand-placed and `pacman -Qo` reported it owned by no package. As
# a source it is downloaded once at build time, checksummed, and installed by
# this package, so an upgrade or a reinstall now replaces it like anything
# else. noextract because it is not an archive.
_model=yolov8n.onnx
_model_tag=models-v1
source=("$pkgname-$pkgver.tar.gz::https://github.com/thefangeddeity/laptop-livecam/archive/refs/tags/v$pkgver.tar.gz"
        "laptop-livecam.install"
        "$_model::https://github.com/thefangeddeity/laptop-livecam/releases/download/$_model_tag/$_model")
noextract=("$_model")
sha256sums=('33f68e5f9ae4c7bc743baa7394be2d9c831fd5068f2cc0442eba1441b9f38c1d'
            '1aabda15394c709a908009494229da99cba6826f77618f056c20033b2656c93c'
            'b2bc52f40e8e1c532427d5bde3575a5d5b571b739fab2c6df443733ed1589cbd')

package() {
    cd "$pkgname-$pkgver"

    # The model, at the path device.env points at. CV_DETECT_MODEL defaults to
    # .../models/candidates/yolov8n.onnx on every node in the fleet.
    install -Dm644 "$srcdir/$_model" \
                   "$pkgdir/usr/share/hls-livecam-server/models/candidates/$_model"

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
    # setup's shared half: the device.env merge, the alert-file stub and the
    # post-install measurement, one implementation for Arch and Debian.
    install -Dm755 pkg/usr/share/hls-livecam-server/llc-configure \
                   "$pkgdir/usr/share/hls-livecam-server/llc-configure"
    install -Dm644 pkg/usr/share/hls-livecam-server/device.env.legacy-comments \
                   "$pkgdir/usr/share/hls-livecam-server/device.env.legacy-comments"
    install -Dm755 pkg/usr/share/hls-livecam-server/hls-livecam-setup-arch \
                   "$pkgdir/usr/share/hls-livecam-server/hls-livecam-setup"
    install -Dm755 pkg/usr/share/hls-livecam-server/hls-livecam-repair \
                   "$pkgdir/usr/share/hls-livecam-server/hls-livecam-repair"
    install -Dm644 pkg/usr/share/hls-livecam-server/block_art.py \
                   "$pkgdir/usr/share/hls-livecam-server/block_art.py"
    install -Dm644 pkg/usr/share/hls-livecam-server/buzz_tone.py \
                   "$pkgdir/usr/share/hls-livecam-server/buzz_tone.py"
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
    # The viewer loads the HLS player from /vendor/hls.min.js, same-origin,
    # deliberately not from cdnjs (a phone on a captive/filtered network got
    # a blank viewer otherwise -- see index.html's own comment on the
    # <script> tag). Missed when vendor/ was added: without this file a
    # fresh Arch install left Chrome/Firefox viewers silently broken (no
    # crash -- the page guards every Hls reference -- just no video),
    # exactly the failure class the vendoring was meant to prevent.
    # THE WHOLE vendor/ TREE, not a list. Listing files is how hls.min.js was
    # missed once and pyfakewebcam was missed again: the deb shipped the
    # vendored copy, this package depended on python-pyfakewebcam instead,
    # and that distro build calls ndarray.tostring(), removed in numpy 2 --
    # so on a current Arch no frame ever reached /dev/video10.
    cp -r pkg/usr/share/hls-livecam-server/vendor "$pkgdir/usr/share/hls-livecam-server/"
    install -Dm644 pkg/usr/share/hls-livecam-server/device.env.template \
                   "$pkgdir/usr/share/hls-livecam-server/device.env.template"
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

    # ── The camera suite ─────────────────────────────────────────────────────
    # hls-livecam-setup-arch runs `sh /usr/share/hls-livecam-server/\
    # hls-livecam-suite` as its last service step, and the suite's own line 16
    # installs hls-livecam.target from this same directory. The package shipped
    # NEITHER, so a fresh Arch install ran the wizard to the end and then
    # failed to put anything under the target -- the switch camdash --start /
    # --yield / --status operates. The .deb never showed it, because pkg/ is
    # packaged wholesale there and both files came along for free. Third time
    # this payload has been enumerated short; see cv_persist and vendor/
    # hls.min.js above.
    install -Dm755 pkg/usr/share/hls-livecam-server/hls-livecam-suite \
                   "$pkgdir/usr/share/hls-livecam-server/hls-livecam-suite"
    install -Dm644 pkg/usr/share/hls-livecam-server/hls-livecam.target \
                   "$pkgdir/usr/share/hls-livecam-server/hls-livecam.target"

    # ── Home page ────────────────────────────────────────────────────────────
    # The nginx config this package installs serves / from the web root's
    # home.html (`try_files /home.html =404`), so without this file / is a 404
    # on a fresh install. It is live on both nodes today only because somebody
    # copied it there by hand on Oct 15. post_upgrade refreshes it alongside
    # index.html.
    install -Dm644 pkg/usr/share/hls-livecam-server/home.html \
                   "$pkgdir/usr/share/hls-livecam-server/home.html"

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

    # Capability probe: writes capabilities.json to the web root and announces
    # it over mDNS. Peers and the home page read it. Live on tanzania since
    # Oct 15 from a hand copy in /usr/local/lib/livecam-tools -- which is why it
    # is installed HERE instead: pacman refuses to install over unowned files,
    # so claiming the hand copy's path made the upgrade fail on that node.
    install -Dm755 pkg/usr/share/hls-livecam-server/livecam-tools/announce-capabilities \
                   "$pkgdir/usr/share/hls-livecam-server/livecam-tools/announce-capabilities"
    install -Dm755 pkg/usr/share/hls-livecam-server/livecam-tools/node-capabilities \
                   "$pkgdir/usr/share/hls-livecam-server/livecam-tools/node-capabilities"
    install -Dm755 pkg/usr/share/hls-livecam-server/livecam-tools/publish-capabilities \
                   "$pkgdir/usr/share/hls-livecam-server/livecam-tools/publish-capabilities"
    install -Dm644 pkg/etc/systemd/system/livecam-capabilities.service \
                   "$pkgdir/usr/lib/systemd/system/livecam-capabilities.service"
    install -Dm644 pkg/etc/systemd/system/livecam-capabilities.timer \
                   "$pkgdir/usr/lib/systemd/system/livecam-capabilities.timer"

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
