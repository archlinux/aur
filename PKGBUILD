# Maintainer: Byron Torres <b at torresjrjr dot com>

pkgname=astronaut-git
pkgver=0.1.2.r1.g3f41b58
pkgrel=2
pkgdesc="Gemini browser for the terminal"
arch=('x86_64')
url="https://sr.ht/~adnano/astronaut"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go' 'scdoc')
options=('!lto')
source=("$pkgname::git+https://git.sr.ht/~adnano/astronaut#branch=master")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	go mod tidy
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
