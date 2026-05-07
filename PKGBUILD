# Maintainer: Dan Finlay <namelessdan@gmail.com>
pkgname=unfold-git
_pkgname=unfold
pkgver=0.1.1.r1.geb04830
pkgrel=1
pkgdesc="Flatpak wrapper that shows app permissions before install/update (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/danfinlay/unfold"
license=('MIT')
depends=('flatpak')
makedepends=('go' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgname"
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  go build -ldflags="-s -w" -o "$_pkgname" ./cmd/unfold
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 scripts/unfold-shim.sh "$pkgdir/usr/share/$_pkgname/unfold-shim.sh"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
