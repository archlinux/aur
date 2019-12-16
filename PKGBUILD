# Maintainer: Konstantin Gribov <grossws@gmail.com>

pkgname=cfssl
pkgver=1.4.1
pkgrel=1
pkgdesc="CloudFlare PKI and TLS toolkit"
arch=('i686' 'x86_64')
url="https://cfssl.org/"
license=('BSD')
depends=('glibc')
makedepends=('go')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cloudflare/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c8a86ef10cbb0c168f3b597db15b31f98b170edb7958f7154edeb29aee41315e')

_prefix=github.com/cloudflare/${pkgname}

_binaries=(cfssl cfssljson cfssl-bundle cfssl-certinfo cfssl-newkey cfssl-scan mkbundle multirootca)

prepare () {
  export GOPATH="${srcdir}"
  export GOBIN="${GOPATH}/bin"
  export PATH="${GOBIN}:${PATH}"

  mkdir -p src/github.com/cloudflare/
  rm -rf src/${_prefix}
  mv "${pkgname}-${pkgver}" src/${_prefix}
}

build() {
  export GOPATH="${srcdir}"
  export GOBIN="${GOPATH}/bin"

  for bin in ${_binaries[@]} ; do
    echo "building $bin"
    go install ${_prefix}/cmd/${bin}
  done
}

package() {
  for bin in ${_binaries[@]} ; do
    install -m755 -D -t "${pkgdir}/usr/bin/" ${srcdir}/bin/${bin}
  done
  # special case to avoid clash with `mono`
  mv ${pkgdir}/usr/bin/mkbundle ${pkgdir}/usr/bin/cfssl-mkbundle

  install -m644 -D ${srcdir}/src/${_prefix}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: et: sw=2: sts=2:
