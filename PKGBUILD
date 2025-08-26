# Maintainer:

_pkgname="zvm"
pkgname="$_pkgname-git"
pkgver=0.8.8.r0.g71b7405
pkgrel=1
pkgdesc="A version manager for Zig compilers"
url="https://github.com/tristanisham/zvm"
license=('MIT')
arch=('x86_64')

depends=(
  'glibc'
)
makedepends=(
  'go'
  'git'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip' '!debug')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() (
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
)

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$_pkgsrc"
  go build -o . ./...
}

package() {
  install -Dm755 "$_pkgsrc/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
