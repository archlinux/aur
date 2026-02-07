# Maintainer: Celsiuss <celsiuss@await.sh>
pkgname=aurora-ui-git
_pkgname=aurora
pkgver=2.2.r17.g8ddad1a
pkgrel=1
pkgdesc="Cross-platform beanstalkd queue server admin console."
arch=('x86_64')
url="https://xuri.me/aurora/"
license=('MIT')
provides=("aurora")
conflicts=("aurora")
depends=(glibc)
makedepends=(go git)

_commit="8ddad1a3ff5296e74ac6fa1e25aba9432908f26e"
source=("$pkgname::git+https://github.com/xuri/aurora.git#commit=$_commit")
sha256sums=('c343e2db6327d8f7ae3df2ae196cd0114a5a1ebb0b743b0e063d43ca84eb9e7a')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	mkdir -p build/
}

build() {
	cd "$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build .
}

check() {
	cd "$pkgname"
	./build/aurora -v > /dev/null
}

package() {
	cd "$pkgname"
	install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}

