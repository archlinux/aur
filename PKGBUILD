# Contributor: Maddie Zhan <maddie@emzee.be>
# Maintainer: Maddie Zhan <maddie@emzee.be>

pkgname=overture
pkgver=1.8
pkgrel=1
pkgdesc="A DNS upstream switcher written in Go in order to purify DNS records"
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/shawn1m/overture"
license=("MIT")
provides=("overture")
optdepends=("dnsmasq: advanced DNS configuration" "redis: dns caching")
makedepends=("go>=1.12")
backup=("etc/overture/config.json" "etc/overture/hosts" "etc/overture/china_ip_list.txt" "etc/overture/gfwlist.txt")

install=${pkgname}.install

_gourl=github.com/shawn1m/${pkgname}
source=("git+https://github.com/shawn1m/${pkgname}.git#tag=v${pkgver}"
        "config.yml"
        "hosts"
        "domain_ttl"
        "domain_primary"
        "domain_alternative"
        "ip_network_primary"
        "ip_network_alternative"
        "overture.service")

sha256sums=("SKIP"
            "fbcfe2e13118045ca6608e833795ea1e3e8595d2bc608e468f002a6c5c9c4c17"
            "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
            "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
            "01ba4719c80b6fe911b091a7c05124b64eeece964e09c058ef8f9805daca546b"
            "01ba4719c80b6fe911b091a7c05124b64eeece964e09c058ef8f9805daca546b"
            "01ba4719c80b6fe911b091a7c05124b64eeece964e09c058ef8f9805daca546b"
            "01ba4719c80b6fe911b091a7c05124b64eeece964e09c058ef8f9805daca546b"
            "3ff281e0fe9407b414e6c4be573bdd0afc660c961d8eb6d93bfec2e160025590")

_goroot="/usr/lib/go"

build() {
  GOROOT=${_goroot}
  msg2 "Building overture"
  cd ${srcdir}/${pkgname}
  [ ! -d ${srcdir}/${pkgname}/out ] && mkdir ${srcdir}/${pkgname}/out
  CGO_ENABLED=1 go build -ldflags="-w -s -X main.version=${pkgver}" -trimpath -o out/${pkgname} main/main.go
}

package() {
  # Binary
  install -Dm0755 "$srcdir/${pkgname}/out/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Config and other files
  install -Dm0644 "$srcdir/config.yml" "$pkgdir/etc/overture/config.yml"
  install -Dm0644 "$srcdir/hosts" "$pkgdir/etc/overture/hosts"
  install -Dm0644 "$srcdir/domain_ttl" "$pkgdir/etc/overture/domain_ttl"
  install -Dm0644 "$srcdir/domain_primary" "$pkgdir/etc/overture/domain_primary"
  install -Dm0644 "$srcdir/domain_alternative" "$pkgdir/etc/overture/domain_alternative"
  install -Dm0644 "$srcdir/ip_network_primary" "$pkgdir/etc/overture/ip_network_primary"
  install -Dm0644 "$srcdir/ip_network_alternative" "$pkgdir/etc/overture/ip_network_alternative"

  # Service
  install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  # License
  install -Dm0644 "$srcdir/${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

post_upgrade() {
  echo "If you're upgrading from pre-1.4 versions, please make sure your config.json"
  echo "is up to date with the v1.4 format, or else Overture might not start properly."
  echo
  echo "If you're upgrading from previous versions that uses config.json, please migrate"
  echo "your configuration to config.yml."
}
