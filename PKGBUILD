# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
# Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=expressvpn
pkgver=3.5.0.33_1
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

sha512sums_x86_64=('6d04a400faf763a70a9425e89291748149d82d066a5e9ff8dcf55064c6fe0abf31962c488d67d88dd6def24deab514cb6bafc225a54b5940284abd09335df816'
                   'SKIP')
sha512sums_i686=('b832c9261e1b37e4326500dbde89b53ad47db991b0f4413d800c30f9e8dd776d23023c3a2bcbbb23e5eb389fc3e1889777e92244e43b7dfcb8ae6616af99f8ce'
                 'SKIP')
sha512sums_armv7h=('0f17b7b98c3fc9b0392c1f3cb0a920b3803feaf0ad18bf225b638bbabe95214b4a09a2c2a6282afe54aa9d1f548a9d14153e28c771f97dcb1dbb9bcc4633692c'
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
