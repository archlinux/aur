# Maintainer: redfish <redfish@galactica.pw>

pkgname=ncdns
pkgver=0.1.2
pkgrel=1
_x509_compressed_commit=11c148e3a82a374dc8cc7800729ae31d1de3514b

pkgdesc='Namecoin to DNS bridge daemon'
url='https://github.com/namecoin/ncdns'
arch=(x86_64 armv7h)
license=(GPL-3)

depends=(libcap)
optdepends=('namecoin-core: the Namecoin node')
makedepends=(go)
install="ncdns.install"
backup=("etc/ncdns.conf")

source=($pkgname-$pkgver.tar.gz::https://github.com/namecoin/ncdns/archive/v${pkgver}.tar.gz
	x509-compressed-${_x509_compressed_commit}.tar.gz::https://github.com/namecoin/x509-compressed/archive/${_x509_compressed_commit}.tar.gz
	ncdns.service)

_gopath=gopath
_pkgpath=github.com/namecoin

prepare() {
  export GOPATH=$srcdir/${_gopath}

  mkdir -p "${_pkgpath}"
  mv x509-compressed-${_x509_compressed_commit} ${_pkgpath}/x509-compressed
  mv $pkgname-$pkgver ${_pkgpath}/$pkgname

  pushd ${_pkgpath}/x509-compressed
  go mod init ${_pkgpath}/x509-compressed
  go mod tidy
  go generate ./...
  go mod tidy
  popd

  pushd ${_pkgpath}/$pkgname
  go mod init ${_pkgpath}/$pkgname
  go mod tidy
  go mod edit -replace ${_pkgpath}/x509-compressed=../x509-compressed
  go mod tidy
  popd
}

build() {
  export GOPATH=$srcdir/${_gopath}

  cd ${_pkgpath}/$pkgname
  go install ./...
}

package() {
  export GOPATH=$srcdir/${_gopath}

  cd ${_pkgpath}/$pkgname

  install -Dm 755 $GOPATH/bin/ncdns "$pkgdir/usr/bin/ncdns"
  install -Dm 644 $srcdir/ncdns.service "$pkgdir/usr/lib/systemd/system/ncdns.service"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md _doc/ncdns.conf.example
  # we copy from template, but user must edit the conf file before starting service
  install -Dm 644  _doc/ncdns.conf.example "$pkgdir/etc/ncdns.conf"
}

sha512sums=('a7b95bdaeb781f49f6bc70e4d43f6a513b48d46f279a2c1993002cf20ef63330799e32a7442db37cda84590d57a352e3bd2642db1d863cb858bd8de7d7741177'
            '6a78e4777ea041ccfb7299322cc2bf6ab0db10ad7a28c6f8ec8293409fd4af1638e0c91618b465b6b4fbbaf25bc2b8f32af0e08191713afe420620a8534c5910'
            '4fca961ae7fc17fbb159dc6cfe3bf6be52b7e1423f0c04591100780a72f250cb87263e3eb736b363d2e67dbd8485018cbaa720ccaa4450bb93d220f802b4be40')
