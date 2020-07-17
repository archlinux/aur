_pkgname=jitsi-videobridge
pkgname=${_pkgname}-bin
epoch=1
pkgver=2.1+202+g5f9377b9
pkgrel=2
_debname=${_pkgname}2
_debrel=1
pkgdesc="WebRTC compatible Selective Forwarding Unit (SFU)"
arch=('any')
url="https://jitsi.org/jitsi-videobridge/"
license=('Apache')
depends=('java-runtime-headless')
conflicts=(${_pkgname})
provides=(${_pkgname})
makedepends=('tar')
options=('!strip')
backup=('etc/jitsi/videobridge/config'
        'etc/jitsi/videobridge/sip-communicator.properties'
        'etc/jitsi/videobridge/callstats-java-sdk.properties'
        'etc/jitsi/videobridge/log4j2.xml'
        'etc/jitsi/videobridge/logging.properties')

source=("https://download.jitsi.org/stable/${_debname}_${pkgver//+/-}-${_debrel}_all.deb"
        "${_pkgname}.service"
        'sysusers.conf'
        'tmpfiles.conf'
        'config'
        'sip-communicator.properties')
sha256sums=('0afce2a9c591e72a69c28665f8bf48d5e9d3a4e253e6be8737b1913f4d25b29b'
            'a23bfd94bcf0a2ffbb9b4939ba09ce80979bd41a7d91ec3d702392e2e648a886'
            '5b47b031d7a1dec536d3fc53e71d971b1052ea2e78e1060b404a792211363515'
            '885923de1718b757826596aaec8e58025ae40ed622bad4b5f43b12ab975c86a2'
            '46f686cd8ea6bb5f1ec6055d2f16cc72db4baf9d90dea234d10e661b50924624'
            'cc9fbf77497bce3c9673b2d144928f11cdd0c0823940c2b60c8369a2f086b9b7')

package() {
  cd "${srcdir}"
  tar -xJvf data.tar.xz -C "${pkgdir}"

  install -d "${pkgdir}/usr/lib"
  rm -r "${pkgdir}/etc/init.d"
  rm -r "${pkgdir}/etc/logrotate.d"
  mv "${pkgdir}/etc/sysctl.d" "${pkgdir}/usr/lib/sysctl.d"
  rm -r "${pkgdir}/lib"
  rm -r "${pkgdir}/usr/share/doc"
  chmod 0750 "${pkgdir}/etc/jitsi/videobridge"

  sed -i "s@/var/log/jitsi@/var/log/jitsi-videobridge@" "${pkgdir}/etc/jitsi/videobridge/log4j2.xml"

  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 'sysusers.conf' "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 'tmpfiles.conf' "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -Dm644 'config' "${pkgdir}/etc/jitsi/videobridge/config"
  install -Dm644 'sip-communicator.properties' "${pkgdir}/etc/jitsi/videobridge/sip-communicator.properties"
}

# vim: set ts=2 sw=2 et:
