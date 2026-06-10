# Maintainer: Anatolii Vorona <vorona.tolik@gmail.com>
pkgbase=openlawsvpn
pkgname=(openlawsvpn-daemon openlawsvpn-cli openlawsvpn-gui)
pkgver=1.1.1
pkgrel=1
pkgdesc="AWS Client VPN client with SAML/SSO support — pure Go stack"
arch=(x86_64 aarch64 powerpc64le)
url="https://github.com/openlawsvpn/go-openlawsvpn"
license=(LGPL-2.1-or-later)
makedepends=(go rust gtk4 libadwaita openssl)
install=openlawsvpn.install
_srcdir="go-openlawsvpn-pkg-$pkgver-$pkgrel"
source=("$pkgbase-$pkgver-$pkgrel.tar.gz::https://github.com/openlawsvpn/go-openlawsvpn/archive/refs/tags/pkg/$pkgver-$pkgrel.tar.gz")
sha256sums=('166f61950019578e81b013c18ce1f3f52439a58e7f78d1d326b630d1a02d6ea0')

prepare() {
    cd "$_srcdir"
    go mod download
    cd gui-gtk
    cargo fetch --locked || cargo fetch
}

build() {
    cd "$_srcdir"
    CGO_ENABLED=0 go build -trimpath -o bin/openlawsvpn-daemon ./cmd/daemon
    CGO_ENABLED=0 go build -trimpath -o bin/openlawsvpn-cli ./cmd/cli
    cd gui-gtk
    cargo build --release --offline
}

package_openlawsvpn-daemon() {
    pkgdesc="openlawsvpn VPN daemon (D-Bus system service)"
    depends=(dbus polkit libcap)

    cd "$_srcdir"

    install -Dm755 bin/openlawsvpn-daemon \
        "$pkgdir/usr/lib/openlawsvpn/openlawsvpn-daemon"

    install -Dm644 cmd/daemon/openlawsvpn-daemon.service \
        "$pkgdir/usr/lib/systemd/system/openlawsvpn-daemon.service"

    install -Dm644 packaging/com.openlawsvpn.Daemon.conf \
        "$pkgdir/usr/share/dbus-1/system.d/com.openlawsvpn.Daemon.conf"

    install -Dm644 packaging/com.openlawsvpn.Daemon.service \
        "$pkgdir/usr/share/dbus-1/system-services/com.openlawsvpn.Daemon.service"

    install -Dm644 packaging/10-openlawsvpn-dns.rules \
        "$pkgdir/usr/share/polkit-1/rules.d/10-openlawsvpn-dns.rules"

    install -Dm644 packaging/90-openlawsvpn.preset \
        "$pkgdir/usr/lib/systemd/system-preset/90-openlawsvpn.preset"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 LICENSE_USAGE_EXCEPTION \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE_USAGE_EXCEPTION"
}

package_openlawsvpn-cli() {
    pkgdesc="openlawsvpn CLI — headless VPN client with SAML/CRV1 support"
    depends=(iproute2)

    cd "$_srcdir"

    install -Dm755 bin/openlawsvpn-cli "$pkgdir/usr/bin/openlawsvpn-cli"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 LICENSE_USAGE_EXCEPTION \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE_USAGE_EXCEPTION"
}

package_openlawsvpn-gui() {
    pkgdesc="openlawsvpn GTK4 GUI"
    # GUI statically links Rust crates with various licenses.
    license=(LGPL-2.1-or-later MIT Apache-2.0 BSD-2-Clause)
    depends=(openlawsvpn-daemon gtk4 libadwaita dbus openssl)

    cd "$_srcdir"

    install -Dm755 gui-gtk/target/release/openlawsvpn-gui \
        "$pkgdir/usr/bin/openlawsvpn-gui"

    install -Dm644 packaging/openlawsvpn-gui.desktop \
        "$pkgdir/usr/share/applications/openlawsvpn-gui.desktop"

    install -Dm644 gui-gtk/resources/icons/vpn-disconnected.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/openlawsvpn-disconnected.svg"

    install -Dm644 gui-gtk/resources/icons/vpn-connected.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/openlawsvpn-connected.svg"

    install -Dm644 gui-gtk/resources/icons/com.openlawsvpn.gui.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.openlawsvpn.gui.svg"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
