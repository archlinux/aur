# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=lokinet-bin
_pkgname=lokinet
pkgver=0.8.3
pkgrel=2
pkgdesc='Anonymous, decentralized and IP based overlay network for the internet. [LOKI, OXEN]'
url='https://github.com/oxen-io/loki-network'
arch=('x86_64')
license=('GPL3')
conflicts=('lokinet')
source=("${_pkgname}-$pkgver.tar.xz::$url/releases/download/v$pkgver/${_pkgname}-linux-amd64-v$pkgver.tar.xz"
        'lokinet.service'
        'lokinet.lokinet-vpn.service')
sha256sums=('8e82f8ac69f808e49b766a7bf5a04b82e1576f9c867a371de7dadfcb846447bd'
            '2ee72a42cc4a9f2424b067d24aff81a67b9b8d2b6ac6cd63b926d9966cd8cc61'
            'bef98a1844074dc1560fe231036adcb1e38a14e4690714969bc0675b08e70f07')

build() {
  tar -xf ${_pkgname}-$pkgver.tar.xz
}

package() {
  # install systemd files
  install -Dm644 ${_pkgname}.service "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 ${_pkgname}.${_pkgname}-vpn.service "${pkgdir}/usr/lib/systemd/system/${_pkgname}.${_pkgname}-vpn.service"

  # create the necessary directory structure
  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"

  # install binaries on system
  cd ${_pkgname}-linux-amd64-v$pkgver
  install -m 755 lokinet "${pkgdir}/opt/${_pkgname}"
  install -m 755 lokinet-bootstrap "${pkgdir}/opt/${_pkgname}"
  install -m 755 lokinet-vpn "${pkgdir}/opt/${_pkgname}"

  # links scripts to /usr/bin
  ln -s /opt/${_pkgname}/lokinet "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/lokinet-bootstrap "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/lokinet-vpn "${pkgdir}/usr/bin"
}
