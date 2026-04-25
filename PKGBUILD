# Maintainer: Wieczorkiewicz <wieczorkiewicz at users dot noreply dot github dot com>
pkgname=thinkpad-ipu7-camera-linux-driver
pkgver=1.0.1
pkgrel=1
pkgdesc="On-demand Intel IPU7 camera activation for ThinkPad X1 2-in-1 Gen 10 (Lunar Lake)"
arch=('any')
url="https://github.com/Wieczorkiewicz/thinkpad-ipu7-camera-linux-driver"
license=('MIT')
depends=(
    'python-gobject'
    'gst-plugins-bad'
    'v4l2loopback-dkms'
)
optdepends=(
    'gstreamer-icamerasrc: Intel IPU7 GStreamer plugin (required for camera to work)'
)
install=thinkpad-ipu7-camera-linux-driver.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Bridge script
    install -Dm755 src/ipu7-camera-dynamic.py \
                   "$pkgdir/usr/local/sbin/ipu7-camera-dynamic"

    # Systemd service (placeholder replaced by .install post_install)
    install -Dm644 systemd/ipu7-camera-dynamic.service \
                   "$pkgdir/usr/lib/systemd/system/ipu7-camera-dynamic.service"

    # WirePlumber config (system-wide)
    install -Dm644 wireplumber/51-ipu7-camera.conf \
                   "$pkgdir/etc/wireplumber/wireplumber.conf.d/51-ipu7-camera.conf"

    # modprobe.d — creates /dev/video32 at boot
    install -Dm644 modprobe/v4l2loopback-ipu7.conf \
                   "$pkgdir/etc/modprobe.d/v4l2loopback-ipu7.conf"

    # udev rules — expose video32 to logged-in user, hide raw IPU7 nodes
    install -Dm644 udev/99-ipu7-camera-loopback.rules \
                   "$pkgdir/etc/udev/rules.d/99-ipu7-camera-loopback.rules"
    install -Dm644 udev/90-ipu7-hide.rules \
                   "$pkgdir/etc/udev/rules.d/90-ipu7-hide.rules"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
