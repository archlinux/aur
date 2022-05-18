# Maintainer: Roshless <pkg@roshless.com>

pkgname=gofu
pkgrel=3
pkgver=1.1.3
pkgdesc='Simple file share service in go'
url='https://git.roshless.me/~roshless/gofu'
arch=('x86_64' 'i686')
license=('AGPL')
provides=("$pkgname")
conflicts=("$pkgname")
depends=('glibc')
makedepends=('git' 'go')
install=gofu.install
backup=('var/lib/gofu/config.ini')
source=("https://git.roshless.me/roshless/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
	"gofu.service"
	"gofu.sysusers"
	"gofu.tmpfiles")

build() {
	cd $pkgname-$pkgver
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -o $pkgname .
}

package() {
	install -Dm644 $pkgname.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 $pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

	cd $pkgname-$pkgver
	install -Dm755 $pkgname -t "$pkgdir/usr/bin/"
	install -D "dist/config.ini" "$pkgdir/var/lib/$pkgname/config.ini"
}

md5sums=('b226e3fdf410460d14a672cd7b4f52d0'
         'b85e2bf437eb4528a319f797c18c2fc3'
         'b7e1a3c7f09bed0d04e918d7a0a87be7'
         '279dcf052b7ac8b83a8781b36071c47e')
