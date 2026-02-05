# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=diffnav
pkgver=0.8.1
pkgrel=1
pkgdesc="A git diff pager based on delta but with a file tree, à la Github."
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
url="https://github.com/dlvhdr/diffnav"
license=('MIT')
depends=('glibc' 'git-delta')
makedepends=('go')
optdepends=('otf-commit-mono-nerd: icon support in the terminal')
options=("strip" "buildflags")
source=("$url/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e2304e5cb87c47ff3927f401a97bd24fbbd86ff6e939ad21c51d7e03082821c9')
prepare(){
    cd "$pkgname-$pkgver"
    mkdir -p build
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=2
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    cd "$pkgname-$pkgver"
	go build -o "build/$pkgname"
}

check() {
	cd "$pkgname-$pkgver"
	go test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm655 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
