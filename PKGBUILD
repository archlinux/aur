# Maintainer: Konstantin Gribov <grossws@gmail.com>

pkgname=cfssl
pkgver=1.3.2
pkgrel=1
pkgdesc="CloudFlare PKI and TLS toolkit"
arch=('i686' 'x86_64')
url="https://cfssl.org/"
license=('BSD')
depends=('glibc')
makedepends=('go')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cloudflare/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('69ddddb25beebe65e6fe316b9ab3472eae1cd21b2f377447ddc104624233e419')

_prefix=github.com/cloudflare/${pkgname}
_binaries=(cfssl cfssljson cfssl-bundle cfssl-certinfo cfssl-newkey cfssl-scan mkbundle multirootca)

prepare () {
  export GOPATH="${srcdir}"
  export PATH="$GOPATH/bin:$PATH"
  mkdir -p src/github.com/cloudflare/
  rm -rf src/${_prefix}
  mv "${pkgname}-${pkgver}" src/${_prefix}
}

build() {
  for bin in ${_binaries[@]} ; do
    echo "building $bin"
    go install ${_prefix}/cmd/${bin}
  done
}

package() {
  for bin in ${_binaries[@]} ; do
    install -m755 -D -t "${pkgdir}/usr/bin/" ${srcdir}/bin/${bin}
  done

  install -m644 -D ${srcdir}/src/${_prefix}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: et: sw=2: sts=2:
