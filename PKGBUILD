# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
# Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=expressvpn
pkgver=1.5.1
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
source_x86_64=("${_url}/${pkgname}_${pkgver}_amd64.deb"{,.asc})
source_i686=("${_url}/${pkgname}_${pkgver}_i386.deb"{,.asc})
source_armv7h=("${_url}/${pkgname}_${pkgver}_armhf.deb"{,.asc})

sha512sums=('SKIP')
sha512sums_x86_64=('bb5da0871c258c281a7b8962170b88382f461b41f9f4208862ddf0ff4f51f62b4b4c064aa2f7ea0fca3d08e58277d03d8cb16a8923a67d0cc73fc2c258646e13'
                   'SKIP')
sha512sums_i686=('7c80092417a430b27177e17a7da447c8886a6b264d58f0465f786d06cc816960d1f1b3c3dbd615f1d770c9e319c275f3ec2248772cd1d63e779eee4d49a9823f'
                 'SKIP')
sha512sums_armv7h=('76a4e3c1ac54a94d12881c9c967be427bc36161e69968f7d0c82491e0e1e71456c459f49015a669eb3c47f5c4814224e4124e6ea32e254bdf6c761854d8d38d8'
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
