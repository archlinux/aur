_pkgname=jicofo
pkgname=${_pkgname}-bin
pkgver=1.0.508
pkgrel=1
_debver=1.0-508-1
pkgdesc="JItsi Meet COnference FOcus"
arch=('x86_64')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=('java-runtime-headless')
conflicts=(${_pkgname})
provides=(${_pkgname})
makedepends=('tar')
options=('!strip')
backup=('etc/jitsi/jicofo/config'
        'etc/jitsi/jicofo/sip-communicator.properties'
        'etc/jitsi/jicofo/logging.properties')

source=("https://download.jitsi.org/stable/${_pkgname}_${_debver}_amd64.deb"
        "${_pkgname}.service"
        'sysusers.conf'
        'tmpfiles.conf'
        'config')
sha256sums=('b521cc10e405c7a68b0d42147c27151a46e02f76ff85445e7f1e5d3482921c9b'
            'c814d2bf3ea08fd9f64aae8f8821a63a156301e4d902f9a098c01f0f32675f8b'
            '0681e97ca1e06d8ea7bdec0a874c6fc7a6ea84628923005130cd444547a1b440'
            '1d19c303780f4640bc0cae6f40d8203b119bb81b74f50d61dbe72c548fa37372'
            'b36f987ce17388260fd6f6bcfb8372bf1aa1458959a996a44d073182414ba298')

package() {
  cd "${srcdir}"
  tar -xJvf data.tar.xz -C "${pkgdir}"

  rm -r "${pkgdir}/etc/init.d"
  rm -r "${pkgdir}/etc/logrotate.d"
  rm -r "${pkgdir}/usr/share/doc"

  sed -i 's/-Xmx[^ ]*//' "${pkgdir}/usr/share/jicofo/jicofo.sh"

  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 'sysusers.conf' "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 'tmpfiles.conf' "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -Dm644 'config' "${pkgdir}/etc/jitsi/jicofo/config"
  touch "${pkgdir}/etc/jitsi/jicofo/sip-communicator.properties"
}

# vim: set ts=2 sw=2 et:
