# Maintainer: Konstantin Gribov <grossws@gmail.com>

pkgname=cfssl
pkgver=1.6.1
pkgrel=1
pkgdesc="CloudFlare PKI and TLS toolkit"
arch=('i686' 'x86_64')
url="https://cfssl.org/"
license=('BSD')
depends=('glibc')
makedepends=('go')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cloudflare/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('00f5316e8f065a48eeb02b7359aa67699a5c1362b09c6e8faa19d8f35451c1d8')

_binaries=(cfssl cfssljson cfssl-bundle cfssl-certinfo cfssl-newkey cfssl-scan mkbundle multirootca)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make VERSION="${pkgver}-${pkgrel}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  for bin in ${_binaries[@]} ; do
    install -m755 -D -t "${pkgdir}/usr/bin/" bin/${bin}
  done

  # special case to avoid clash with `mono`
  mv ${pkgdir}/usr/bin/mkbundle ${pkgdir}/usr/bin/cfssl-mkbundle

  install -m644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: et: sw=2: sts=2:
