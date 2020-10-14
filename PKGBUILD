# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
# Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=expressvpn
pkgver=3.1.0.34_1
pkgrel=1
pkgdesc="Proprietary VPN client for Linux"
arch=('x86_64' 'i686' 'armv7h')
url="https://expressvpn.com"
license=('custom')
# net-tools is needed for old skool ifconfig
depends=('net-tools')
_date=$(date +%Y%m%d)
options=(!strip)
install=expressvpn.install
source=("license-${_date}.html::https://www.expressvpn.com/vpn-software/vpn-linux/open-source")
_url="https://download.expressvpn.xyz/clients/linux"
source_x86_64=("${_url}/${pkgname}_${pkgver/_/-}_amd64.deb"{,.asc})
source_i686=("${_url}/${pkgname}_${pkgver/_/-}_i386.deb"{,.asc})
source_armv7h=("${_url}/${pkgname}_${pkgver/_/-}_armhf.deb"{,.asc})

sha512sums=('SKIP')

sha512sums_x86_64=('0216ded58a93927968810e3b735011cd0d1caed0406258ffb09296fabe2c538b2f4ecc0edb51a4a7acb2bcb600e4e5ab734e19deafe18ea8a2e79afe32d80112'
                   'SKIP')
sha512sums_i686=('4abedede72043e98a1d63238bf088e69c170df4d449b98a6190bf245848617614522bb92df81f338a0f5af5d9f1732b6674f55a1a1776f63740fc12bb1bff3b5'
                 'SKIP')
sha512sums_armv7h=('d1b2f14c3e062f3d9af98b145c4985594831943ae4d62d26ad3cd809f8c42cded9f3c66c33e97ee140419aa0269bb94ab54a96543587a1a7ea2c901ecb20041a'
                   'SKIP')

validpgpkeys=('1D0B09AD6C93FEE93FDDBD9DAFF2A1415F6A3A38')

package() {
    # /usr/sbin is a symlink to /usr/bin, rewrite it
    bsdtar -C "${pkgdir}" -xf "${srcdir}/data.tar.gz" -s ":/usr/sbin:/usr/bin:"

    # Install service file to correct place
    install -Dm644 "${pkgdir}/usr/lib/expressvpn/expressvpn.service" "${pkgdir}/usr/lib/systemd/system/expressvpn.service"

    # Install bash-completion to correct place
    install -Dm644 "${pkgdir}/usr/lib/expressvpn/bash-completion" "${pkgdir}/usr/share/bash-completion/completions/expressvpn"
    
    install -Dm644 "${srcdir}/license-${_date}.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
    install -dm755 "$pkgdir/var/lib/expressvpn/certs"

    # Remove unused /etc
    rm -r "$pkgdir/etc/"

    # Remove sysv script
    rm "$pkgdir/usr/lib/expressvpn/expressvpn.init"
}
