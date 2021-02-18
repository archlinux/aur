# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cod-git
pkgver=0.0.0.r18.g040975b
pkgrel=1
pkgdesc="A completion daemon for bash/zsh"
arch=('any')
url="https://github.com/dim-an/cod"
license=('Apache-2.0')
makedepends=('git' 'go')
optdepends=('bash-completion')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/dim-an/cod.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	# Prevent creation of a `go` directory in one's home.
	# Sometimes this directory cannot be removed with even `rm -rf` unless
	# one becomes root or changes the write permissions.
	export GOPATH="$srcdir/gopath"
	go clean -modcache
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export GOPATH="$srcdir/gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -v -o "${pkgname%-git}" .

	# Clean now to ensure makepkg --clean works
	go clean -modcache
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 "${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
