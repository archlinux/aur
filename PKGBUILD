# Note: After installation must me enabled service 'sudo systemctl enable --now vpnagentd.service'
pkgname=cisco-secure-client
pkgver=5.1.11.388
pkgrel=1
pkgdesc='Cisco AnyConnect Secure Mobility Client'
url='https://www.cisco.com/site/us/en/products/security/secure-client/index.html'
arch=('x86_64')
depends=('libxml2-legacy' 'ca-certificates')
optdepends=(
    'hicolor-icon-theme: required by desktop shortcuts'
    'glib2: required by vpnui'
    'gtk3: required by vpnui'
    'webkit2gtk: required by acwebhelper'
)
conflicts=('cisco-anyconnect')
license=('custom')

# skip stripping the binaries to pass integrity check inside vpnagentd
options=('!strip')

source=(
    "cisco-secure-client-linux64-${pkgver}-predeploy-k9.tar.gz::https://archive.org/download/cisco-secure-client-linux64-5.1.11.388/cisco-secure-client-linux64-${pkgver}-predeploy-k9.tar.gz"
)

sha256sums=('066815d05c2547e3cab02167e7ed85c2adcbab95f6942aa94561db8395e01c69')

package() {
    mkdir -p "${pkgdir}/opt/cisco/anyconnect"
    mkdir -p "${pkgdir}/opt/cisco/secureclient/CustomerExperienceFeedback"
    touch "${pkgdir}/opt/cisco/secureclient/CustomerExperienceFeedback/config"
    touch "${pkgdir}/opt/cisco/secureclient/CustomerExperienceFeedback/history"
    mkdir -p "${pkgdir}/opt/cisco/secureclient/CustomerExperienceFeedback/moduledata"
    touch "${pkgdir}/opt/cisco/secureclient/CustomerExperienceFeedback/moduledata/vpn.cef.temp"
    mkdir -p "${pkgdir}/opt/cisco/secureclient/help"
    mkdir -p "${pkgdir}/opt/cisco/secureclient/vpn"
    mkdir -p "${pkgdir}/opt/cisco/secureclient/CustomerExperienceFeedback/moduledata"
    mkdir -p "${pkgdir}/opt/cisco/secureclient/CustomerExperienceFeedback/outbound"
    mkdir -p "${pkgdir}/opt/cisco/secureclient/vpn/profile"
    mkdir -p "${pkgdir}/opt/cisco/secureclient/vpn/script"

    cd "${srcdir}/cisco-secure-client-linux64-${pkgver}/vpn"

    # install binaries
    for binary in "acextwebhelper" "acinstallhelper" "acwebhelper" "cisco_secure_client_uninstall.sh" "load_tun.sh" "manifesttool_vpn" "vpn" "vpnagentd" "vpndownloader" "vpndownloader-cli" "vpnui" "vpn_uninstall.sh"; do
        install -Dm755 ${binary} "${pkgdir}/opt/cisco/secureclient/bin/${binary}"
    done
    ln -s /opt/cisco/secureclient/bin/manifesttool_vpn "${pkgdir}/opt/cisco/secureclient/bin/manifesttool"

    # install libs
    for lib in "cfom.so" "libacciscocrypto.so" "libacciscossl.so" "libaccurl.so.4.8.0" "libacruntime.so" "libboost_atomic.so" "libboost_chrono.so" "libboost_date_time.so" "libboost_filesystem.so" "libboost_regex.so" "libboost_system.so" "libboost_thread.so" "libvpnagentutilities.so" "libvpnapi.so" "libvpncommoncrypt.so" "libvpncommon.so"; do
        install -Dm755 ${lib} "${pkgdir}/opt/cisco/secureclient/lib/${lib}"
    done

    # simlink to libaccurl.so.4.8.0
    ln -s /opt/cisco/secureclient/lib/libaccurl.so.4.8.0 "${pkgdir}/opt/cisco/secureclient/lib/libaccurl.so.4"

    # install plugins
    for plugin in "libacdownloader.so" "libacfeedback.so" "libacwebhelper.so" "libvpnipsec.so"; do
        install -Dm755 ${plugin} "${pkgdir}/opt/cisco/secureclient/bin/plugins/${plugin}"
    done

    # copy resorces
    cp -R resources "${pkgdir}/opt/cisco/secureclient/resources"

    # install other files
    install -Dm444 AnyConnectProfile.xsd "${pkgdir}/opt/cisco/secureclient/vpn/profile/AnyConnectProfile.xsd"
    for file in "ACManifestVPN.xml" "OpenSource.html" "update.txt"; do
        install -Dm444 ${file} "${pkgdir}/opt/cisco/secureclient/${file}"
    done

    # simlink ACManifestVPN.xml
    ln -s /opt/cisco/secureclient/ACManifestVPN.xml "${pkgdir}/opt/cisco/anyconnect/ACManifestVPN.xml"

    # install icons and desktop file for vpnui
    install -Dm644 resources/vpnui48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/cisco-secure-client.png"
    install -Dm644 resources/vpnui64.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/cisco-secure-client.png"
    install -Dm644 resources/vpnui96.png "${pkgdir}/usr/share/icons/hicolor/96x96/apps/cisco-secure-client.png"
    install -Dm644 resources/vpnui128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/cisco-secure-client.png"
    install -Dm644 resources/vpnui256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/cisco-secure-client.png"
    install -Dm644 resources/vpnui512.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/cisco-secure-client.png"

    sed -i "s|^Exec=.*|Exec=sh -c \'LD_LIBRARY_PATH\=\/opt\/cisco\/anyconnect\/lib\:\$LD_LIBRARY_PATH \/opt\/cisco\/secureclient/bin\/vpnui'|g" com.cisco.secureclient.gui.desktop
    install -Dm644 com.cisco.secureclient.gui.desktop "${pkgdir}/usr/share/applications/com.cisco.secureclient.gui.desktop"

    # install license
    for license in "license.txt" "OpenSource.html"; do
        install -Dm644 ${license} "${pkgdir}/usr/share/licenses/${pkgname}/${license}"
    done

    # install systemd unit for vpnagentd
    install -Dm644 "./vpnagentd.service" "${pkgdir}/usr/lib/systemd/system/vpnagentd.service"

    # install script in to /usr/bin folder
    mkdir -p "${pkgdir}/usr/bin/"
    echo "#!/bin/bash" >>"${pkgdir}/usr/bin/${pkgname}"
    echo "LD_LIBRARY_PATH=/opt/cisco/secureclient/lib:$LD_LIBRARY_PATH /opt/cisco/secureclient/bin/vpnui" >>"${pkgdir}/usr/bin/${pkgname}"
    chmod 755 ${pkgdir}/usr/bin/${pkgname}

    # symlink to 'vpn' binary
    ln -s /opt/cisco/secureclient/bin/vpn "${pkgdir}/usr/bin/vpn"

    # install CA certificates
    mkdir -p "${pkgdir}/opt/.cisco/certificates/ca"

    # install our own system root certificate
    ln -s /etc/ca-certificates/extracted/tls-ca-bundle.pem "${pkgdir}/opt/.cisco/certificates/ca/system-ca.pem"

    # install VeriSign public certificate
    install -Dm644 VeriSignClass3PublicPrimaryCertificationAuthority-G5.pem "${pkgdir}/opt/.cisco/certificates/ca/VeriSignClass3PublicPrimaryCertificationAuthority-G5.pem"
}
