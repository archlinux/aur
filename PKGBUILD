# Maintainer: pakrohk <pakrohk@gmail.com>

pkgname=bluez-gamepad-quirks
pkgver=5.87.29175.9ad9435d4
pkgrel=1
pkgdesc="Patched BlueZ bluetoothd with HID gamepad quirk support for controllers with broken SDP records"
arch=('x86_64')
url="https://github.com/EvolveBeyond/bluez"
license=('GPL-2.0')
depends=('bluez' 'glib2' 'dbus' 'libudev.so' 'ell' 'json-c' 'alsa-lib')
makedepends=('git' 'python' 'pkg-config' 'intltool' 'readline')
options=(!emptydirs !strip)
install=bluez-gamepad-quirks.install
source=("$pkgname::git+https://github.com/EvolveBeyond/bluez.git#branch=gamepad-quirks"
        'tmpfiles.conf')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "$pkgname"
    local tag=$(git describe --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/-/+/g')
    if [ -n "$tag" ]; then
        echo "$tag"
    else
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

    make -j$(nproc)
}

package() {
    cd "$pkgname"

    # Install patched binaries to separate location (safe, no conflicts)
    install -Dm755 src/bluetoothd "$pkgdir/usr/lib/bluez-gamepad-quirks/bluetoothd"
    install -Dm755 tools/bluez-quirkctl "$pkgdir/usr/bin/bluez-quirkctl"

    # tmpfiles
    install -Dm644 "$srcdir/tmpfiles.conf" \
        "$pkgdir/usr/lib/tmpfiles.d/bluez-gamepad-quirks.conf"

    # Quirk profile directory
    install -dm755 "$pkgdir/var/lib/bluez-gamepad-quirks/quirks"
}
