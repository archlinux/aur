# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
# Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=expressvpn
pkgver=1.5.0
pkgrel=1
pkgdesc="Proprietary VPN client for Linux"
arch=('x86_64' 'i686' 'armv7h')
url="https://expressvpn.com"
license=('custom')
makedepends=('chrpath') # Needed to strip out insecure RPATH
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
sha512sums_x86_64=('7308449f383f9a0938bda5a21e541422502f336aef636205a27499bf2d328dd33ee9528e2b3ab86865cf81e573bb4ab37e1691915b9da39e183c1b5f5946fdff'
                   'SKIP')
sha512sums_i686=('bfe9e84e98e716ff458afbcfb02f129ee939cccef2aa30c0d8cd59cd1ee684a74be15cb5f0c7cdf68449c4c774ff107a9adeb5d9b01e46db4b20cc0d344780d7'
                 'SKIP')
sha512sums_armv7h=('baa500fcf069f907dfee4f4ddaba0758a59bb1989c7c51973bfd8f81314b0e4a532f52176cad8735ecdc2cbc7388fbffd4d82e20637893d8c9891fc0403d1b24'
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

    # Remove insecure RPATH (1.4.5 and upwards have /tmp/engine-linux/<numbers>/src/github.com/xvpn/xv_engine/xvclient/linux/${ARCH}/lib included for some reason
    NEWRPATH=$(chrpath -l "${pkgdir}/usr/bin/expressvpnd" | sed -e 's|.*expressvpnd: RPATH=||' -e 's|:/tmp/engine-linux/[^/]*/src/github.com/xvpn/xv_engine/xvclient/linux/[^/]*/lib||')
    chrpath -r "$NEWRPATH" "${pkgdir}/usr/bin/expressvpnd"
}
