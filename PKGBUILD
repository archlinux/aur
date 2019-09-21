# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=gitin
pkgver=0.2.3
pkgrel=1
pkgdesc="Commit/branch/workdir explorer for git"
arch=('x86_64')
url="https://github.com/isacikgoz/gitin"
license=('BSD')
depends=('libgit2=1:0.27.8')
makedepends=('go-pie' 'git' 'cmake')
_lg2ver=0.27.0
source=("$pkgname-$pkgver.tar.gz::https://github.com/isacikgoz/$pkgname/archive/v$pkgver.tar.gz"
        "libgit2-$_lg2ver.tar.gz::https://github.com/libgit2/libgit2/archive/v$_lg2ver.tar.gz")
sha256sums=('65bc6f56ef9c8527763ef72d4a334238dbcb60ce2962c319af169236f136b39e'
            '545b0458292c786aba334f1bf1c8f73600ae73dd7205a7bb791a187ee48ab8d2')

prepare() {
	export GOPATH="$srcdir/go"
	mkdir -p "$GOPATH/src"
	ln -s "$srcdir/libgit2-$_lg2ver" "$GOPATH/src/libgit2-$_lg2ver"
	ln -s "$srcdir/$pkgname-$pkgver" "$GOPATH/src/$pkgname-$pkgver"
	
	cd "$GOPATH/src/libgit2-$_lg2ver"
	git submodule update --init
}

build() {
	export GOPATH="$srcdir/go"
	cd "$GOPATH/src/libgit2-$_lg2ver"
	mkdir build && cd build
	cmake \
		-DTHREADSAFE=ON \
		-DBUILD_CLAR=OFF \
		-DCMAKE_BUILD_TYPE="RelWithDebInfo" ..
	make
	
	cd "$GOPATH/src/$pkgname-$pkgver"
	go build \
    	-trimpath \
    	-ldflags "-extldflags $LDFLAGS" \
    	-o $pkgname
}

package() {
	cd "$GOPATH/src/$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
