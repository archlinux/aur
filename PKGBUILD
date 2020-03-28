_pkgname=jitsi-meet
pkgname=${_pkgname}-bin
pkgver=1.0.3928
pkgrel=2
_debrel=1
pkgdesc="WebRTC JavaScript video conferences"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=()
optdepends=('jicofo'
            'jitsi-videobridge'
            'nginx'
            'prosody')
conflicts=(${_pkgname})
provides=(${_pkgname})
makedepends=('binutils' 'tar')
options=('!strip')
backup=('etc/jitsi/meet/config.js'
        'etc/jitsi/meet/interface_config.js'
        'etc/jitsi/meet/logging_config.js')

source=("https://download.jitsi.org/stable/${_pkgname}-web_${pkgver}-${_debrel}_all.deb"
        "https://download.jitsi.org/stable/${_pkgname}-web-config_${pkgver}-${_debrel}_all.deb")
noextract=("${_pkgname}-web-config_${pkgver}-${_debrel}_all.deb")
sha256sums=('16cf48d87aadb08c1e7da466b8c7e52c60dfa6b467cdf9c016351125133ef568'
            '1b413111cecb30e8bfb9e59173670714e4cece14f2db7e1c64b0175a4e608ad1')

prepare() {
  mkdir config
  ar p "${_pkgname}-web-config_${pkgver}-${_debrel}_all.deb" data.tar.xz | tar -xJvC config
}

package() {
  cd "${srcdir}"
  tar -xJvf data.tar.xz -C "${pkgdir}"

  rm -r "${pkgdir}/usr/share/doc"

  install -d "${pkgdir}/etc/jitsi/meet"
  install -Dm644 'config/usr/share/jitsi-meet-web-config/config.js' "${pkgdir}/etc/jitsi/meet/config.js"
  mv "${pkgdir}/usr/share/jitsi-meet/interface_config.js" "${pkgdir}/etc/jitsi/meet/interface_config.js"
  mv "${pkgdir}/usr/share/jitsi-meet/logging_config.js" "${pkgdir}/etc/jitsi/meet/logging_config.js"
  ln -s '/etc/jitsi/meet/config.js' "${pkgdir}/usr/share/jitsi-meet/config.js"
  ln -s '/etc/jitsi/meet/interface_config.js' "${pkgdir}/usr/share/jitsi-meet/interface_config.js"
  ln -s '/etc/jitsi/meet/logging_config.js' "${pkgdir}/usr/share/jitsi-meet/logging_config.js"

  install -Dm644 'config/usr/share/jitsi-meet-web-config/jitsi-meet.example' "${pkgdir}/usr/share/doc/jitsi-meet/nginx.conf.example"
  install -Dm644 'config/usr/share/jitsi-meet-web-config/jitsi-meet.example-apache' "${pkgdir}/usr/share/doc/jitsi-meet/apache.conf.example"
}

# vim: set ts=2 sw=2 et:
