# Maintainer: Liam Barrack <liam@liambarrack.com>
pkgname=leetui-git
_pkgname=leetui
pkgver=0.0.4.r0.g1f28c5a
pkgrel=1
pkgdesc="A terminal UI for browsing and solving LeetCode problems (development version)"
arch=('x86_64' 'aarch64')
url="https://github.com/lbarto12/leetui"
license=('MIT')
makedepends=('go' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # tag-based version when reachable, else r<count>.g<sha>
  ( git describe --long --tags --abbrev=7 2>/dev/null \
      | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ) \
    || printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgname"
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  go build -ldflags="-s -w -X main.Version=$pkgver" -o "$_pkgname" .
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE     "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 README.md   "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
