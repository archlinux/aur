# Maintainer: Adrián Laviós <adrian@lavios.eu>
pkgname=dnscrypt-proxy-go-git
pkgver=r103.1b38364
pkgrel=1
pkgdesc="A modern client implementation written in Go of the DNSCrypt v2 protocol."
arch=('x86_64')
url="https://github.com/jedisct1/dnscrypt-proxy"
license=('custom:ISC')
makedepends=('git' 'go')
conflicts=('dnscrypt-proxy')
backup=('etc/dnscrypt-proxy/dnscrypt-proxy.toml')
source=('git+https://github.com/jedisct1/dnscrypt-proxy.git'
        'dnscrypt-proxy.service'
        '0001-Revert-Load-the-toml-file-from-the-current-directory.patch'
        '0002-cd-to-var-cache-dnscrypt-proxy-rather-than-to-the-pa.patch'
        '0003-Change-cache_file-to-absolute-path.patch'
        '0004-Change-blacklist.txt-path-to-absolute.patch'
        '0005-Change-query.log-path-to-var-log-dnscrypt-proxy.patch')
sha512sums=('SKIP' 
            'f78d8673238214c49790de93e1cc51fbf95d71d5e21e833e4581e614ca70583757bd1b0292122f91001e321db6e13b62d26ec0b58968931c91267bd1492be124'
            'eb4d8305b710eb2ca26e18a2f034324f1b88dd93a2fa6e78d600b89570f331787af0ebb3e8f02af93833bb6d3ba5098d0758234db18cff46650d5f3ab542d0f2'
            '9074b8b397cfbbbece1da84792e319a487e859d99d42828ce9887fb462f53394803ec4ae21ffe5ea451f01914d0e048f55d458f63b9d9b41c60cb9c02e318ab6'
            '6459cbb8420bdab780e9141f0cc7f340ef54c02d9d0c64ba43187f7b87087016a514b8772940b8cca18c96f316b5980f80fdd5e0616c408d2188ba481d8aca32'
            '560c6b7e9943c4e9d76463c4ab476cbaaa3b2ae5d1d0c6f44412a6f64c3b2e528779508c5dac4fa0aabf4a22ce9df149896947d82fdba283f95a95e0c90e7163'
            'fed8f601f92dbcc593384d9de8115b4e66202101d17874fc4c8a6302ae7774c1974e048f924698ef4a04bb1f3cbf69c1dc3a9fbf953cc6e6c8f23e172061b238')

pkgver() {
  cd "$srcdir/dnscrypt-proxy"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$srcdir/dnscrypt-proxy"
  patch -Np1 -i "$srcdir/0001-Revert-Load-the-toml-file-from-the-current-directory.patch"
  patch -Np1 -i "$srcdir/0002-cd-to-var-cache-dnscrypt-proxy-rather-than-to-the-pa.patch"
  patch -Np1 -i "$srcdir/0003-Change-cache_file-to-absolute-path.patch"
  patch -Np1 -i "$srcdir/0004-Change-blacklist.txt-path-to-absolute.patch"
  patch -Np1 -i "$srcdir/0005-Change-query.log-path-to-var-log-dnscrypt-proxy.patch"
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
  
  install -dm755 "$pkgdir/var/cache/dnscrypt-proxy"
  install -dm700 "$pkgdir/var/log/dnscrypt-proxy"
  
  install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
