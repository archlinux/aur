# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>

pkgname=whosthere
pkgver=0.7.1
pkgrel=1
pkgdesc='Local Area Network discovery tool'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/ramonvermeulen/whosthere"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver")
sha512sums=('fbdf624b49dce3ab52a966973e22dcb3957df9e5b49eb8c342f3cbe2e884ce9b712133c8d52ea9de900a29a3a3ca556dee46c9dce0ce9487cdfcdf553082a5e1')

prepare() {
	cd $pkgname
	export GOPATH="${srcdir}"
	go mod download -modcacherw
}

build() {
	cd $pkgname
	export GOPATH="${srcdir}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build
}

package() {
	cd $pkgname
	install -Dm755 "build" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/" 
}
