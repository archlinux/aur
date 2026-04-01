# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# Maintainer: Thomas Labarussias <issif+aur@gadz.org>
# https://github.com/brokenpip3/my-pkgbuilds

pkgname=falcoctl
pkgver=0.12.2
pkgrel=1
pkgdesc="Administrative tooling for Falco"
arch=('any')
url="https://github.com/falcosecurity/falcoctl"
license=('APACHE')
makedepends=('go' 'git' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('05290a97ac6ac886fc4b34d157d533de37d5a1031f81cf4e6eb1f056c4015f49')

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
  go test -cover -v -skip='TestOAuth|TestConfig|TestInstall|TestPrintenv' ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 falcoctl "${pkgdir}/usr/bin/falcoctl"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  "$pkgdir/usr/bin/falcoctl" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/falcoctl"
  "$pkgdir/usr/bin/falcoctl" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_falcoctl"
  "$pkgdir/usr/bin/falcoctl" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/falcoctl.fish"
}
