# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
# Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=expressvpn
pkgver=1.2.0
pkgrel=1
pkgdesc="Proprietary VPN client for Linux"
arch=('x86_64' 'i686')
url="https://expressvpn.com"
license=('custom')
# net-tools is needed for old skool ifconfig
depends=('net-tools')
_date=$(date +%Y%m%d)
install=expressvpn.install
source=("license-${_date}.html::https://www.expressvpn.com/vpn-software/vpn-linux/open-source")
_url="https://download.expressvpn.xyz/clients/linux"
source_x86_64=("${_url}/${pkgname}_${pkgver}_amd64.deb"{,.asc})
source_i686=("${_url}/${pkgname}_${pkgver}_i386.deb"{,.asc})

sha512sums=('SKIP')
sha512sums_x86_64=('a72a674bb94e92351d8a7790ea83d929c77173c753f9f5dda50da5f0f4fdded8e50f53488c16eca2c82e8efd65d90585a804a85298255417a37c293e0e9d4421'
                   'SKIP')
sha512sums_i686=('e3b29dcf085a39cc17de6589f705a5b90feaacfd0806350b91fbab6a32e2d82b1987d2bbd112ee81e1e29bb3abb922baa1eae5f4286b20f95bea366581046303'
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
    
    # Remove superfluous expressvpn lib dir
    rm -r "${pkgdir}/usr/lib/expressvpn"

    install -Dm644 "${srcdir}/license-${_date}.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
    install -dm755 "$pkgdir/var/lib/expressvpn/certs"

    # Remove emptydir in /etc
    rmdir "$pkgdir/etc/default"
}
