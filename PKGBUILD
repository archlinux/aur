# Maintainer: Roshless <pkg@roshless.com>

pkgname=mumbledj
pkgrel=3
pkgver=3.2.0
pkgdesc='Mumble bot for playing audio'
url='https://git.roshless.me/~roshless/mumbledj'
arch=('x86_64' 'i686')
license=('MIT')
install=mumbledj.install
source=("https://git.roshless.me/roshless/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
	"mumbledj.service"
	"mumbledj.sysusers"
	"mumbledj.tmpfiles")

depends=('ffmpeg' 'youtube-dl')
optdepends=('aria2')
makedepends=('git' 'go')

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
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('373fd5294e954fa855dd38b98b7c2b4c'
         '6584a036d03644704867a5b79b35e491'
         'f2f85bec016b1431be94af553fd57173'
         '60e800293a47a562623cb91166950984')
