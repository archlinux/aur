# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
# Maintainer: Christoph Bayer <chrbayer@criby.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Fredy García <frealgagu at gmail dot com>

pkgname=mongodb-tools
pkgver=4.2.6
pkgrel=1
pkgdesc="The MongoDB tools provide import, export, and diagnostic capabilities."
arch=('x86_64')
url="https://github.com/mongodb/mongo-tools"
license=('Apache')
depends=('libpcap')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mongodb/mongo-tools/archive/r${pkgver}.tar.gz")
sha512sums=('e91bfba4b015f80d35b6c2ca766c599c5eedea113d6415ec0aef433d46b5e5fe06956481a063e26908a45fdcee4002125ea01a29fa3ea9a541a9210d25625f8e')

_tools=('bsondump' 'mongostat' 'mongofiles' 'mongoexport' 'mongoimport' 'mongorestore' 'mongodump' 'mongotop' 'mongoreplay')

prepare() {
  cd "${srcdir}"
  install -d build/src/github.com/mongodb/bin
  mv "mongo-tools-r${pkgver}" build/src/github.com/mongodb/mongo-tools
}

build() {
  cd "${srcdir}/build/src/github.com/mongodb/mongo-tools"
  GOROOT=/usr ./set_goenv.sh
  export GOPATH="$GOPATH:$srcdir/build"
  for tool in "${_tools[@]}"; do
    echo "Building ${tool}..."
    go build -o "bin/${tool}" -tags "ssl sasl" "${tool}/main/${tool}.go"
  done
}

package() {
  cd "${srcdir}/build/src/github.com/mongodb/mongo-tools"
  for tool in "${_tools[@]}"; do
    install -Dm755 "bin/${tool}" "${pkgdir}/usr/bin/${tool}"
  done
}
