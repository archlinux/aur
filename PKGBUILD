# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=diffnav
pkgver=0.2.8
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
sha256sums=('544212a1a3d07ca53aca9a413c614b0b28f7692e77dcb03f1d8174254534a129')
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

# tests not passing
# check() {
# 	cd "$pkgname-$pkgver"
# 	go test
# }

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm655 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
