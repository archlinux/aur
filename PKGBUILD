# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
# Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=expressvpn
pkgver=1.1.0
pkgrel=1
pkgdesc="Proprietary VPN client for Linux"
arch=('x86_64' 'i686')
url="https://expressvpn.com"
license=('custom')
# net-tools is needed for old skool ifconfig
depends=('net-tools')
_date=$(date +%Y%m%d)
install=expressvpn.install
source=("expressvpnd.service"
        "license-${_date}.html::https://www.expressvpn.com/vpn-software/vpn-linux/open-source")
_url="https://download.expressvpn.xyz/clients/linux"
source_x86_64=("${_url}/${pkgname}_${pkgver}_amd64.deb"{,.asc})
source_i686=("${_url}/${pkgname}_${pkgver}_i386.deb"{,.asc})

sha512sums=('95fa06939cd318962d11076443c0f3fe46f73509fcd09ad39513a8f3ea6d010c9c9607ec38506f1503efde70519a2aa9aed3d201b7c3b37c4324c68fc91a2073'
            'SKIP')
sha512sums_x86_64=('4d9ca887e39297a8f50d0b08ee90fc264600514f539162c54c7f56e4389fca8b0d3d971b6e47f9ac5e422bcd2a26a002c0283bee9deb63e22d0828d765edc56a'
                   'SKIP')
sha512sums_i686=('9f782a4ec6db8a7950325e36c3b083dbc8db39d8b5bd5a1444a6f936905f3867e489ffb2b6d9899eface4074c97d0853977aaed8d674090982f15a3e63515d9c'
                 'SKIP')
validpgpkeys=('1D0B09AD6C93FEE93FDDBD9DAFF2A1415F6A3A38')

package() {
    # /usr/sbin is a symlink to /usr/bin, rewrite it
    bsdtar -C "${pkgdir}" -xf "${srcdir}/data.tar.gz" -s ":/usr/sbin:/usr/bin:"

    rm -rf "${pkgdir}/etc/init.d"
    install -Dm644 "${srcdir}/expressvpnd.service" "${pkgdir}/usr/lib/systemd/system/expressvpnd.service"

    install -Dm644 "${srcdir}/license-${_date}.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
    install -dm755 "$pkgdir/var/lib/expressvpn/certs"
}
