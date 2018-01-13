# Maintainer: Adrián Laviós <adrian@lavios.eu>
pkgname=dnscrypt-proxy-go-git
pkgver=r67.3824d05
pkgrel=1
pkgdesc="A modern client implementation in Go of the DNSCrypt v2 protocol."
arch=('x86_64')
url="https://github.com/jedisct1/dnscrypt-proxy"
license=('custom:ISC')
makedepends=('git' 'go')
conflicts=('dnscrypt-proxy')
backup=('etc/dnscrypt-proxy/dnscrypt-proxy.toml')
source=('git+https://github.com/jedisct1/dnscrypt-proxy.git' 'dnscrypt-proxy.service' '0001-revert-read-toml-from-current-directory.patch')
sha512sums=('SKIP' 'f78d8673238214c49790de93e1cc51fbf95d71d5e21e833e4581e614ca70583757bd1b0292122f91001e321db6e13b62d26ec0b58968931c91267bd1492be124' 'af331b2c806e68fbce849f5165788684cef45b05c657493b600d85860f08809c7847a3e3196a53808706c71c55fd3db651436bc5b281487247395ae19e3dea08')

pkgver() {
  cd "$srcdir/dnscrypt-proxy"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$srcdir/dnscrypt-proxy"
  patch -Np1 -i "$srcdir/0001-revert-read-toml-from-current-directory.patch"
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
