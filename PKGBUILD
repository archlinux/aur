# Maintainer: wearzdk <hi@wearzdk.me>
pkgbase=mechrevo-osd-linux
pkgname=(mechrevo-osd-linux mechrevo-osd-dkms)
pkgver=0.1.1
pkgrel=1
pkgdesc='On-screen keyboard and firmware status for MECHREVO laptops'
arch=('x86_64')
url='https://github.com/wearzdk/mechrevo-osd-linux'
license=('GPL-2.0-or-later')
makedepends=('dkms' 'pyside6' 'python' 'python-dbus' 'systemd')
source=("$url/releases/download/v$pkgver/$pkgbase-$pkgver.tar.gz"
        'README.arch')
sha256sums=('4d95854c71d0557b2bf3f23ac00c130e7b64fcca593fae9509311db8907b37a2'
            '6f85b5d9e3415a860303fd2a8403934395a59e5ba5fc49d132fd5bc7da12fbf9')

prepare() {
    cd "$pkgbase-$pkgver"
    sed -i 's|/usr/local/|/usr/|g' \
        packaging/mechrevo-osd \
        packaging/mechrevo-osd.desktop \
        packaging/mechrevo-osd.service \
        packaging/mechrevo-osd-binding.service
}

check() {
    cd "$pkgbase-$pkgver"
    python -m unittest discover -s tests -v
}

package_mechrevo-osd-linux() {
    arch=('any')
    license=('GPL-2.0-or-later' 'LicenseRef-OEM')
    depends=("mechrevo-osd-dkms=$pkgver" 'python' 'pyside6' 'python-dbus')
    optdepends=('qt6-wayland: Wayland display support'
                'wayland-utils: automatic detection of Wayland layer-shell'
                'layer-shell-qt: native overlay on layer-shell compositors')

    cd "$pkgbase-$pkgver"
    install -d "$pkgdir/usr/lib/$pkgbase/assets"
    install -m644 mechrevo_osd.py events.py display.py Overlay.qml LayerOverlay.qml \
        "$pkgdir/usr/lib/$pkgbase/"
    install -m644 assets/*.png "$pkgdir/usr/lib/$pkgbase/assets/"
    install -Dm755 packaging/mechrevo-osd "$pkgdir/usr/bin/mechrevo-osd"
    install -Dm644 packaging/mechrevo-osd.desktop \
        "$pkgdir/usr/share/applications/mechrevo-osd.desktop"
    install -Dm644 packaging/mechrevo-osd.service \
        "$pkgdir/usr/lib/systemd/user/mechrevo-osd.service"
    install -Dm644 "$srcdir/README.arch" "$pkgdir/usr/share/doc/$pkgname/README.arch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -m644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}

package_mechrevo-osd-dkms() {
    pkgdesc='MECHREVO WUJIE T142-HPT-R firmware event driver (DKMS)'
    depends=('dkms' 'python' 'systemd')
    install=mechrevo-osd-dkms.install

    cd "$pkgbase-$pkgver"
    install -d "$pkgdir/usr/src/mechrevo-osd-$pkgver"
    install -m644 driver/Makefile driver/dkms.conf driver/mechrevo-osd-wmi.c \
        "$pkgdir/usr/src/mechrevo-osd-$pkgver/"
    install -Dm644 packaging/bind-events.py "$pkgdir/usr/lib/$pkgbase/bind-events.py"
    install -Dm644 packaging/mechrevo-osd-binding.service \
        "$pkgdir/usr/lib/systemd/system/mechrevo-osd-binding.service"
    install -Dm644 packaging/70-mechrevo-osd.rules \
        "$pkgdir/usr/lib/udev/rules.d/70-mechrevo-osd.rules"
}
