# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=termshot
pkgver=0.6.0
pkgrel=2
pkgdesc='Generate beautiful screenshots of your terminal, from your terminal (w/ font patch)'
arch=(x86_64)
url="https://github.com/homeport/$pkgname"
depends=(glibc)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz"
        https://github.com/jmpaz/termshot/commit/8d62a321.patch)
sha256sums=('61acbacbed1d761965a46f379dbaf81c459e4c310d5b85972737b891b0a5aa09'
            '7a1951853679355a109ec66d24835afbb3a3f4ff3b0b5aa3ee371296945aafb0')

prepare() {
	cd "$_archive"
	rm -f hack/download.sh
	patch -p1 -i ../8d62a321.patch
}

build() {
	cd "$_archive"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"$LDFLAGS\"" \
		./cmd/termshot
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname"
}
