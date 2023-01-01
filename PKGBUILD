# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

## Credit to ayatale for the systemd and config files

pkgname=alist
pkgver=3.7.2
pkgrel=1
pkgdesc="File list program that supports multiple storage"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'arm7vh' 'aarch64')
url="https://github.com/xhofe/alist"
license=('AGPL3')
depends=('glibc')
makedepends=('go')
backup=('etc/alist/config.json')
install=alist.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'alist.service'
        'alist.tmpfiles'
        'config.json')
sha256sums=('339277691fb372b21c5dd274c31684d65dd5b3efe9871ea0e07f7ce406775db1'
            'b96d55f7e83310a7556a5b023be60e12f44c484e3e136f1488d737126c9ed34f'
            '48eb4f8f1070cfd2f9594fe72cb4b1a35fce091251fda11e2082f573f62ac12b'
            'ba9cd5b593313183ad8c0f008a6edba539063193c416d3893a5344e104a3fff1')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	cd "$pkgname-$pkgver"
	## i tried, doesn't actually tag properly
	go build -o build \
		-ldflags="-linkmode external -extldflags \"${LDFLAGS}\" \
		-X 'github.com/Xhofe/alist/conf.GoVersion=$(go version | awk '{print $3}')' \
		-X 'github.com/Xhofe/alist/conf.GitTag=$pkgver'"
}

## FIXME: tests require an active connection
# check() {
# 	export CGO_CPPFLAGS="${CPPFLAGS}"
# 	export CGO_CFLAGS="${CFLAGS}"
# 	export CGO_CXXFLAGS="${CXXFLAGS}"
# 	export CGO_LDFLAGS="${LDFLAGS}"
# 	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
# 	cd "$pkgname-$pkgver"
# 	go test ./...
# }

package() {
	cd "$pkgname-$pkgver"
	install -Dv "build/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 "$srcdir/alist.service" -t "$pkgdir/usr/lib/systemd/system/"
	install -Dvm644 "$srcdir/alist.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dvm644 "$srcdir/config.json" -t "$pkgdir/etc/$pkgname/"
}
