# Maintainer: Mahmud <your@email.com>
pkgname=ibus-engine-bangla-google
pkgver=1.0.0
pkgrel=1
pkgdesc="Bangla phonetic input engine for IBus using Google Input Tools"
arch=('any')
url="https://github.com/shahratin/bangla-google-ibus"
license=('GPL-3.0-only')
depends=('libibus' 'python' 'python-gobject' 'glib2')
makedepends=('git')
source=("git+https://github.com/shahratin/bangla-google-ibus.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/bangla-google-ibus"

    # Engine script
    install -Dm644 bangla_engine.py \
        "$pkgdir/usr/lib/bangla-google-ibus/bangla_engine.py"

    # IBus component XML
    install -Dm644 bangla-google.xml \
        "$pkgdir/usr/share/ibus/component/bangla-google.xml"

    # Systemd user service
    install -Dm644 bangla-engine.service \
        "$pkgdir/usr/lib/systemd/user/bangla-engine.service"
}

post_install() {
    systemctl --user daemon-reload
    systemctl --user enable --now bangla-engine.service
    ibus restart
    echo ">>> install ibus-autostart with yay -S ibus-autostart"
    echo ">>> Switch to 'Bangla (Google)' in ibus-setup under Input Method tab"
}

post_remove() {
    systemctl --user disable --now bangla-engine.service 2>/dev/null || true
    systemctl --user daemon-reload
    ibus restart 2>/dev/null || true

    # Force remove leftover directory
    rm -rf /usr/lib/bangla-google-ibus
}
