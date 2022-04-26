# Maintainer: Mert Ersoy <mertmit99@gmail.com>
pkgname='cortile-git'
_pkgname=${pkgname%-git}
pkgver=1.0.0a4.r2.g5c55b9e
pkgrel=1
pkgdesc='Tiling manager with hot corner support for Xfce and other EWMH Compliant Window Managers.'
arch=('x86_64')
url='https://github.com/leukipp/cortile'
license=('MIT')
depends=()
makedepends=('git' 'go>=1.17')
optdepends=('xorg-server: with EWMH Complaint Window Managers')
provides=('cortile')
conflicts=()
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
  export GOPATH="$srcdir"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build
}

package() {
	cd "$_pkgname"
  install -Dm755 ./$_pkgname  "$pkgdir/usr/bin/cortile"
  install -Dm644 ./README.md  "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 ./LICENSE    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
