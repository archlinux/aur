_pkgname=jitsi-videobridge
pkgname=${_pkgname}-bin
epoch=1
pkgver=2.1+183+gdbddd169
pkgrel=1
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
sha256sums=('c2dd14437e4e655818bc1c3890b75384e5980042e8475a1142540afc04555ada'
            '33a8329b2b886246dee8cca07b93e1c8977191170256ea65889d7a63937c06a9'
            '5b47b031d7a1dec536d3fc53e71d971b1052ea2e78e1060b404a792211363515'
            '885923de1718b757826596aaec8e58025ae40ed622bad4b5f43b12ab975c86a2'
            '4d458fdac2f1a5ff761d6239076e7cfafe4812a3d4a12e754b48c828f46a1f44'
            'be0a457c27ba99c514bbad4f2ce3494589eb242987f42246f2fe2df636538790')

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
