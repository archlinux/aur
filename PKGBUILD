# Maintainer: Rafael Epplée <aur (at) rafa (dot) ee>
pkgname=gonic
pkgver=0.16.3
pkgrel=1
pkgdesc='A lightweight music streaming server which implements the Subsonic API'
arch=('x86_64' 'armv7h')
depends=('gcc-libs' 'sqlite' 'taglib')
makedepends=('go' 'zlib')
optdepends=('ffmpeg: on-the-fly audio transcoding and caching' 'mpv: jukebox mode')
url='https://github.com/sentriz/gonic'
license=('GPL3')
backup=("var/lib/gonic/config")
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/sentriz/gonic/archive/v$pkgver.tar.gz"
        "$pkgname.install"
        "$pkgname.service.patch"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles")
md5sums=('8fa666ad0d80d5e9a3ecec4af4dd723e'
         'd6e8eda0411af60e613819ac957fcc56'
         'ff0d388a71398a4a9906ee068283f57e'
         '6ca6715be2cdd424846f7b37b98905f6'
         '487fe9a172e33d86514cf3dbb3b629b8')

prepare() {
        cd "$srcdir/$pkgname-$pkgver"
        patch --forward --strip=1 -i "../$pkgname.service.patch"
}

build() {
        export CGO_LDFLAGS="${LDFLAGS}"
        export GOFLAGS="-trimpath"
	cd "$srcdir/$pkgname-$pkgver"
	go build -o gonic cmd/gonic/gonic.go
}

package() {
	install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
	install -Dm644 "contrib/config" "$pkgdir/var/lib/gonic/config"
	install -Dm644 "contrib/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

