# Maintainer: Dimitri Pertin <pertin (dot) dimitri (at) protonmail (dot) com>
pkgname=gonic
pkgver=0.8.4
pkgrel=1
pkgdesc='A lightweight music streaming server which implements the Subsonic API'
arch=('x86_64')
depends=('gcc-libs' 'sqlite' 'taglib')
makedepends=('go')
optdepends=('ffmpeg: on-the-fly audio transcoding and caching')
url='https://github.com/sentriz/gonic'
license=('GPL3')
backup=("usr/lib/systemd/system/$pkgname.service")
source=("$pkgname-$pkgver.tar.gz::https://github.com/sentriz/gonic/archive/v$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.sysusers")
md5sums=('101f627184c59a01162ccd02a7628e90'
         '4b9fae63f961fe8dc230a1e415e50d67'
         '6ca6715be2cdd424846f7b37b98905f6')


build() {
        export CGO_LDFLAGS="${LDFLAGS}"
        export GOFLAGS="-trimpath"
	cd "$srcdir/$pkgname-$pkgver"
	./_do_build_server
        ./_do_build_scanner
}

package() {
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
	install -Dm755 ${pkgname}scan "$pkgdir/usr/bin/${pkgname}scan"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

