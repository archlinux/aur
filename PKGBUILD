# Maintainer: Nikolai Rodionov <allanger@badhouseplants.net>

pkgname=chart-releaser
pkgver=1.6.1
pkgrel=1
pkgdesc='Hosting Helm Charts via GitHub Pages and Releases'
arch=('x86_64' 'aarch64' 'armv6h')
url='https://github.com/helm/chart-releaser'
license=('Apache')
depends=('git')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('2de4f4ba4d10ce70bd15e52967b65979b9e5289cd0d7268d497a6729a91ee3be')

build() {
  local _commit=
  _commit=$(bsdcat "$pkgname-$pkgver.tar.gz" | git get-tar-commit-id)
  local -a x=(
    BuildDate="$(TZ=UTC printf '%(%FT%T)TZ' "$SOURCE_DATE_EPOCH")"
    GitCommit="${_commit:?}"
    Version="v$pkgver"
  )
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -trimpath'
  go build -o bin/cr ./cr/main.go
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bin/cr -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  cp -a doc -t "$pkgdir/usr/share/doc/$pkgname"
}
