_pkgname=jitsi-videobridge
pkgname=${_pkgname}-bin
pkgver=1126
pkgrel=1
_debrel=1
pkgdesc="WebRTC compatible Selective Forwarding Unit (SFU)"
arch=('x86_64')
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

source=("https://download.jitsi.org/stable/${_pkgname}_${pkgver}-${_debrel}_amd64.deb"
        "${_pkgname}.service"
        'sysusers.conf'
        'tmpfiles.conf'
        'config'
        'sip-communicator.properties')
sha256sums=('19fa3f9a3d8989b5619c5c69ad5ac60f7390881733670547bfa638f29add495b'
            '076a945d5b188e2800d8f0d7f3024de1bf272710026fd48c9f2bbd6c39199c23'
            '5b47b031d7a1dec536d3fc53e71d971b1052ea2e78e1060b404a792211363515'
            '885923de1718b757826596aaec8e58025ae40ed622bad4b5f43b12ab975c86a2'
            '0ede8fcca8600afa2195fdc839639735cb9ab2fd4ae6ee9b03d22d1ba129b8f7'
            '8b16b8ef0745677421123812c8d015924dfdec4fd48dcc17842dfc3d2bfe68b2')

package() {
  cd "${srcdir}"
  tar -xJvf data.tar.xz -C "${pkgdir}"

  install -d "${pkgdir}/usr/lib"
  rm -r "${pkgdir}/etc/init.d"
  rm -r "${pkgdir}/etc/logrotate.d"
  mv "${pkgdir}/etc/sysctl.d" "${pkgdir}/usr/lib/sysctl.d"
  rm -r "${pkgdir}/lib"
  rm -r "${pkgdir}/usr/share/doc"

  sed -i "s@/var/log/jitsi@/var/log/jitsi-videobridge@" "${pkgdir}/etc/jitsi/videobridge/log4j2.xml"

  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 'sysusers.conf' "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 'tmpfiles.conf' "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -Dm644 'config' "${pkgdir}/etc/jitsi/videobridge/config"
  install -Dm644 'sip-communicator.properties' "${pkgdir}/etc/jitsi/videobridge/sip-communicator.properties"
}

# vim: set ts=2 sw=2 et:
