# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=xconnect
pkgver=2.3.0
pkgrel=1
pkgdesc="KDE Connect protocol implementation in Vala/C with GTK3/XApp GUI"
arch=('x86_64')
url="https://github.com/Twilight0/xconnect"
license=('GPL2')
depends=(
    'glib2'
    'json-glib'
    'libgee'
    'libnotify'
    'gtk3'
    'libxtst'
    'at-spi2-core'
    'gnutls'
    'python'
    'python-gobject'
    'xapp'
)
makedepends=(
    'vala'
    'meson'
    'ninja'
    'pkg-config'
)
provides=('xconnectctl' 'xconnect-app')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('33774af4ef24397bbe3cf5457f63f5187c03a77297ae8e47468d99727fc4d6c0')

build() {
    cd "$pkgname-$pkgver"
    if [ -d build ]; then
        rm -rf build
    fi
    meson setup build \
        --prefix=/usr \
        --sysconfdir=/etc \
        --buildtype=plain
    ninja -C build
}

package() {
    cd "$pkgname-$pkgver"

    DESTDIR="$pkgdir" ninja -C build install

    # Install GUI
    install -Dm755 gui/xconnect-app.py "$pkgdir/usr/bin/xconnect-app"
    install -Dm755 gui/dbus_client.py "$pkgdir/usr/share/xconnect/gui/dbus_client.py"

    # Desktop file
    install -Dm644 gui/xconnect.desktop \
        "$pkgdir/usr/share/applications/xconnect.desktop"

    # D-Bus service - NOT installed, daemon starts via systemd user service
    # to avoid D-Bus session mismatch

    # systemd user service
    install -Dm644 extra/xconnect.service \
        "$pkgdir/usr/lib/systemd/user/xconnect.service"

    # Default config
    install -Dm644 xconnect.conf \
        "$pkgdir/usr/share/xconnect/xconnect.conf"

    # Icons
    install -Dm644 gui/icons/xconnect.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/xconnect.svg"
}
