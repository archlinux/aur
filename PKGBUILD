# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: Christoph Bayer <chrbayer@criby.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=mongodb-tools
pkgver=4.0.8
pkgrel=1
pkgdesc="The MongoDB tools provide import, export, and diagnostic capabilities."
arch=('x86_64')
url="https://github.com/mongodb/mongo-tools"
license=('Apache')
depends=('libpcap')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mongodb/mongo-tools/archive/r${pkgver}.tar.gz")
sha512sums=('9e6886038b8c28d50cbec9f76869aceb79eb3214868bca367a6f7a74c346ff5da8d0ee4567bb6c17436860679ca97add3e24e6ba69a6a8d5764c0e1bc5b04813')

_tools=('bsondump' 'mongostat' 'mongofiles' 'mongoexport' 'mongoimport' 'mongorestore' 'mongodump' 'mongotop' 'mongoreplay')

prepare() {
  cd "${srcdir}"
  install -d build/src/github.com/mongodb/bin
  mv "mongo-tools-r${pkgver}" build/src/github.com/mongodb/mongo-tools
  sed -i 's/_Ctype_struct_/C.struct_/' build/src/github.com/mongodb/mongo-tools/vendor/github.com/google/gopacket/pcap/pcap.go
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
