# Maintainer: tarball <bootctl@gmail.com>

pkgname=weron
pkgver=0.2.6
pkgrel=1
pkgdesc='Overlay networks based on WebRTC'
url='https://github.com/pojntfx/weron'
arch=(i686 x86_64 aarch64 riscv64)
license=(AGPL-3.0-only)
makedepends=(go)
depends=(glibc)
optdepends=(
  'postgresql: for local PostgreSQL database'
  'redis: for local Redis instance'
)
backup=(etc/default/weron-signaler)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        weron-signaler.default
        weron-signaler.service)
sha256sums=('56a8cacf7417edecbbe15c4b24b58a304cdd1e81d82c0c9276af9c55960b5aae'
            '6d46ec44d73f16be9ea8d9a3529512fe54f4b5afe02f9edeeef5c91a55f79048'
            '58d8d8930274dd7eb75c1719a44b447700fad3dd6398cfb0c48e03031030c356')

prepare() {
  cd "$pkgname-$pkgver"
  go mod download

  # TODO: fixes compatibility with go 1.23; remove on new release
  go get -u golang.org/x/net
  go mod tidy
}

build() {
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  cd "$pkgname-$pkgver"
  mkdir -p out
  go build -o out/weron ./cmd/weron

  for sh in bash fish zsh; do
    ./out/weron completion $sh >out/comp.$sh
  done
}

check() {
  cd "$pkgname-$pkgver"
  go test -parallel "$(nproc)" ./...
}

package() {
  install -Dm640 weron-signaler.default "$pkgdir/etc/default/weron-signaler"
  install -Dm644 weron-signaler.service -t "$pkgdir/usr/lib/systemd/system/"

  cd "$pkgname-$pkgver"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

  install -Dm755 out/weron -t "$pkgdir/usr/bin/"

  install -Dm644 out/comp.bash "$pkgdir/usr/share/bash-completion/completions/weron"
  install -Dm644 out/comp.fish "$pkgdir/usr/share/fish/vendor_completions.d/weron.fish"
  install -Dm644 out/comp.zsh "$pkgdir/usr/share/zsh/site-functions/_weron"
}
