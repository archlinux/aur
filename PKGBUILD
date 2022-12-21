# Maintainer: robertfoster

_pkgname=fabric
pkgname="hyperledger-${_pkgname}"
pkgver=2.4.7
pkgrel=1
pkgdesc="A platform for distributed ledger solutions, underpinned by a modular architecture delivering high degrees of confidentiality, resiliency, flexibility and scalability"
arch=(armv6h armv7h arm aarch64 i686 x86_64)
url="https://github.com/hyperledger/fabric"
license=('APACHE')
groups=('hyperledger')
depends=('go')
makedepends=('git' 'docker')
install="${pkgname}.install"
source=("${url}/archive/v$pkgver.tar.gz"
  "${_pkgname}-peer.conf"
  "${_pkgname}-peer.service"
  hyperledger.sysusers
  hyperledger.tmpfiles
)

prepare() {
  cd "${srcdir}"
  export GOPATH="${srcdir}/build"
  mkdir -p "${GOPATH}/src/${url#*://}"
  cp -r fabric-"$pkgver"/* \
    "${GOPATH}/src/${url#*://}"
}

build() {
  cd "${GOPATH}/src/${url#*://}"

  make release
}

package() {
  cd "${GOPATH}/src/${url#*://}"

  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md

  cp -r release/*/bin \
    "${pkgdir}/usr"
  install -dm 755 "${pkgdir}/etc/hyperledger/fabric/msp"
  install -dm 755 "${pkgdir}/etc/hyperledger/fabric/tls"
  cp -r sampleconfig/*.yaml \
    "${pkgdir}/etc/hyperledger/fabric"

  msg2 "Install systemd service"
  install -Dm644 "${srcdir}/${_pkgname}-peer.service" \
    "${pkgdir}/usr/lib/systemd/system/${_pkgname}-peer.service"
  install -D -m644 "${srcdir}/hyperledger.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/hyperledger.conf"
  install -D -m644 "${srcdir}/hyperledger.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/hyperledger.conf"

  msg2 "Install conf file"
  install -Dm644 "${srcdir}/${_pkgname}-peer.conf" \
    "${pkgdir}/usr/lib/environment.d/${_pkgname}-peer.conf"
}

sha256sums=('e5882e762a7524105545c8398abe6b7c2b9a5d6dc9a6a54dceaabf47d2940b19'
            'bfdfb0f96bea3f6c2cafb17224fd5b21ec664352ef347841803e2448ca05426f'
            'de85c5359019e44d5086d880cbcf6ab0b84e9bb456ed3e7302997f7e715eb908'
            '9b29b63afd556563de227841060a2c7653d289cc70458992ef54d0339a53de94'
            '729e4eba887b6b81d2d0bf40cb14db7163ada201657eef776017263d4a31dfdb')
