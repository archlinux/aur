# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# https://github.com/brokenpip3/my-pkgbuilds

pkgname=driverkit
pkgver=0.20.4
pkgrel=2
pkgdesc="Kit for building Falco drivers: kernel modules or eBPF probes"
arch=('any')
url="https://github.com/falcosecurity/driverkit"
license=('APACHE')
makedepends=('go' 'git')
# Git tag source since the upstream makefile use git info to build
source=("$pkgname-$pkgver::git+$url#tag=v$pkgver")
sha256sums=('a2e5a810f647a2a829028c32148075a8ed5ac7a8406c45e7dd7f81932230d207')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make build
}

check() {
  cd "$pkgname-$pkgver"
  go test -v -cover ./...
  go test -v -cover -buildmode=pie ./cmd
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 _output/bin/driverkit "${pkgdir}/usr/bin/driverkit"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  "$pkgdir/usr/bin/driverkit" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/driverkit"
  "$pkgdir/usr/bin/driverkit" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_driverkit"
  "$pkgdir/usr/bin/driverkit" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/driverkit.fish"
}
