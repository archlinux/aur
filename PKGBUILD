# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>
# Contributor: Posi <posi1981@gmail.com>
# Contributor: Mikhail Velichko <efklid@gmail.com>
# Contributor: Michael Duncan Hammond <mhammond9@radford.edu>
# Contributor: K900 <me@0upti.me>

pkgname=cisco-anyconnect
pkgver=4.10.08029
pkgrel=2
pkgdesc='Cisco AnyConnect Secure Mobility Client'
url='https://www.cisco.com/c/en/us/support/security/anyconnect-secure-mobility-client-v4-x/model.html'
arch=('x86_64')
depends=('libxml2' 'ca-certificates' 'libxml2-legacy')
optdepends=(
    'hicolor-icon-theme: required by desktop shortcuts'
    'gtk2: required by vpnui'
    'glib2: required by vpnui'
    'gtk3: required by acwebhelper'
    'webkit2gtk: required by acwebhelper'
)
license=('custom')

# Stripping the binaries trips some sort of an integrity check inside vpnagentd.
options=('!strip')

source=(
    "https://helpdesk.ugent.be/vpn/download/anyconnect-linux64-$pkgver-predeploy-k9.tar.gz"
    'AnyConnectLocalPolicy.xml'
    "$pkgname.sh"
)

sha512sums=(
    '4ab4de736fc03f1261ee417a0afeb277bfcaca78b66671021d3ffba9640af352d531a6a32c8ea92e69ca0bf862ba0b96e5e5a67df86fb541c6f3ddad7c054f45'
    '4b6af68475ec427e51d0811b07637b132eb7a49b70de4142ea1f11f6c96c330c1cd368c178db86116457fb9a3eea1800873d3a1f03a0560fbec6fa63d88dc8ce'
    'a5de5f992f81c60bae9bcf7c784d3e335f1a709d76b363ec7d6d0e1846e2e23481b50dcbe7826755a3911a5f8fb53432a3d4cff1cc4bc5a13f9aedcf9a4c8c99'
)

package() {
    cd "anyconnect-linux64-$pkgver/vpn"

    # Install binaries.
    for binary in vpnagentd vpn vpndownloader vpndownloader-cli manifesttool_vpn acinstallhelper \
        vpnui acwebhelper load_tun.sh; do
        install -Dm755 $binary -t "$pkgdir/opt/cisco/anyconnect/bin"
    done

    # Install libs.
    for lib in libvpnagentutilities.so libvpncommon.so libvpncommoncrypt.so libvpnapi.so \
        libacruntime.so libacciscossl.so libacciscocrypto.so cfom.so libboost_date_time.so \
        libboost_filesystem.so libboost_regex.so libboost_system.so libboost_thread.so \
        libboost_signals.so libboost_chrono.so libaccurl.so.4.8.0; do
        install -Dm755 $lib -t "$pkgdir/opt/cisco/anyconnect/lib"
    done

    # The installer copies all the other symlinks, but creates this one for some reason,
    # so lets just create it ourselves.
    ln -s /opt/cisco/anyconnect/lib/libaccurl.so.4.8.0 "$pkgdir/opt/cisco/anyconnect/lib/libaccurl.so.4"

    # Install plugins.
    # We intentionally don't install the telemetry plugin here, because it tries to write to /opt.
    for plugin in libacwebhelper.so libvpnipsec.so; do
        install -Dm755 $plugin -t "$pkgdir/opt/cisco/anyconnect/bin/plugins"
    done

    cp -R resources "$pkgdir/opt/cisco/anyconnect/resources"

    # Install some misc stuff.
    install -Dm444 AnyConnectProfile.xsd -t "$pkgdir/opt/cisco/anyconnect/profile"

    for file in ACManifestVPN.xml update.txt AnyConnectLocalPolicy.xsd; do
        install -Dm444 $file -t "$pkgdir/opt/cisco/anyconnect"
    done

    # Install desktop file for vpnui.
    install -Dm644 resources/vpnui48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
    install -Dm644 resources/vpnui128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"

    sed -i "s|^Exec=.*|Exec=$pkgname|g" com.cisco.anyconnect.gui.desktop
    install -Dm644 com.cisco.anyconnect.gui.desktop -t "$pkgdir/usr/share/applications"

    # Install license.
    for license in license.txt OpenSource.html; do
        install -Dm644 $license -t "$pkgdir/usr/share/licenses/$pkgname"
    done

    # Install systemd unit for vpnagentd.
    install -Dm644 vpnagentd.service -t "$pkgdir/usr/lib/systemd/system"

    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

    # Install CA certificates.
    mkdir -p "$pkgdir/opt/.cisco/certificates/ca"

    # First, install our own system root.
    ln -s /etc/ca-certificates/extracted/tls-ca-bundle.pem "$pkgdir/opt/.cisco/certificates/ca/system-ca.pem"

    # Then, install Cisco's, because it doesn't actually trace to any of the trusted roots we have,
    # (thanks, VeriSign).
    install -Dm644 VeriSignClass3PublicPrimaryCertificationAuthority-G5.pem -t "$pkgdir/opt/.cisco/certificates/ca"

    # Install custom policy to disable auto updates,
    # so AnyConnect won't attempt to update itself as root,
    # and then run all over both itself and our packaging.
    #
    # NOTE: This may break some really quirky setups that require downloading files from the server,
    # but there's no other way around it that we could find.
    install -Dm644 "$srcdir/AnyConnectLocalPolicy.xml" -t "$pkgdir/opt/cisco/anyconnect"
}
