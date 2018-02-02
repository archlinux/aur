# Maintainer: Adrián Laviós <adrian@lavios.eu>
pkgname=dnscrypt-proxy-go-git
pkgver=2.0.0rc.r14.g9dd6863
pkgrel=1
pkgdesc="A modern client implementation written in Go of the DNSCrypt v2 protocol."
arch=('x86_64')
url="https://github.com/jedisct1/dnscrypt-proxy"
license=('custom:ISC')
makedepends=('git' 'go')
provides=('dnscrypt-proxy-go')
conflicts=('dnscrypt-proxy' 'dnscrypt-proxy-go')
backup=('etc/dnscrypt-proxy/dnscrypt-proxy.toml')
source=('git+https://github.com/jedisct1/dnscrypt-proxy.git'
        'dnscrypt-proxy.service'
        'dnscrypt-proxy.socket')
sha512sums=('SKIP'
            '7bf620078831c4be7fe2d40d7f3d955e6ceebf37e5a1621fbd4dfe07bb85b7a63ea391df96d982d5b21f049ca0de4f45d47d2347baded8e39b3b30338a608433'
            '1332b2842768848f0a2c0f5e3117e6c1397b0693b6ea9b9fd322efb278b519f8673f72ecfec962be0f469175daf781499c86742bf22baf1e260f2445102485b8')

pkgver() {
  cd "$srcdir/dnscrypt-proxy"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/dnscrypt-proxy/dnscrypt-proxy"
  sed -i 's|\['\''127\.0\.0\.1:53'\'', '\''\[::1\]:53'\''\]|\[\]|g' example-dnscrypt-proxy.toml
  sed -i 's|'\''dnscrypt-proxy\.log'\''|'\''/var/log/dnscrypt-proxy/dnscrypt-proxy\.log'\''|g' example-dnscrypt-proxy.toml
  sed -i 's|'\''forwarding-rules\.txt'\''|'\''/etc/dnscrypt-proxy/forwarding-rules\.txt'\''|g' example-dnscrypt-proxy.toml
  sed -i 's|'\''query\.log'\''|'\''/var/log/dnscrypt-proxy/query\.log'\''|g' example-dnscrypt-proxy.toml
  sed -i 's|'\''nx\.log'\''|'\''/var/log/dnscrypt-proxy/nx\.log'\''|g' example-dnscrypt-proxy.toml
  sed -i 's|'\''blacklist\.txt'\''|'\''/etc/dnscrypt-proxy/blacklist\.txt'\''|g' example-dnscrypt-proxy.toml
  sed -i 's|'\''blocked\.log'\''|'\''/var/log/dnscrypt-proxy/blocked\.log'\''|g' example-dnscrypt-proxy.toml
  sed -i 's|'\''ip-blacklist\.txt'\''|'\''/etc/dnscrypt-proxy/ip-blacklist\.txt'\''|g' example-dnscrypt-proxy.toml
  sed -i 's|'\''ip-blocked\.log'\''|'\''/var/log/dnscrypt-proxy/ip-blocked\.log'\''|g' example-dnscrypt-proxy.toml
  sed -i 's|'\''public-resolvers\.md'\''|'\''/var/cache/dnscrypt-proxy/public-resolvers\.md'\''|g' example-dnscrypt-proxy.toml
  sed -i 's|'\''parental-control\.md'\''|'\''/var/cache/dnscrypt-proxy/parental-control\.md'\''|g' example-dnscrypt-proxy.toml
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
  install -Dm644 "example-dnscrypt-proxy.toml" "$pkgdir/etc/dnscrypt-proxy/dnscrypt-proxy.toml"
  install -Dm644 "example-forwarding-rules.txt" "$pkgdir/usr/share/doc/dnscrypt-proxy/example-forwarding-rules.txt"
  install -Dm644 "example-blacklist.txt" "$pkgdir/usr/share/doc/dnscrypt-proxy/example-blacklist.txt"
  
  install -Dm644 "$srcdir/dnscrypt-proxy.service" "$pkgdir/usr/lib/systemd/system/dnscrypt-proxy.service"
  install -Dm644 "$srcdir/dnscrypt-proxy.socket" "$pkgdir/usr/lib/systemd/system/dnscrypt-proxy.socket"
    
  install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
