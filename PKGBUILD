# Maintainer: Adrián Laviós <adrian@lavios.eu>
pkgname=dnscrypt-proxy-go-git
pkgver=2.0.0beta9.r3.geb4f392
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
            'c897396247a1ada2ab29441bb1ddf35cb0f2687b47d4efe85a4a6753a78698032fc0faa50c266636929147b90bc5db50cb398e82e57bdf5320cb0d7fc9faf2aa')

pkgver() {
  cd "$srcdir/dnscrypt-proxy"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/dnscrypt-proxy/dnscrypt-proxy"
  sed -i 's|\['\''127\.0\.0\.1:53'\'', '\''\[::1\]:53'\''\]|\[\]|g' dnscrypt-proxy.toml
  sed -i 's|'\''dnscrypt-proxy\.log'\''|'\''/var/log/dnscrypt-proxy/dnscrypt-proxy\.log'\''|g' dnscrypt-proxy.toml
  sed -i 's|'\''dnscrypt-resolvers\.csv'\''|'\''/var/cache/dnscrypt-proxy/dnscrypt-resolvers\.csv'\''|g' dnscrypt-proxy.toml
  sed -i 's|'\''forwarding-rules\.txt'\''|'\''/etc/dnscrypt-proxy/forwarding-rules\.txt'\''|g' dnscrypt-proxy.toml
  sed -i 's|'\''query\.log'\''|'\''/var/log/dnscrypt-proxy/query\.log'\''|g' dnscrypt-proxy.toml
  sed -i 's|'\''nx\.log'\''|'\''/var/log/dnscrypt-proxy/nx\.log'\''|g' dnscrypt-proxy.toml
  sed -i 's|'\''blacklist\.txt'\''|'\''/etc/dnscrypt-proxy/blacklist\.txt'\''|g' dnscrypt-proxy.toml
  sed -i 's|'\''blocked\.log'\''|'\''/var/log/dnscrypt-proxy/blocked\.log'\''|g' dnscrypt-proxy.toml
  sed -i 's|'\''ip-blacklist\.txt'\''|'\''/etc/dnscrypt-proxy/ip-blacklist\.txt'\''|g' dnscrypt-proxy.toml
  sed -i 's|'\''ip-blocked\.log'\''|'\''/var/log/dnscrypt-proxy/ip-blocked\.log'\''|g' dnscrypt-proxy.toml
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
