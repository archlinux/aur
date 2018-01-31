# Maintainer: Adrián Laviós <adrian@lavios.eu>
pkgname=dnscrypt-proxy-go-git
pkgver=2.0.0beta12.r22.g2d291ec
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
            '117d4450fceeaf6806ce0311656946ced556ba25fc96a30fe105b1487c4063fc19694c2889979691d9c3037350fedeff4131728f87064483df3ce5c9e0cbd085')

pkgver() {
  cd "$srcdir/dnscrypt-proxy"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/dnscrypt-proxy/dnscrypt-proxy"
  sed -i 's|\['\''127\.0\.0\.1:53'\'', '\''\[::1\]:53'\''\]|\[\]|g' dnscrypt-proxy.toml
  sed -i 's|'\''dnscrypt-proxy\.log'\''|'\''/var/log/dnscrypt-proxy/dnscrypt-proxy\.log'\''|g' dnscrypt-proxy.toml
  sed -i 's|'\''forwarding-rules\.txt'\''|'\''/etc/dnscrypt-proxy/forwarding-rules\.txt'\''|g' dnscrypt-proxy.toml
  sed -i 's|'\''query\.log'\''|'\''/var/log/dnscrypt-proxy/query\.log'\''|g' dnscrypt-proxy.toml
  sed -i 's|'\''nx\.log'\''|'\''/var/log/dnscrypt-proxy/nx\.log'\''|g' dnscrypt-proxy.toml
  sed -i 's|'\''blacklist\.txt'\''|'\''/etc/dnscrypt-proxy/blacklist\.txt'\''|g' dnscrypt-proxy.toml
  sed -i 's|'\''blocked\.log'\''|'\''/var/log/dnscrypt-proxy/blocked\.log'\''|g' dnscrypt-proxy.toml
  sed -i 's|'\''ip-blacklist\.txt'\''|'\''/etc/dnscrypt-proxy/ip-blacklist\.txt'\''|g' dnscrypt-proxy.toml
  sed -i 's|'\''ip-blocked\.log'\''|'\''/var/log/dnscrypt-proxy/ip-blocked\.log'\''|g' dnscrypt-proxy.toml
  sed -i 's|'\''public-resolvers\.md'\''|'\''/var/cache/dnscrypt-proxy/public-resolvers\.md'\''|g' dnscrypt-proxy.toml
  sed -i 's|'\''parental-control\.md'\''|'\''/var/cache/dnscrypt-proxy/parental-control\.md'\''|g' dnscrypt-proxy.toml
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
  install -Dm644 "../systemd/dnscrypt-proxy.socket" "$pkgdir/usr/lib/systemd/system/dnscrypt-proxy.socket"
    
  install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
