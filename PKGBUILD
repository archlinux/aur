# Maintainer: Adil Bouzit <adil.bouzit@gmail.com>
pkgname=nova-control
pkgver=1.0.0
pkgrel=2
pkgdesc="Linux control app for the Arctis Nova 7 Gen 2: headset settings and PipeWire audio mixer"
arch=('any')
url="https://gitlab.com/S-Zilean/nova-control"
license=('MIT')
depends=('python' 'python-gobject' 'glib2' 'gtk4' 'libadwaita' 'pipewire' 'pipewire-audio'
         'pipewire-pulse' 'wireplumber' 'libpulse' 'gstreamer' 'gst-plugins-good' 'libmysofa')
optdepends=('noise-suppression-for-voice: microphone noise suppression'
            'swh-plugins: microphone compressor and night mode'
            'libnotify: desktop notifications')
install=nova-control.install
source=("$pkgname-v$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('353e382a2a13f13cf14c09d12f5e9d9a5c4520ea71c6298ad5fbd10b5b6b63c5')

package() {
    cd "$pkgname-v$pkgver"
    install -d "$pkgdir/usr/lib/$pkgname" "$pkgdir/usr/bin"
    cp -r novactl bin "$pkgdir/usr/lib/$pkgname/"
    find "$pkgdir/usr/lib/$pkgname" -name __pycache__ -prune -exec rm -rf {} +
    for b in novactl novactld novactl-gui novactl-tray; do
        ln -s "/usr/lib/$pkgname/bin/$b" "$pkgdir/usr/bin/$b"
    done
    install -Dm644 data/70-nova-control.rules "$pkgdir/usr/lib/udev/rules.d/70-nova-control.rules"
    install -d "$pkgdir/usr/lib/systemd/user" "$pkgdir/usr/share/applications" "$pkgdir/etc/xdg/autostart"
    sed 's|^ExecStart=.*|ExecStart=/usr/bin/novactld|' data/novactld.service \
        > "$pkgdir/usr/lib/systemd/user/novactld.service"
    sed 's|^Exec=.*|Exec=/usr/bin/novactl-gui|' data/nova-control.desktop \
        > "$pkgdir/usr/share/applications/nova-control.desktop"
    sed 's|^Exec=.*|Exec=/usr/bin/novactl-tray|' data/nova-control-tray.desktop \
        > "$pkgdir/etc/xdg/autostart/nova-control-tray.desktop"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
