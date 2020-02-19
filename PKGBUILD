# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
# Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=expressvpn
pkgver=2.4.3.100_1
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

sha512sums=('186d66b43fc2f5af479a0461540f6e5511f9e9ea05a8b792888ab749b0b18e93cbb2e45e04d7f6e5891a81cd07d113db323dd42b01b37afd1a37f0f7248c2745')
sha512sums_x86_64=('ca0bc5bc14ac9d5b533c117b420b8f7b01ea82729e6c8e6cfb8b35671aa3fb266fd6c19bdebf7a12ff138193df084dd9c17db40ec24896a714484cfb05d69194'
                   'SKIP')
sha512sums_i686=('61fc828a8228f513a7edebbb9738c31266fbaafaa797985aa157e69d22f0a6b227027972dcc21a6a14b5e32dd1e4020b96f374bf7fe0e17f20ddd5b076f3f6b1'
                 'SKIP')
sha512sums_armv7h=('a372c1aea613b7b3360d0e906dc819f769639ee0295a58216eda6e8dec703f70132e4ab5091872b40c1135b527c9070b73a1a45ee4ee5de4de435f32e2563e69'
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
