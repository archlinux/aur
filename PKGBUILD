#Maintainer: Michael Duncan Hammond <mhammond9@radford.edu>

### IMPORTANT!!! PLEASE READ!!! ###

    #################################################################
    #    Once installed, run:                                       #
    #                                                               #
    # systemctl reenable vpnagentd                                  #
    # systemctl enable vpnagents                                    #
    # systemctl start vpnagentd                                     #
    #                                                               #
    # to get the Cisco AnyConnect VPN client to properly load.      #
    #                                                               #
    # I'd love to have these commands in the PKGBUILD.              #
    # I also don't want the package to be taken down, because       #
    # the Arch community would hate that I included them. :)        #
    #                                                               #
    # Make sure the .tar.gz file is named:                          #
    # 'anyconnect-linux64.tar.gz'                                   #
    # and is in your Downloads folder.                              #
    #                                                               #
    # Also, please feel free to email me or post in the comments of #
    # the package if something isn't quite working with this        #
    # AUR package. Keep in mind that it's for tarball owners only.  #
    #                                                               #
    # Most of this code comes from the cisco-anyconnect .sh repo,   #
    # with some minor changes for tarball owners.                   #
    #                                                               #
    # Thanks to K900 <me@0upti.me> for the mentioned repo,          #
    # as creating this AUR package saved a bunch of time thanks     #
    # to them. They also helped track down a pretty major bug. :)   #
    #                                                               #
    #################################################################



pkgname=cisco-anyconnect-tarball
pkgver=4.7.00136
pkgrel=1
pkgdesc="Cisco Anyconnect Secure Mobility Client Tarball"
arch=('x86_64')
depends=('libxml2' 'ca-certificates' 'lib32-gcc-libs' 'lib32-ncurses5-compat-libs')
optdepends=(
    'hicolor-icon-theme: required by desktop shortcuts'
    'gtk2: required by vpnui'
    'glib2: required by vpnui'
    'gtk3: required by acwebhelper'
)
conflicts=('cisco-anyconnect')
license=('custom')
options=('!strip')
# you will have to obtain the installer yourself - it's not available publicly
_filename="anyconnect-linux64-${pkgver}-k9.tar.gz"
source=("local://${_filename}" "vpnagentd.service" "anyconnect.sh" "anyconnect.csh" "AnyConnectLocalPolicy.xml")
package() {
    cd "${srcdir}"
    cd "anyconnect-linux64-4.7.00136/vpn"
    # install binaries
    for binary in "vpnagentd" "vpn" "vpndownloader" "vpndownloader-cli" "manifesttool" "acinstallhelper" "vpnui" "acwebhelper"; do
        install -Dm755 ${binary} "${pkgdir}/opt/cisco/anyconnect/bin/${binary}"
    done

    # install libs
    for lib in "libvpnagentutilities.so" "libvpncommon.so" "libvpncommoncrypt.so" \
        "libvpnapi.so" "libacruntime.so" "libacciscossl.so" "libacciscocrypto.so" \
        "libboost_date_time.so" "libboost_filesystem.so" "libboost_system.so" \
        "libboost_thread.so" "libboost_signals.so" "libboost_chrono.so" \
        "libaccurl.so.4.5.0"; do
        install -Dm755 ${lib} "${pkgdir}/opt/cisco/anyconnect/lib/${lib}"
    done

    # the installer copies all the other symlinks, but creates this one
    # for some reason so let's just create it ourselves
    ln -s /opt/cisco/anyconnect/lib/libaccurl.so.4.5.0 "${pkgdir}/opt/cisco/anyconnect/lib/libaccurl.so.4"

    # install plugins
    # we intentionally don't install the telemetry plugin here
    # because it tries to write to /opt and we don't want that
    for plugin in "libvpnipsec.so" "libacfeedback.so"; do
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

    # no, Cisco, you don't get to have your own menu category
    echo "Categories=Network" >> cisco-anyconnect.desktop
    install -Dm644 cisco-anyconnect.desktop "${pkgdir}/usr/share/applications/cisco-anyconnect.desktop"

    # install license
    for license in "license.txt" "OpenSource.html"; do
        install -Dm644 ${license} "${pkgdir}/usr/share/licenses/${pkgname}/${license}"
    done

    # install systemd unit for vpnagentd
    install -Dm644 "${srcdir}/vpnagentd.service" "${pkgdir}/usr/lib/systemd/system/vpnagentd.service"

    # install profile files - this makes sure we have all the tools in $PATH
    for profile in "anyconnect.sh" "anyconnect.csh"; do
        install -Dm644 "${srcdir}/${profile}" "${pkgdir}/etc/profile.d/${profile}"
    done

    # install CA certificates
    # Cisco ships their own copy of the VeriSign root, but we already have that in the system store
    # so don't install that and just symlink our system bundle
    mkdir -p "${pkgdir}/opt/.cisco/certificates/ca"
    ln -s /etc/ca-certificates/extracted/tls-ca-bundle.pem "${pkgdir}/opt/.cisco/certificates/ca/system-ca.pem"

    # install custom policy to disable auto updates
    # AnyConnect will attempt to update itself as root, and then run all over both itself and our packaging
    # so prevent it from doing anything like that
    #
    # this may break some really quirky setups that require downloading files from the server,
    # but there's no other way around it that I could find
    install -Dm644 "${srcdir}/AnyConnectLocalPolicy.xml" "${pkgdir}/opt/cisco/anyconnect/AnyConnectLocalPolicy.xml"

}
md5sums=('6427cc695ed556b2ef8d8f247f658e43'
         '8654e46106048d5e32a4695bac98cd05'
         '52b8acbee4eb3892e6f88d50e55feb99'
         '70b4e3b0b7be2b7c637fc03dd14b7a49'
         '0880528d636c98e626dcc96ae0841f6a')
