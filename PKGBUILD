# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Kaio "yaakushi" Augusto <kaioaugusto dot 8 at gmail dot com>
# Contributor: matthias.lisin
# Contributor: Bruno Inec <bruno at inec dot fr>

pkgname=wtfutil
pkgver=0.36.0
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=('x86_64' 'aarch64' 'armv6h')
url="https://wtfutil.com"
license=('MPL2')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wtfutil/wtf/archive/v$pkgver.tar.gz")
sha256sums=('6994cc1972d03b59d5c4a5028e9250fa9ec4c14856f902bcf7437339f01b141e')

prepare() {
	export GOPATH="$srcdir/gopath"
	go clean -modcache
}

build() {
	cd "wtf-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS+="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
 	make

 	# Clean mod cache for makepkg -C
	go clean -modcache
}

package() {
	cd "wtf-$pkgver"
	install -Dm755 "bin/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 {README,CHANGELOG}.md -t "$pkgdir/usr/share/doc/$pkgname"
    cp -r _sample_configs "$pkgdir/usr/share/doc/$pkgname/sample_configs"
}
