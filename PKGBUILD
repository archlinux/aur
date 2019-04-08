# Contributor: Maddie Zhan <maddie@emzee.be>
# Maintainer: Maddie Zhan <maddie@emzee.be>

pkgname=overture
pkgver=1.5
pkgrel=1
pkgdesc="A DNS upstream switcher written in Go in order to purify DNS records"
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/shawn1m/overture"
license=("MIT")
provides=("overture")
optdepends=("dnsmasq: advanced DNS configuration")
makedepends=("go>=1.9")
backup=("etc/overture/config.json" "etc/overture/hosts" "etc/overture/china_ip_list.txt" "etc/overture/gfwlist.txt")

install=${pkgname}.install

_gourl=github.com/shawn1m/${pkgname}
source=("git+https://github.com/shawn1m/${pkgname}.git#tag=v${pkgver}"
        "china_ip_list.txt"
	"domain_ttl.txt"
        "config.json"
        "gfwlist.txt"
        "hosts"
        "overture.service")

sha256sums=("SKIP"
            "82948c5f5d806b384a4eda405fba0691c8df10cd1293d116a80d427ebe802e18"
	    "107cb3b11c4a06d5a804c4375c56890fd8e2006ecd978ad76332dc480e0e1946"
            "3d630b10c18756aadc6a05e572a2e163c9e730340a5a022549181113457a0d70"
            "b9faeacafaf842f6643a81b6d85c60bf7d045132b661f787e6ced19318d4d049"
            "02c82a9ffce44f1517b0b64380e11ea41d15812267a0fbff97221b5a6921df50"
            "9529e60a7963fd284ad2afb99d28803af90f16db99a1ba662ac5c7fd52903d3f")

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

  mkdir -p "$GOPATH/src/github.com/shawn1m"

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

post_upgrade() {
  echo "If you're upgrading from pre-1.4 versions, please make sure your config.json"
  echo "is up to date with the v1.4 format, or else Overture might not start properly."
}
