# Maintainer: Mia Sireneva <owlnull@riseup.net>

pkgname=rtsp-simple-server-bin
pkgver=0.21.0
pkgrel=1
pkgdesc='Ready-to-use RTSP / RTMP / LL-HLS server and proxy that allows to read, publish and proxy video and audio streams'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/aler9/rtsp-simple-server'
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
backup=("etc/${pkgname%-bin}/${pkgname%-bin}.yml")

source=(
	"${pkgname%-bin}.sysusers"
	"${pkgname%-bin}.tmpfiles"
	"${pkgname%-bin}.service"
	"package.patch"
)
source_x86_64=("https://github.com/aler9/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}_v${pkgver}_linux_amd64.tar.gz")
source_armv7h=("https://github.com/aler9/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}_v${pkgver}_linux_armv7.tar.gz")
source_aarch64=("https://github.com/aler9/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}_v${pkgver}_linux_arm64v8.tar.gz")

sha256sums=(
	'206de7ab940607b4fabb135959ba9a2dc89e97e4aaa6ff73762504ef409b5c89'
	'b9ee559f1cf47509a6f0fb50def67671c4ace4ef52519b3198ac18a8129ec8d8'
	'1498445638b106afdcf73309bcba8859b458abb7b30ce86af4d3e03f68bde251'
	'f53f26b58da00e6f0d611e95f61a33fd7efec04f372e49db5dfb0dd16c5cc6e9'
)
sha256sums_x86_64=('d2ea21d5430f0d9ccefaaf337fd63add50dd70be5ce8431af0e01a018d530e22')
sha256sums_armv7h=('72c70ba2535a39072dedfd88d56793bf6be80030aff1ee327c08adc4c5f6ed22')
sha256sums_aarch64=('e53ff5bf778ad42006fa7d9449f9005f6d2c18c71e1db896172211158b13e949')

prepare() {
	cd "$srcdir"
	patch --forward --strip=1 --input="package.patch"
}

package() {
	cd "$srcdir"

	install -dm755 "$pkgdir/etc/${pkgname%-bin}"

	install -Dm755 "$srcdir/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm600 "$srcdir/${pkgname%-bin}.yml" "$pkgdir/etc/${pkgname%-bin}/${pkgname%-bin}.yml"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "$srcdir/${pkgname%-bin}.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$srcdir/${pkgname%-bin}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

	install -Dm644 "$srcdir/${pkgname%-bin}.service" "$pkgdir/usr/lib/systemd/system/${pkgname%-bin}.service"
}
