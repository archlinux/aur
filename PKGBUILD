# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=xq
pkgver=1.3.0
pkgrel=2
pkgdesc='Command-line XML and HTML beautifier and content extractor'
arch=('x86_64')
url='https://github.com/sibprogrammer/xq'
license=('MIT')
makedepends=('go')
conflicts=('yq')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6f75b4433ac83b9ddbc60e1106349e22654d14bb58e198f811b2f9d10181ee8f')

prepare() {
	cd "${pkgname}-${pkgver}"
	mkdir -p build/
}

build() {
	cd "${pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build .
}

package() {
	cd "${pkgname}-${pkgver}"

  #binary
	install -Dm755 build/$pkgname "$pkgdir/usr/bin/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr assets "$pkgdir/usr/share/doc/$pkgname"

  # man
  install -vDm644 docs/xq.man "$pkgdir/usr/share/man/man1/$pkgname.1"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
