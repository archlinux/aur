# Maintainer: Mentigen <Kis-Ilya-A@yandex.ru>
pkgname=ghost-pause-git
_pkgname=ghost-pause
pkgver=r3.2d3b2f5
pkgrel=1
pkgdesc="Automatically pause media players when a browser plays audio"
arch=('x86_64' 'aarch64')
url="https://github.com/mentigen/ghost-pause"
license=('MIT')
depends=('libpulse' 'dbus')
makedepends=('go' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  if git describe --long --tags --abbrev=7 &>/dev/null; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cd "$_pkgname"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags="-linkmode=external -X main.version=$pkgver" \
    -o "$_pkgname" \
    .
}

check() {
  cd "$_pkgname"
  go test ./...
}

package() {
  cd "$_pkgname"

  install -Dm755 "$_pkgname"            "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.service"    "$pkgdir/usr/lib/systemd/user/$_pkgname.service"
  install -Dm644 config.example.json    "$pkgdir/usr/share/$_pkgname/config.example.json"
  install -Dm644 LICENSE                "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
