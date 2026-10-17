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
pkgver=6.8
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
        sha256sums=('555f3f5509a38b2be1cb8f5e2eb53ba1326e6aa181b4103bdedb9a78a5c449d6')
        ;;
    x86_64)
        _arch="amd64"
        sha256sums=('1f511e7053a5ddfae1db1f439ebb986dd8025bf7223e1f70fb8087d9c0fd2b0e')
        ;;
    arm|armv6h)
        _arch="armv6"
        sha256sums=('84fddcea66adebc09fe7c65e42f75aedc2f9c61b2089139193d21a670de00bae')
        ;;
    armv7h)
        _arch="armv7"
        sha256sums=('7c4b59b1f62554dbf3e992013959224a52c4ae69ee8f29708ce756cea051a88f')
        ;;
    aarch64)
        _arch="arm64"
        sha256sums=('e728cbcffa43b23e3b06fc10faa2fb0a22399d5931fc9881e4007491ee978e6f')
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
