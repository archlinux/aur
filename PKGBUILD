# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
# Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=expressvpn
pkgver=1.3.1
pkgrel=1
pkgdesc="Proprietary VPN client for Linux"
arch=('x86_64' 'i686')
url="https://expressvpn.com"
license=('custom')
# net-tools is needed for old skool ifconfig
depends=('net-tools')
_date=$(date +%Y%m%d)
options=(!strip)
install=expressvpn.install
source=("license-${_date}.html::https://www.expressvpn.com/vpn-software/vpn-linux/open-source")
_url="https://download.expressvpn.xyz/clients/linux"
source_x86_64=("${_url}/${pkgname}_${pkgver}_amd64.deb"{,.asc})
source_i686=("${_url}/${pkgname}_${pkgver}_i386.deb"{,.asc})

sha512sums=('SKIP')
sha512sums_x86_64=('ce925e6048653b3fdde97ae0718b6b12f374fe75d7c3d702f807f60c9df2df2ff1c0a73c4e67b1d0a57fb3f123f962a9fd0621fe14a03fa154391e819d988088'
                   'SKIP')
sha512sums_i686=('a6285ce7fa72d684e34ed9d7d7e1a06b69ae37a4c240538e9589ff8c0fdcd5f4641f34343acd1ec599da00c1032a62d839cebd4aea312540ca6709c9b34fe81a'
                 'SKIP')
validpgpkeys=('1D0B09AD6C93FEE93FDDBD9DAFF2A1415F6A3A38')

package() {
    # /usr/sbin is a symlink to /usr/bin, rewrite it
    bsdtar -C "${pkgdir}" -xf "${srcdir}/data.tar.gz" -s ":/usr/sbin:/usr/bin:"

    # Install service file to correct place
    install -Dm644 "${pkgdir}/usr/lib/expressvpn/expressvpn.service" "${pkgdir}/usr/lib/systemd/system/expressvpn.service"
    # Fix service file
    sed -i -e 's:RestartSe=:RestartSec=:' -e '/EnvironmentFile/d' "${pkgdir}/usr/lib/systemd/system/expressvpn.service"

    # Install bash-completion to correct place
    install -Dm644 "${pkgdir}/usr/lib/expressvpn/bash-completion" "${pkgdir}/usr/share/bash-completion/completions/expressvpn"
    
    install -Dm644 "${srcdir}/license-${_date}.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
    install -dm755 "$pkgdir/var/lib/expressvpn/certs"

    # Remove unused /etc
    rm -r "$pkgdir/etc/"

    # Remove sysv script
    rm "$pkgdir/usr/lib/expressvpn/expressvpn.init"
}
