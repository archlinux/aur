# Contributor: Mettacrawer <metta.crawler@gmail.com>
# Contributor: luizribeiro <luizribeiro@gmail.com>
# Contributor:  max.bra <max dot bra dot gtalk at gmail dot com>
# Contributor:  graysky <therealgraysky AT protonmail DOT com>
# Maintainer: Fabian Brosda <f.brosda@gmx.de>
#
# This is more or less a copy of the pi-hole-ftl PKGBUILD, but uses the binary
# release instead of compiling it.

pkgname=pi-hole-ftl-bin
_pkgname=pi-hole-ftl
_servicename=pihole-FTL
pkgver=6.7.1
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc="The Pi-hole FTL engine"
url="https://github.com/pi-hole/FTL"
license=('EUPL-1.2')
depends=('nettle' 'gmp' 'mbedtls' 'pi-hole-web')
provides=('dnsmasq' "pi-hole-ftl=${pkgver}")
conflicts=('dnsmasq' 'pi-hole-ftl')
install="${_pkgname}.install"

case "$CARCH" in
    i686)
        _arch="386"
        sha256sums=('c381e437cc517ce1282b44231942b19ac3269f38a54e6d617ab242c644df4cc2')
        ;;
    x86_64)
        _arch="amd64"
        sha256sums=('1e560c28f9eb75cdcab80151d34fc5e167b0af4e41d04981d000f8ec290c0d31')
        ;;
    arm|armv6h)
        _arch="armv6"
        sha256sums=('bef3e21c38f7af6e44e9be7be85666fa435b71a408de8d8f82cc5707eb962c27')
        ;;
    armv7h)
        _arch="armv7"
        sha256sums=('2b4cd645493022c57088d54180f91257c8df03d58ee1bd4492aa86cea0e8ca6e')
        ;;
    aarch64)
        _arch="arm64"
        sha256sums=('07b25085f447c99281dd6c346b0c04ac0231afa12dd9fbac0517e81127a6b040')
        ;;
esac
source=("${pkgname}-${CARCH}-v${pkgver}"::"https://github.com/pi-hole/FTL/releases/download/v${pkgver}/pihole-FTL-${_arch}"
        "LICENSE::https://raw.githubusercontent.com/pi-hole/FTL/v${pkgver}/LICENSE"
        "$_pkgname.tmpfile"
        "$_pkgname.sysuser"
        "$_pkgname.service")
sha256sums+=('4c0aa7f0a331d0497122246c74d97fb3501b1d3c9aed05fcb1957650a33f13ca'
             '0feb4597a4afd9054553505d305b0feb7e1f6e1705b092561648ff37d0a2893c'
             'dd1d2a341e774d4e549373ae75604031b9af0ee44debcd71a89259d9110d2a77'
             '0998da040d038ddbad129ba8e1ea74741bc912813407b579cab1b3b3f206e721')

package() {
  cd "${srcdir}"
  install -Dm775 "${pkgname}-${CARCH}-v${pkgver}" "${pkgdir}/usr/bin/pihole-FTL"

  install -Dm644 "${_pkgname}.tmpfile" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -Dm644 "${_pkgname}.sysuser" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"

  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_servicename}.service"
  install -dm755 "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants"
  ln -s "../${_servicename}.service" "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants/${_servicename}.service"

  install -dm755 "${pkgdir}/usr/share/licenses/pihole"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/pihole/Pi-hole-FTL"

  # ver. 5.0+ dnamasq dropin support
  ln -s ./pihole-FTL "$pkgdir/usr/bin/dnsmasq"
}
