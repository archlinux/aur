# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

pkgname=tiedot
pkgver=3.4
pkgrel=1
pkgdesc="A NoSQL document database engine powered by Go"
arch=('i686' 'x86_64')
url="https://github.com/HouzuoGuo/tiedot/"
license=('BSD-2Clause')
makedepends=('go' 'jwt-go')
source=("https://github.com/HouzuoGuo/tiedot/archive/${pkgver}.tar.gz")
sha256sums=('696464b84599a686066ea89996a5a0e878cf2e2f022ea33178338e90906dabfc')

prepare() {
  cd "$pkgname-$pkgver"
  local dir_ext="build/src/github.com/HouzuoGuo/tiedot"
  mkdir -p "${dir_ext}"
  cp -ra data "${dir_ext}/data/"
  cp -ra db "${dir_ext}/db/"
  cp -ra dberr "${dir_ext}/dberr/"
  cp -ra gommap "${dir_ext}/gommap"
  cp -ra httpapi "${dir_ext}/httpapi"
  cp -ra tdlog "${dir_ext}/tdlog"
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="${PWD}/build"
  go build
}

package() {
  cd "$pkgname-$pkgver"

  # Copy docs
  mkdir -p "${pkgdir}/usr/share"
  cp -ra doc "${pkgdir}/usr/share/doc/"
  cp -ra "extra" "${pkgdir}/usr/share/${pkgname}"

  # Config and Service
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 distributable/tiedot.service "${pkgdir}/usr/lib/systemd/system/tiedot.service"
  install -Dm644 distributable/etc/tiedot "${pkgdir}/etc/tiedot"

  # Copy source
  local dir_ext="${pkgdir}/usr/lib/go/src/github.com/rwcarlsen/goexif"
  mkdir -p "${dir_ext}"
  cp -ra "data" "${dir_ext}/data"
  cp -ra "db" "${dir_ext}/db"
  cp -ra "dberr" "${dir_ext}/dberr"
  cp -ra "gommap" "${dir_ext}/gommap"
  cp -ra "httpapi" "${dir_ext}/httpapi"
  cp -ra "tdlog" "${dir_ext}/tdlog"

  # install executables
  install -Dm 755 tiedot-${pkgver} "${pkgdir}/usr/bin/tiedot"
}

