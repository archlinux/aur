# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# https://github.com/brokenpip3/my-pkgbuilds

pkgname=falcoctl
pkgver=0.5.0
pkgrel=1
pkgdesc="Administrative tooling for Falco"
arch=('any')
url="https://github.com/falcosecurity/falcoctl"
license=('APACHE')
makedepends=('go' 'git' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bcb8c46e7e0e22e8958135daf35bc78380877eea4027bae9f459ad1d6c2cf1ad')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make RELEASE=${pkgver} falcoctl
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 falcoctl "${pkgdir}/usr/bin/falcoctl"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  "$pkgdir/usr/bin/falcoctl" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/falcoctl"
  "$pkgdir/usr/bin/falcoctl" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_falcoctl"
  "$pkgdir/usr/bin/falcoctl" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/falcoctl.fish"
}
