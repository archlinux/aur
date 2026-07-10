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
pkgver=6.7
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
        sha256sums=('63d116db98768bf8cc451dd63e0f227779f6a34de928f9f918413ffa4921743b')
        ;;
    x86_64)
        _arch="amd64"
        sha256sums=('aeabf41bcf0aef690a198f95d5acb204b3c1f0dff46b9ebbc7777f48466ec560')
        ;;
    arm|armv6h)
        _arch="armv6"
        sha256sums=('e766bf7fa9ae050c2d06696ee2b169e265ace322baeb912030358d41cceb3b6f')
        ;;
    armv7h)
        _arch="armv7"
        sha256sums=('805050a6e941cf781ec6885fc2c4235b6c43a43f1f25cc65125b95ddae241cdb')
        ;;
    aarch64)
        _arch="arm64"
        sha256sums=('69d590237fe44a78ca78690fef96dd71bb6e5a61812d7cc29d7a72c7c02acf48')
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
