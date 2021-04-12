# Maintainer: gbr <gbr@protonmail.com>
_pkgname=twittuh
pkgname=twittuh-git
pkgver=r100.e1bd11b
pkgrel=2
pkgdesc='Make RSS, ATOM, or JSON feeds from Twitter timelines'
arch=('x86_64')
url='https://github.com/derat/twittuh'
license=('BSD')
depends=('chromium')
makedepends=('git' 'go')
source=("$_pkgname::git+https://github.com/derat/twittuh.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  go build \
    -o "$_pkgname" \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-extldflags \"${LDFLAGS}\"" \
    .
}

check() {
  cd "$_pkgname"
  go test -v ./...
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
