# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=github-release
_name=github-release
_author=github-release
pkgver=0.9.0
pkgrel=1
pkgdesc="Command-line app to create and edit releases on GitHub (and upload artifacts)"
arch=('i686' 'x86_64')
url="https://github.com/github-release/${pkgname}"
makedepends=('go')
depends=('glibc' 'git' 'golang-github-dustin-go-humanize' 'golang-github-voxelbrain-goptions')
conflicts=("${pkgname}-bin")
license=('MIT')
source=("$_name-$pkgver::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('e215215bbb16ac8b275fd710c400b5ac1125b84250f05b276a75830536494f8b9db374021d135a952a456e9419bac952fd2258ef79d1175d539f70cf8a4c1cb8')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/build:/usr/share/gocode"
  mkdir -p "$srcdir/build/src/github.com/$_author"
  cp -a $srcdir/$_name-$pkgver "$srcdir/build/src/github.com/$_author/$_name"
}

build() {
  cd "$srcdir/build/src/github.com/$_author/$_name"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o $srcdir/build/
}

package() {
  install -Dm755 $srcdir/build/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 $srcdir/$pkgname-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
