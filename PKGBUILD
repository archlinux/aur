# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Marcel Campello <marcel@prafrentex.com.br>

pkgname=opentofu
pkgver=1.6.2
pkgrel=1
pkgdesc="Lets you declaratively manage your cloud infrastructure"
arch=(x86_64)
url="https://github.com/opentofu/opentofu"
license=(MPL-2.0)
depends=(glibc)
makedepends=(go)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "tofu.fish"
)
sha256sums=(
  '3bf0fc807004ba26305331ecf1334ff2160f8c131ee53c107292d60069400da6'
  '312fe00a97ed3098fa141a54dfc0694c13766957acedec19f10347b80f813ce8'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  go mod download -x
}

build() {
  cd "$_archive"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -buildvcs=false ./cmd/...
}

check() {
  cd "$_archive"

  go test ./...
}

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" tofu

  echo 'complete -C /usr/bin/tofu tofu' > tofu.bash
  install -Dm644 tofu.bash "$pkgdir/usr/share/bash-completion/completions/tofu"
  install -Dm644 "$srcdir/tofu.fish" "$pkgdir/usr/share/fish/completions/tofu.fish"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  cp -a -t "$pkgdir/usr/share/doc/$pkgname" docs
}
