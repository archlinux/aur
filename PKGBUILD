# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: aksr <aksr at t-com dot me>

pkgname=gomacro-git
_pkg="${pkgname%-git}"
pkgver=2.7.r602.g12bd30a
pkgrel=1
pkgdesc="Interactive Go interpreter and debugger with REPL, Eval, generics and Lisp-like macros"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/cosmos72/gomacro"
license=('MPL2')
depends=('glibc')
makedepends=('git' 'go')
provides=("$_pkg")
conflicts=("$_pkg")
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$_pkg"
	mkdir -p build
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	cd "$_pkg"
	go build -o build
}

check() {
	cd "$_pkg"
	go test ./... || printf "\n\nTests failed.\n\n"
}

package() {
	cd "$_pkg"
	install -Dv "build/$_pkg" -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
