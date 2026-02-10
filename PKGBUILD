# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=termshot
pkgver=0.6.1
pkgrel=1
pkgdesc='Generate beautiful screenshots of your terminal, from your terminal (w/ font patch)'
arch=(x86_64)
url="https://github.com/homeport/$pkgname"
depends=(glibc)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz"
        https://github.com/jmpaz/termshot/commit/8d62a321.patch)
sha256sums=('40abea3c9ae604f3c2cdc7e2a623bf6063c6b1c504a70c5e3a1b8457dbdd2fbc'
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
