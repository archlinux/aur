# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

_pkgname='ov'
pkgname="${_pkgname}-git"
pkgver=0.33.0.r0.ge415836
pkgrel=2
pkgdesc='Feature-rich terminal-based text pager (built from latest git commit)'
arch=('x86_64' 'aarch64')
url='https://github.com/noborus/ov'
license=('MIT')
provides=('ov')
conflicts=('ov' 'ov-bin')
depends=('glibc')
makedepends=('git' 'go')
source=('git+https://github.com/noborus/ov.git')
options=('lto')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  mkdir -p build
  go mod tidy
}

build() {
  cd "$_pkgname"

  _pkgver=$(git describe --tags --abbrev=0 --always)
  _pkgrev=$(git rev-parse --verify --short HEAD)

  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.Version=$_pkgver -X main.Revision=$_pkgrev" \
    -mod=readonly -modcacherw \
    -o build
}

check() {
  cd "$_pkgname"

  go test
}

package() {
  cd "$_pkgname"

  install -vDm0755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -vDt "$pkgdir/usr/share/doc/$pkgname" -m0644 *.yaml README.md
  install -vDm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
