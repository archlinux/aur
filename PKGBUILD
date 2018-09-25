# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
# Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=expressvpn
pkgver=1.4.5
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
sha512sums_x86_64=('30a266e8f8d0ef75ca1a54ba16f9cefcf8504c7d48ec3c6baaf9a4785c6895b18728203d2cea25eaa6752c231e1b877c4f104b430cb2410e12c60773edbeb747'
                   'SKIP')
sha512sums_i686=('412a51933463f57760024fa0dc8da2df2096bc1eac6b931fead4945f33206f7d19e69984d0f86e1c2e73ed46c3a0182710721dfae8422684f2c4fe503d2f4aff'
                 'SKIP')
sha512sums_armv7h=('95e940854b2aea608e2c5ff01a749263c5a2df000e4afd3786f949694e98da35979318539c6939b743b8108339c62ac17f02595c57eef31c8b15e9307a76ee81'
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
    install -dm755 "${pkgdir}/usr/share/bash-completion/completions/expressvpn"
    mv "${pkgdir}/usr/lib/expressvpn/bash-completion" "${pkgdir}/usr/share/bash-completion/completions/expressvpn"
    
    install -Dm644 "${srcdir}/license-${_date}.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
    install -dm755 "$pkgdir/var/lib/expressvpn/certs"

    # Remove unused /etc
    rm -r "$pkgdir/etc/"

    # Remove sysv script
    rm "$pkgdir/usr/lib/expressvpn/expressvpn.init"

    # Remove insecure RPATH (1.4.5 has /tmp/engine-linux/1533806421/src/github.com/xvpn/xv_engine/xvclient/linux/${ARCH}/lib included for some reason
    NEWRPATH=$(chrpath -l "${pkgdir}/usr/bin/expressvpnd" | sed -e 's|.*expressvpnd: RPATH=||' -e 's|:/tmp/engine-linux/[^/]*/src/github.com/xvpn/xv_engine/xvclient/linux/[^/]*/lib||')
    chrpath -r "$NEWRPATH" "${pkgdir}/usr/bin/expressvpnd"
}
