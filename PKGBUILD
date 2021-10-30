# Maintainer: 8vn5acnmf5
pkgname=perfect-privacy-vpn
pkgver=1.3.17
pkgrel=1
pkgdesc='Perfect Privacy VPN'
arch=('x86_64')
license=('custom')
url='https://www.perfect-privacy.com'
depends=('openvpn' 'python-requests' 'python-blinker' 'python-gobject' 'polkit' 'gtk3' 'pango' 'glib2' 'gdk-pixbuf2' 'libappindicator-gtk3' 'resolvconf')
optdepends=('openvpn-update-systemd-resolved')

source=('https://www.perfect-privacy.com/downloads/perfect-privacy-vpn.deb'
        'city_dns.patch'
        'tree.patch'
        )
sha256sums=('9eccf94ad15d4d1c82fa6c1156ca0343e6c29db97f964fd1dbc7865ef687c6b8'
            '2bd9aba04477f32a9ccd13e2979231dee33ac9c7d3589eb1332af1511349804c'
            '867d266f1ad84571ffe5ef08eac986869058e5daf17b01ec063ca659594f853d'
            )

package() {
    tar -xf data.tar.xz -C "${pkgdir}"
   
    # not needed
    rm -rf "${pkgdir}/etc"
   
    # fix polkit policy
    sed -i '15s/no/auth_admin/' ${pkgdir}/usr/share/polkit-1/actions/com.perfect-privacy.perfect-privacy-vpn.policy
    sed -i '16s/no/auth_admin/' ${pkgdir}/usr/share/polkit-1/actions/com.perfect-privacy.perfect-privacy-vpn.policy

    # https://board.perfect-privacy.com/threads/tutorial-ip-dns-country-city-anzeige-im-vpn-manager.3404/
    patch ${pkgdir}/opt/perfect_privacy/perfect-privacy-vpn/perfect_privacy_vpn/PerfectPrivacyVpnWindow.py ${srcdir}/city_dns.patch 
    # https://board.perfect-privacy.com/threads/vpn-manager-crashed-unter-ubuntu-hirsute.4780/#post-33118
    patch ${pkgdir}/opt/perfect_privacy/perfect-privacy-vpn/perfect_privacy_vpn_lib/Builder.py ${srcdir}/tree.patch
}
