# Maintainer: aksr <aksr at t-com dot me>
pkgname=bug-git
pkgver=r246.d7f4e7f
pkgrel=1
pkgdesc='Distributed bug tracking with the filesystem and hg or git'
arch=('i686' 'x86_64')
url='https://github.com/driusan/bug'
license=('GPL3')
makedepends=('git' 'go>=1.9')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	go mod init "${url#https://}"
	go mod tidy
}

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	mkdir -p build/
	go build -v -o build .
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 build/bug "$pkgdir/usr/bin/bug"
	install -D -m644 README.md $pkgdir/usr/share/licenses/$pkgname/README.md
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
