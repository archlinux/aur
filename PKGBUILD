# Maintainer: Adrián Laviós <adrian@lavios.eu>
pkgname=dnscrypt-proxy-go-git
pkgver=r64.f747365
pkgrel=1
pkgdesc="A modern client implementation in Go of the DNSCrypt v2 protocol."
arch=('x86_64')
url="https://github.com/jedisct1/dnscrypt-proxy"
license=('GPL3')
depends=('')
makedepends=('git' 'go')
conflicts=('dnscrypt-proxy')
source=('git+https://github.com/jedisct1/dnscrypt-proxy.git' 'dnscrypt-proxy.service')
sha512sums=('SKIP' 'f78d8673238214c49790de93e1cc51fbf95d71d5e21e833e4581e614ca70583757bd1b0292122f91001e321db6e13b62d26ec0b58968931c91267bd1492be124')

pkgver() {
  cd "$srcdir/dnscrypt-proxy"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
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
  install -Dm644 "$srcdir/dnscrypt-proxy.service" "$pkgdir/usr/lib/systemd/system/dnscrypt-proxy.service"
  
  install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
