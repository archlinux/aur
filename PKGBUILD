# Maintainer: Mathieu Tortuyaux <mathieu.tortuyaux@gmail.com>
pkgname=terracognita-git
_pkgname=terracognita
pkgver=v0.3.0.r27.gdfc5a99
pkgrel=1
epoch=1
pkgdesc="Reads from existing Cloud Providers (reverse Terraform) and generates your infrastructure as code on Terraform configuration"
provides=($_pkgname)
conflicts=($_pkgname)
arch=('i686' 'x86_64')
url="https://github.com/cycloidio/$_pkgname"
license=('MIT')
makedepends=('go>=2:1.11')
source=("$pkgname::git+https://github.com/cycloidio/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
  	git describe --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
  	VERSION=$(git describe --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
	GO111MODULE=on \
	CGO_ENABLED=0 \
	GOARCH=amd64 \
	go build \
		-o $_pkgname \
		-gcflags "all=-trimpath=${PWD}" \
		-asmflags "all=-trimpath=${PWD}" \
		-ldflags "-X github.com/cycloidio/terracognita/cmd.Version=${VERSION}"
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
