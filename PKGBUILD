# Maintainer: tarball <bootctl@gmail.com>

pkgname=newreleases
pkgver=0.1.15
pkgrel=1
pkgdesc='NewReleases.io CLI'
url='https://newreleases.io'
arch=(i686 x86_64 aarch64 riscv64)
license=(BSD)
makedepends=(go)
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/newreleasesio/cli-go/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0c16242bc5ad3b3ed8efa177c17abfafdb660dd95425ed859998a65da4f3637e')

prepare() {
  cd "cli-go-$pkgver"
  mkdir -p build
  go mod download
}

build() {
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  cd "cli-go-$pkgver"
  go build -o build/$pkgname ./$pkgname

  for shell in bash fish zsh; do
    ./build/$pkgname completion $shell >build/completion.$shell
  done
}

check() {
  cd "cli-go-$pkgver"
  go test ./...
}

package() {
  cd "cli-go-$pkgver"

  install -Dm755 build/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 build/completion.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 build/completion.fish "$pkgdir/usr/share/fish/completions/$pkgname.fish"
  install -Dm644 build/completion.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
