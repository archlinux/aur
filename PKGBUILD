# Maintainer: Dimitri Pertin <pertin (dot) dimitri (at) protonmail (dot) com>
pkgname=gonic
pkgver=0.11.0
pkgrel=1
pkgdesc='A lightweight music streaming server which implements the Subsonic API'
arch=('x86_64')
depends=('alsa-lib' 'gcc-libs' 'sqlite' 'taglib')
makedepends=('go')
optdepends=('ffmpeg: on-the-fly audio transcoding and caching')
url='https://github.com/sentriz/gonic'
license=('GPL3')
backup=("var/lib/gonic/config")
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/sentriz/gonic/archive/v$pkgver.tar.gz"
        "$pkgname.config.patch"
        "$pkgname.install"
        "$pkgname.service.patch"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles")
md5sums=('f9dd2263a9d5addc10443d42beb51868'
         '240faa29e218962b1ed6c4ce4d138248'
         'd6e8eda0411af60e613819ac957fcc56'
         'c8f973db7a107f8653f7ff36555ce1a0'
         '6ca6715be2cdd424846f7b37b98905f6'
         '487fe9a172e33d86514cf3dbb3b629b8')

prepare() {
        cd "$srcdir/$pkgname-$pkgver"
        patch --forward --strip=1 -i "../$pkgname.config.patch"
        patch --forward --strip=1 -i "../$pkgname.service.patch"
}

build() {
        export CGO_LDFLAGS="${LDFLAGS}"
        export GOFLAGS="-trimpath"
	cd "$srcdir/$pkgname-$pkgver"
	./_do_build_server
}

package() {
	install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
	install -Dm644 "contrib/config" "$pkgdir/var/lib/gonic/config"
	install -Dm644 "contrib/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

