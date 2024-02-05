# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Marcel Campello <marcel@prafrentex.com.br>

pkgname=opentofu
pkgver=1.6.1
_commit=89ca50f3fe8c5327ec9943e9590bdb7b023fd4eb
pkgrel=1
pkgdesc="Lets you declaratively manage your cloud infrastructure"
arch=(x86_64)
url="https://github.com/opentofu/opentofu"
license=(MPL-2.0)
depends=(glibc)
makedepends=(
  git
  go
)
source=(
  "$pkgname::git+$url.git?signed#commit=$_commit"
  "tofu.fish"
)
sha256sums=(
  'SKIP'
  '312fe00a97ed3098fa141a54dfc0694c13766957acedec19f10347b80f813ce8'
)
validpgpkeys=('968479A1AFF927E37D1A566BB5690EEEBB952194') # GitHub <noreply@github.com>

_archive="$pkgname"

build() {
  cd "$_archive"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v ./cmd/...
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
  cp --archive -t "$pkgdir/usr/share/doc/$pkgname" docs
}
