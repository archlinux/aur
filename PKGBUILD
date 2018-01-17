# Maintainer: Adrián Laviós <adrian@lavios.eu>
pkgname=dnscrypt-proxy-go-git
pkgver=r119.1a502d0
pkgrel=1
pkgdesc="A modern client implementation written in Go of the DNSCrypt v2 protocol."
arch=('x86_64')
url="https://github.com/jedisct1/dnscrypt-proxy"
license=('custom:ISC')
makedepends=('git' 'go')
provides=('dnscrypt-proxy-go')
conflicts=('dnscrypt-proxy' 'dnscrypt-proxy-go')
backup=('etc/dnscrypt-proxy/dnscrypt-proxy.toml' 'etc/dnscrypt-proxy/forwarding-rules.txt' 'etc/dnscrypt-proxy/blacklist.txt')
source=('git+https://github.com/jedisct1/dnscrypt-proxy.git'
        'dnscrypt-proxy.service')
sha512sums=('SKIP'
            '523fef4cb113b2e7a10ce8a7715f9041d8af4cd62b56780e899d540609730acbff303cc05bc17a8281290894a87389ba65b24218f11fd04bbc1a07317dadfffb')

pkgver() {
  cd "$srcdir/dnscrypt-proxy"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$srcdir/dnscrypt-proxy/dnscrypt-proxy"
  sed -i 's/"dnscrypt-resolvers.csv"/"\/var\/cache\/dnscrypt-proxy\/dnscrypt-resolvers.csv"/g' dnscrypt-proxy.toml
  sed -i 's/"forwarding-rules.txt"/"\/etc\/dnscrypt-proxy\/forwarding-rules.txt"/g' dnscrypt-proxy.toml
  sed -i 's/"query.log"/"\/var\/log\/dnscrypt-proxy\/query.log"/g' dnscrypt-proxy.toml
  sed -i 's/"blacklist.txt"/"\/etc\/dnscrypt-proxy\/blacklist.txt"/g' dnscrypt-proxy.toml
  sed -i 's/"blocked.log"/"\/var\/log\/dnscrypt-proxy\/blocked.log"/g' dnscrypt-proxy.toml
}

build() {
  msg2 'Setting gopath...'
  mkdir -p "$srcdir/gopath"
  export GOPATH="$srcdir/gopath"
  
  msg2 'Setting build environment...'
  mkdir -p "${GOPATH}/src/github.com/jedisct1"
  ln -sfn "$srcdir/dnscrypt-proxy" "${GOPATH}/src/github.com/jedisct1/dnscrypt-proxy"
  
  msg2 'Compiling...'
  cd "${GOPATH}/src/github.com/jedisct1/dnscrypt-proxy/dnscrypt-proxy"
  go build
}

package() {
  cd "$srcdir/dnscrypt-proxy/dnscrypt-proxy"
  install -Dm755 "dnscrypt-proxy" "$pkgdir/usr/bin/dnscrypt-proxy"
  install -Dm644 "dnscrypt-proxy.toml" "$pkgdir/etc/dnscrypt-proxy/dnscrypt-proxy.toml"
  install -Dm644 "forwarding-rules.txt" "$pkgdir/etc/dnscrypt-proxy/forwarding-rules.txt"
  install -Dm644 "blacklist.txt" "$pkgdir/etc/dnscrypt-proxy/blacklist.txt"
  install -Dm644 "$srcdir/dnscrypt-proxy.service" "$pkgdir/usr/lib/systemd/system/dnscrypt-proxy.service"
  
  install -dm755 "$pkgdir/var/cache/dnscrypt-proxy"
  install -dm700 "$pkgdir/var/log/dnscrypt-proxy"
  
  install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
