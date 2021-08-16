# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=astronaut-git
pkgver=r319.28d3aac
pkgrel=1
pkgdesc="A Gemini browser for the terminal"
arch=('x86_64')
url="https://git.sr.ht/~adnano/astronaut"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go' 'scdoc')
install=
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	sed -i '/-ldflags/d' Makefile
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
