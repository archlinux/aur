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
pkgver=6.9
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
        sha256sums=('b3fbf7fae9e509eb0898cc5d9bda63d41088e6872961f0c8fef3d4624293dc4e')
        ;;
    x86_64)
        _arch="amd64"
        sha256sums=('8203d625fa1ee889710471b8f9b8a991fd6dddb4ca6a923d1ff43db47660865d')
        ;;
    arm|armv6h)
        _arch="armv6"
        sha256sums=('b8186ed3313a7254725fbf7f5a447e7330fbd4b10fd0406c0f222111374d5e26')
        ;;
    armv7h)
        _arch="armv7"
        sha256sums=('6ff75967819653e83118d2cb8d162d75a0869fe6f876c9d53cf0be941395ab1d')
        ;;
    aarch64)
        _arch="arm64"
        sha256sums=('00c1d51bca1f9539af7cada95532cdabf9755a42fd8e41802c75e5758a8daa60')
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
             '4ed1d47094a0cb7e90aa06a2b9214ee8a511674b322525682cf2679c81b93169')

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
