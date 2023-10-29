# Maintainer: Posi <posi1981@gmail.com>
# Contributor: Mikhail Velichko <efklid@gmail.com>
# Contributor: Michael Duncan Hammond <mhammond9@radford.edu>
# Contributor: K900 <me@0upti.me>

pkgname=cisco-anyconnect
pkgver=4.10.07061
pkgrel=1
pkgdesc='Cisco AnyConnect Secure Mobility Client'
url='https://www.cisco.com/c/en/us/products/security/anyconnect-secure-mobility-client/index.html'
arch=('x86_64')
depends=('libxml2' 'ca-certificates')
optdepends=(
    'hicolor-icon-theme: required by desktop shortcuts'
    'gtk2: required by vpnui'
    'glib2: required by vpnui'
    'gtk3: required by acwebhelper'
    'webkit2gtk: required by acwebhelper'
)
license=('custom')

# stripping the binaries trips some sort of an integrity check inside vpnagentd
options=('!strip')

# you will have to obtain the installer yourself - it's not available publicly
source=(
"anyconnect-linux64-${pkgver}-predeploy-k9.tar.gz::https://ftp.uni-weimar.de/anyconnect-linux64-${pkgver}-predeploy-k9.tar.gz"
"${pkgname}.sh" 
"AnyConnectLocalPolicy.xml"
)

sha256sums=('822dd9037831e5ed68a47de03155840983ebee38f028c0bc866433320fe5b281'
            '200ab27674568ac32b939c02bba051f90cf59d6ca087746a1e54c5a7ac207dbc'
            'b7c65a236e671d3eb527a3377e22b66018c450d726f71fa6344530a75255dac7')

package() {
    cd "${srcdir}/anyconnect-linux64-${pkgver}/vpn"

    # install binaries
    for binary in "vpnagentd" "vpn" "vpndownloader" "vpndownloader-cli" "manifesttool_vpn" "acinstallhelper" "vpnui" "acwebhelper" "load_tun.sh"; do
        install -Dm755 ${binary} "${pkgdir}/opt/cisco/anyconnect/bin/${binary}"
    done

    # install libs
    for lib in "libvpnagentutilities.so" "libvpncommon.so" "libvpncommoncrypt.so" \
        "libvpnapi.so" "libacruntime.so" "libacciscossl.so" "libacciscocrypto.so" \
        "cfom.so" "libboost_date_time.so" "libboost_filesystem.so" "libboost_regex.so" "libboost_system.so" \
        "libboost_thread.so" "libboost_signals.so" "libboost_chrono.so" \
        "libaccurl.so.4.8.0"; do
        install -Dm755 ${lib} "${pkgdir}/opt/cisco/anyconnect/lib/${lib}"
    done
#     rm -rf ${pkgdir}/opt/cisco/anyconnect/lib/libboost*

    # the installer copies all the other symlinks, but creates this one
    # for some reason so let's just create it ourselves
    ln -s /opt/cisco/anyconnect/lib/libaccurl.so.4.8.0 "${pkgdir}/opt/cisco/anyconnect/lib/libaccurl.so.4"

    # install plugins
    # we intentionally don't install the telemetry plugin here
    # because it tries to write to /opt and we don't want that
    for plugin in "libacwebhelper.so" "libvpnipsec.so"; do
        install -Dm755 ${plugin} "${pkgdir}/opt/cisco/anyconnect/bin/plugins/${plugin}"
    done

    cp -R resources "${pkgdir}/opt/cisco/anyconnect/resources"

    # install some misc stuff
    install -Dm444 AnyConnectProfile.xsd "${pkgdir}/opt/cisco/anyconnect/profile/AnyConnectProfile.xsd"

    for file in "ACManifestVPN.xml" "update.txt" "AnyConnectLocalPolicy.xsd"; do
        install -Dm444 ${file} "${pkgdir}/opt/cisco/anyconnect/${file}"
    done

    # install desktop file for vpnui
    install -Dm644 resources/vpnui48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/cisco-anyconnect.png"
    install -Dm644 resources/vpnui128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/cisco-anyconnect.png"

    sed -i "s|^Exec=.*|Exec=${pkgname}|g" com.cisco.anyconnect.gui.desktop
    install -Dm644 com.cisco.anyconnect.gui.desktop "${pkgdir}/usr/share/applications/cisco-anyconnect.desktop"

    # install license
    for license in "license.txt" "OpenSource.html"; do
        install -Dm644 ${license} "${pkgdir}/usr/share/licenses/${pkgname}/${license}"
    done

    # install systemd unit for vpnagentd
    install -Dm644 "vpnagentd.service" "${pkgdir}/usr/lib/systemd/system/vpnagentd.service"

    install -Dm755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
    # install CA certificates
    mkdir -p "${pkgdir}/opt/.cisco/certificates/ca"

    # first, install our own system root
    ln -s /etc/ca-certificates/extracted/tls-ca-bundle.pem "${pkgdir}/opt/.cisco/certificates/ca/system-ca.pem"

    # then, install Cisco's, because it doesn't actually trace to any of the trusted roots we have
    # (thanks, VeriSign)
    install -Dm644 VeriSignClass3PublicPrimaryCertificationAuthority-G5.pem "${pkgdir}/opt/.cisco/certificates/ca/VeriSignClass3PublicPrimaryCertificationAuthority-G5.pem"

    # install custom policy to disable auto updates
    # AnyConnect will attempt to update itself as root, and then run all over both itself and our packaging
    # so prevent it from doing anything like that
    #
    # this may break some really quirky setups that require downloading files from the server,
    # but there's no other way around it that I could find
    install -Dm644 "${srcdir}/AnyConnectLocalPolicy.xml" "${pkgdir}/opt/cisco/anyconnect/AnyConnectLocalPolicy.xml"
}
