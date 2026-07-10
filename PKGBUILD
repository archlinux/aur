# Maintainer: pakrohk <pakrohk@gmail.com>

pkgname=bluez-gamepad-quirks
pkgver=5.87
pkgrel=2
pkgdesc="BlueZ with HID gamepad quirk support for controllers with broken SDP records"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/EvolveBeyond/bluez"
license=('GPL-2.0')
depends=('glib2' 'dbus' 'libudev.so' 'ell' 'json-c' 'alsa-lib')
makedepends=('git' 'python' 'pkg-config' 'intltool' 'readline')
provides=('bluez')
conflicts=('bluez')
backup=('etc/bluetooth/main.conf'
        'etc/bluetooth/input.conf'
        'etc/bluetooth/network.conf')
options=(!emptydirs !strip)
install=bluez-gamepad-quirks.install
source=("$pkgname::git+https://github.com/EvolveBeyond/bluez.git#branch=gamepad-quirks"
        'bluetooth.conf'
        'tmpfiles.conf'
        'rules-10-bluez-gamepad-quirks.rules')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "$pkgname"
    # Try tags first, fallback to commit count
    local tag=$(git describe --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/-/+/g')
    if [ -n "$tag" ]; then
        echo "$tag"
    else
        # 5.87.base_count hash
        echo "5.87.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    fi
}

build() {
    cd "$pkgname"

    ./bootstrap-configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --libexecdir=/usr/lib \
        --enable-external-ell \
        --enable-cups \
        --enable-pie \
        --enable-mesh \
        --enable-nfc \
        --enable-sixaxis \
        --enable-hid2hci \
        --enable-midi \
        --enable-admin \
        --enable-external-plugins \
        --disable-obex \
        --disable-manpages

    make
}

package() {
    cd "$pkgname"

    make DESTDIR="$pkgdir" install

    # D-Bus config
    install -Dm644 "$srcdir/bluetooth.conf" \
        "$pkgdir/etc/dbus-1/system.d/bluetooth.conf"

    # tmpfiles
    install -Dm644 "$srcdir/tmpfiles.conf" \
        "$pkgdir/usr/lib/tmpfiles.d/bluez.conf"

    # udev rules
    install -Dm644 "$srcdir/rules-10-bluez-gamepad-quirks.rules" \
        "$pkgdir/etc/udev/rules.d/10-bluez-gamepad-quirks.rules"

    # Quirk profile directory
    install -dm755 "$pkgdir/var/lib/bluez/quirks"

    # Remove systemd files
    rm -rf "$pkgdir/usr/lib/systemd" 2>/dev/null
    rm -rf "$pkgdir/var/lib/bluetooth" 2>/dev/null
}
