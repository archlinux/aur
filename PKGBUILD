# Maintainer:
# Contributor: scrouthtv <scrouthtv 0x40 gmail 0x2e com>

_pkgname="dbus-inspect"
pkgname="$_pkgname-git"
pkgver=r8.dcffffe
pkgrel=1
pkgdesc="Command-line D-Bus inspector written in Go"
url="https://github.com/amenzhinsky/dbus-inspect"
license=('MIT')
arch=('x86_64')

depends=('glibc')
makedepends=(
  'git'
  'go'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgsrc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$_pkgsrc"
  go build .
}

package() {
  install -Dm755 "$_pkgsrc/dbus-inspect" -t "$pkgdir/usr/bin/"
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
