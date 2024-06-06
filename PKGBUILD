# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Marcel Campello <marcel@prafrentex.com.br>

pkgname=opentofu
pkgver=1.7.2
pkgrel=1
pkgdesc="Lets you declaratively manage your cloud infrastructure"
arch=(x86_64)
url="https://github.com/opentofu/opentofu"
license=(MPL-2.0)
depends=(glibc)
makedepends=(go)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "tofu.fish"
)
sha256sums=(
  '179216c485c6df55e9f4576c622fd12f3784ef9e0720925c2dc4a155c6b4aca1'
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
  # shellcheck disable=2153
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  local ldflags="-linkmode=external -X github.com/opentofu/opentofu/version.dev=no"
  go build -v -buildvcs=false -ldflags="$ldflags" ./cmd/...
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
