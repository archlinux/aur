# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=moldova
pkgver=2.0.1
pkgrel=1
pkgdesc="A lightweight templating system for generating random data"
arch=('x86_64')
url='https://github.com/StabbyCutyou/moldova'
license=('Apache')
depends=('glibc')
makedepends=('dep' 'go-pie')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('099f417c638164386760d612426d13329b657531b3d4c9b3dab7f24381e35ebc')

prepare() {
  mkdir -p gopath/src/github.com/${pkgname}
  ln -rTsf ${pkgname}-${pkgver} gopath/src/github.com/${pkgname}/${pkgname}
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/${pkgname}/${pkgname}
  if [[ ! -f Gopkg.toml ]]; then
    dep init -v
  fi
  dep ensure -v
}

build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/${pkgname}/${pkgname}/cmd/moldova
  go install -v .
}

package() {
  install -Dm755 "${srcdir}/gopath/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}