# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=go-webring-git
_name="${pkgname%-git}"
pkgver=r59.0b80d60636e1
pkgrel=1
pkgdesc="Simple webring implementation created for Fediring."
arch=('x86_64')
url="https://git.sr.ht/~amolith/go-webring"
license=('BSD-style')
makedepends=('git'
             'go')
source=("git+https://git.sr.ht/~amolith/go-webring")
sha256sums=('SKIP')
provides=("$_name")
conflicts=("$_name")

pkgver() {
  cd "$_name"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_name"
  go mod download
}

build() {
  cd "$_name"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  cd "$_name"

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/licenses/$_name"
  install -d "$pkgdir/usr/share/defaults/$_name"

  install -D $_name "$pkgdir/usr/bin"
  install -D LICENSES/BSD-2-Clause.txt "$pkgdir/usr/share/licenses/$_name"
  install -D LICENSES/CC0-1.0.txt "$pkgdir/usr/share/licenses/$_name"
  install -D list.txt.license "$pkgdir/usr/share/licenses/$_name"
  install -D list.txt "$pkgdir/usr/share/defaults/$_name"
}

# vim:set ts=2 sw=2 et:
