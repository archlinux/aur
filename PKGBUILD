# Contributor: Maddie Zhan <maddie@emzee.be>
# Maintainer: Maddie Zhan <maddie@emzee.be>

pkgname=overture
pkgver=1.3.1
pkgrel=1
pkgdesc="A DNS upstream switcher written in Go in order to purify DNS records"
arch=("i686" "x86_64" "armv6h" "armv7h")
url="https://github.com/holyshawn/overture"
license=("MIT")
provides=("overture")
optdepends=("dnsmasq: advanced DNS configuration")
makedepends=("go>=1.7")
backup=("etc/overture/config.json")

install=${pkgname}.install

_gourl=github.com/holyshawn/${pkgname}
source=("git+https://github.com/holyshawn/${pkgname}.git#tag=$pkgver"
        "china_ip_list.txt"
        "config.json"
        "gfwlist.txt"
        "hosts"
        "overture.service")

sha256sums=("SKIP"
            "58e26e8037056729d27f37cd13852e13e9b9766146eaf0e736b6b0c00cdec279"
            "20bae2de8a95e5699a4786483bcf519f640b4ca7e4225a88f5aecc895d4b9be9"
            "46c344510738143bd83057494273cf78095743070ad05d80a8d985098b2ff7ec"
            "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
            "89f0e6577a42ed913ed010366695b12f51923d8e503d7eed107c0e2f13268ac1")

_goroot="/usr/lib/go"

prepare() {
  export GOROOT=/usr/lib/go

  rm -rf build
  mkdir -p build/go
  cd build/go

  for f in "$GOROOT/"*; do
    ln -s "$f"
  done

  rm -rf pkg
  mkdir pkg
  cd pkg

  for f in "$GOROOT/pkg/"*; do
    ln -s "$f"
  done

  export GOROOT="$srcdir/build/go"
  export GOPATH="$srcdir/build"

  mkdir -p "$GOPATH/src/github.com/holyshawn"

  mv "$srcdir/$pkgname" $GOPATH/src/${_gourl}
}

build() {
  cd $GOPATH/src/${_gourl}
  go get ./...

  msg2 "Building overture"
  CGO_ENABLED=0 go build -ldflags="-w -s" -o $pkgname main/main.go
}

package() {
  # Binary
  install -Dm0755 "$srcdir/build/src/${_gourl}/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Config and other files
  install -Dm0644 "$srcdir/config.json" "$pkgdir/etc/overture/config.json"
  install -Dm0644 "$srcdir/china_ip_list.txt" "$pkgdir/etc/overture/china_ip_list.txt"
  install -Dm0644 "$srcdir/gfwlist.txt" "$pkgdir/etc/overture/gfwlist.txt"
  install -Dm0644 "$srcdir/hosts" "$pkgdir/etc/overture/hosts"

  # Service
  install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  # License
  install -Dm0644 "$srcdir/build/src/${_gourl}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
