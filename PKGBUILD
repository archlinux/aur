# Maintainer: tarball <bootctl@gmail.com>
# Contributor: ml <>

pkgname=svu
pkgver=3.3.0
pkgrel=1
pkgdesc='Semantic Version Util'
arch=(i686 x86_64 armv7h armv6h aarch64 riscv64)
url='https://github.com/caarlos0/svu'
license=('MIT')
depends=('git')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('64d81d3ad15c44deb872be9325e090ee545bed73b12e663b23ef7405e7ef4aeb')
_go_flags=(-ldflags "-linkmode=external -X main.version=v$pkgver")

build() {
  cd "$pkgname-$pkgver"

  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'

  go build -o "$pkgname" "${_go_flags[@]}" main.go

  for sh in bash zsh fish; do
    ./$pkgname completion $sh >$pkgname.$sh
  done
}

check() {
  cd "$pkgname-$pkgver"
  go test -v -short "${_go_flags[@]}" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -Dm644 "$pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
