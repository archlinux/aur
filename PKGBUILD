# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gitin
pkgver=0.2.3+10+gbada3e8
pkgrel=1
pkgdesc="Commit/branch/workdir explorer for git"
arch=('x86_64')
url="https://github.com/isacikgoz/gitin"
license=('BSD')
depends=('libssh2')
makedepends=('go' 'git' 'cmake')
#source=("$pkgname-$pkgname.tar.gz::https://github.com/isacikgoz/$pkgname/archive/v$pkgver.tar.gz")
_commit='bada3e83dd9de92df68e5f05ebd8e4b5ada35830'
source=("git+https://github.com/isacikgoz/gitin.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
	export GOPATH="$srcdir/gopath"
	go clean -modcache

	if [ -d "$srcdir/git2go" ]; then
		rm -rf "$srcdir/git2go"
	fi
}

build() {
	cd "$srcdir/$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	make

	# Clean mod cache for makepkg -C
	go clean -modcache
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
