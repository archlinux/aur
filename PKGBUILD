# Maintainer: Konstantin Gribov <grossws@gmail.com>

pkgname=cfssl
pkgver=1.5.0
pkgrel=2
pkgdesc="CloudFlare PKI and TLS toolkit"
arch=('i686' 'x86_64')
url="https://cfssl.org/"
license=('BSD')
depends=('glibc')
makedepends=('go')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cloudflare/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5267164b18aa99a844e05adceaf4f62d1b96dcd326a9132098d65c515c180a91')

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
