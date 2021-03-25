# Maintainer: Adam Jimerson <vendion at gmail dot com>
# Contributor: j.r <j.r@jugendhacker.de>
# Contributor: Nikolay Arhipov <nikolajs.arhipovs@gmail.com>
# Contributor: codl <aur@codl.fr>

pkgname=wuzz
pkgver=0.5.0
pkgrel=1
pkgdesc="Interactive cli tool for HTTP inspection"
arch=('x86_64' 'i686')
url="https://github.com/asciimoo/wuzz"
license=('AGPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/asciimoo/wuzz/archive/v${pkgver}.tar.gz")
sha256sums=('721ea7343698e9f3c69e09eab86b9b1fef828057655f7cebc1de728c2f75151e')
_goname="github.com/asciimoo/wuzz"


build() {
  rm -rf gopath
  mkdir -p gopath/src/${_goname}
  mv "$srcdir/$pkgname-$pkgver/"* "gopath/src/${_goname}"
  cd "gopath/src/${_goname}"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go get -v
}

package() {
  install -Dm755 "$srcdir/gopath/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
