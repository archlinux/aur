# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor:  Yigit Dallilar <yigit.dallilar@gmail.com>
# Contributor: orumin <dev at orum.in>

pkgname=slack-term
pkgver=0.5.0
pkgrel=4
pkgdesc="Slack client for your terminal"
arch=(x86_64)
url="https://github.com/jpbruinsslot/slack-term"
license=(MIT)
depends=(glibc)
makedepends=(go)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
  "slack-term.json"
)
sha256sums=(
  '089cf10a3959c99b73da1d5ad974f2cd076a56851ef9ffd97a77350a81e527f0'
  'c0115da2947fc14ab7db055c6d597ecc5e765af9ffcf7fa68821540f3c0e9d32'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  sed --in-place "s/VERSION = .*/VERSION = \"$pkgver\"/" main.go
}

build() {
  cd "$_archive"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v .
}

package() {
  cd "$_archive"

  install -Dm755 slack-term "$pkgdir/usr/bin/slack-term"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/slack-term.json" "$pkgdir/etc/slack-term.json"
}
