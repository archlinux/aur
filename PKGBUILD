# Maintainer: Byron Torres <b at torresjrjr dot com>

pkgname=astronaut-git
pkgver=0.1.2.r1.g3f41b58
pkgrel=1
pkgdesc="Gemini browser for the terminal"
arch=('x86_64')
url="https://sr.ht/~adnano/astronaut"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go' 'scdoc')
options=('!lto')
source=(
	"$pkgname::git+https://git.sr.ht/~adnano/astronaut#branch=master"
	'Makefile.patch'
)
sha256sums=(
	'SKIP'
	'8e1d4bb411d3d678a9feb4bcfc53954279ebe0fb4c3a4583a3b7a541c05edcd2'
)

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
