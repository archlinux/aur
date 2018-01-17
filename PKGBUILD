# Maintainer: Adrián Laviós <adrian@lavios.eu>
pkgname=dnscrypt-proxy-go
pkgver=2.0.0beta1
pkgrel=1
pkgdesc="A modern client implementation written in Go of the DNSCrypt v2 protocol."
arch=('x86_64')
url="https://github.com/jedisct1/dnscrypt-proxy"
license=('custom:ISC')
makedepends=('git' 'go')
conflicts=('dnscrypt-proxy')
backup=('etc/dnscrypt-proxy/dnscrypt-proxy.toml' 'etc/dnscrypt-proxy/forwarding-rules.txt' 'etc/dnscrypt-proxy/blacklist.txt')
source=("https://github.com/jedisct1/dnscrypt-proxy/archive/${pkgver}.tar.gz"
        'dnscrypt-proxy.service')
sha512sums=('a275e8e3ac516925c98f3a2926a0a9004b6977a6a53a969a34658c9c2ca5662d12f7300f44872c866829274d70d148af6692a800f3e368386950de7bbb184c57'
            '523fef4cb113b2e7a10ce8a7715f9041d8af4cd62b56780e899d540609730acbff303cc05bc17a8281290894a87389ba65b24218f11fd04bbc1a07317dadfffb')

prepare() {
  cd "$srcdir/dnscrypt-proxy-${pkgver}/dnscrypt-proxy"
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
  ln -sfn "$srcdir/dnscrypt-proxy-${pkgver}" "${GOPATH}/src/github.com/jedisct1/dnscrypt-proxy"
  
  msg2 'Compiling...'
  cd "${GOPATH}/src/github.com/jedisct1/dnscrypt-proxy/dnscrypt-proxy"
  go build
}

package() {
  cd "$srcdir/dnscrypt-proxy-${pkgver}/dnscrypt-proxy"
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
