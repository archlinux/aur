# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

pkgname=envman-git
_pkgname="${pkgname%-git}"
pkgver=2.7.0.r1.gc205d5e
pkgrel=1
pkgdesc="Manage Environment Variable collections"
arch=(aarch64 x86_64)
url="https://github.com/bitrise-io/${_pkgname}"
license=(MIT)
depends=(glibc)
makedepends=(git go)
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  export GOPATH="$srcdir"
  go mod download -modcacherw
  mkdir -p build
}

build() {
  cd "$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"
  go build -o build/envman .
}

check() {
  cd "$_pkgname"
  go test ./... -skip 'Test_EnvsSerializeModel_Normalize'
}

package() {
  cd "$_pkgname"
  install -Dm755 build/envman -t "$pkgdir/usr/bin/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
