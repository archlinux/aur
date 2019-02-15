# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=mongodb-tools
pkgver=4.0.6
pkgrel=1
pkgdesc="The MongoDB tools provide import, export, and diagnostic capabilities."
arch=('x86_64')
url="https://github.com/mongodb/mongo-tools"
license=('Apache')
depends=('libpcap')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mongodb/mongo-tools/archive/r${pkgver}.tar.gz")
sha512sums=('d6185d7442a593d29db78889c55aba53e070bedd522d78d8c0bf52bb27f26c5fee6d010457f65774ea36a2e6d5280f38c95433ff76ed53ed9d74b1c811198cb7')

_tools=('bsondump' 'mongostat' 'mongofiles' 'mongoexport' 'mongoimport' 'mongorestore' 'mongodump' 'mongotop' 'mongoreplay')

prepare() {
  cd "${srcdir}"
  install -d build/src/github.com/mongodb
  mv "mongo-tools-r${pkgver}" build/src/github.com/mongodb/mongo-tools
  cd build/src/github.com/mongodb/mongo-tools
  GOROOT=/usr ./set_goenv.sh
  export GOPATH="$GOPATH:$srcdir/build"
  mkdir bin
}

build() {
  cd "${srcdir}/build/src/github.com/mongodb/mongo-tools"
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
