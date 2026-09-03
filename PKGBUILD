# Maintainer: keatonj <jiang131072@gmail.com>

pkgname=cisco-secure-client-nus-bin
pkgver=5.1.8.122
pkgrel=1
pkgdesc="Cisco Secure Client (formerly AnyConnect) VPN and DART (NUS predeploy)"
arch=('x86_64')
url="https://www.cisco.com/site/us/en/products/security/secure-client/index.html"
license=('LicenseRef-Cisco')

depends=(
    'boost-libs'
    'glib2'
    'glibc'
    'gtk3'
    'libxml2-legacy'
    'polkit'
    'webkit2gtk-4.1'
    'zlib'
)

provides=(
    'cisco-secure-client'
    'cisco-secure-client-vpn'
    'cisco-secure-client-dart'
)
conflicts=(
    'cisco-secure-client'
    'cisco-anyconnect-vpn'
    'cisco-anyconnect-dart'
)

install="${pkgname}.install"
options=('!strip')
source=(
    "file://cisco-secure-client-linux64-${pkgver}-predeploy-deb-k9.tar.gz"
    "cisco-secure-client-nus-bin.install"
    )
sha256sums=('SKIP')

prepare() {
    cd "$srcdir"

    bsdtar -xf "cisco-secure-client-vpn_${pkgver}_amd64.deb" data.tar.xz
    mv data.tar.xz data-vpn.tar.xz

    bsdtar -xf "cisco-secure-client-dart_${pkgver}_amd64.deb" data.tar.xz
    mv data.tar.xz data-dart.tar.xz
}

package() {
    cd "$srcdir"

    bsdtar -xf data-vpn.tar.xz -C "$pkgdir"
    bsdtar -xf data-dart.tar.xz -C "$pkgdir"

    mkdir -p "$pkgdir/usr/lib"
    cp -a "$pkgdir/lib/." "$pkgdir/usr/lib/"
    rm -rf "$pkgdir/lib"

    sed -i 's|^EnvironmentFile=/etc/environment|EnvironmentFile=-/etc/environment|' \
        "$pkgdir/usr/lib/systemd/system/vpnagentd.service"

    mkdir -p "$pkgdir/opt/cisco/secureclient/dart"
    mv "$pkgdir/RequestXMLSchema.xsd" "$pkgdir/opt/cisco/secureclient/dart/"

    install -Dm644 "$pkgdir/opt/cisco/secureclient/OpenSource.html" \
        "$pkgdir/usr/share/licenses/$pkgname/OpenSource.html"

    chmod -R 755 "$pkgdir/etc" "$pkgdir/usr"
    chmod -R 775 \
        "$pkgdir/etc/xdg/menus/applications-merged" \
        "$pkgdir/usr/share/doc/cisco-secure-client-dart" \
        "$pkgdir/usr/share/doc/cisco-secure-client-vpn"

    chown -R --no-dereference root:root "$pkgdir"
}
