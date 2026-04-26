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
pkgver=6.6.1
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
        sha256sums=('10b0e9c92e32e14987d3147e491cfdea5fc1fcc679b4d7b2813b5e87db4b0e9e')
        ;;
    x86_64)
        _arch="amd64"
        sha256sums=('125ad49b45fd5308c9c7b063d98b2ea88570d3be2133b77ed7170b7af9832cd9')
        ;;
    arm|armv6h)
        _arch="armv6"
        sha256sums=('c8ea64c5520148f16f4d5bf0e07257829aa9e5d4d7916e0b943261f8239d5d27')
        ;;
    armv7h)
        _arch="armv7"
        sha256sums=('9eb70a64f2114f113e5950de38df2705305b35e52f2e4960476e906cc9077846')
        ;;
    aarch64)
        _arch="arm64"
        sha256sums=('3ae4aa979403807bdaed3a09565e50e9ee9be687e92d8e710c0de862d24bbab7')
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
