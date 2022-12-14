# Maintainer: Mia Sireneva <owlnull@riseup.net>

pkgname=rtsp-simple-server-bin
pkgver=0.20.4
pkgrel=1
pkgdesc="Ready-to-use RTSP / RTMP / LL-HLS server and proxy that allows to read, publish and proxy video and audio streams"
arch=('x86_64' 'aarch64')
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

sha256sums=(
	'206de7ab940607b4fabb135959ba9a2dc89e97e4aaa6ff73762504ef409b5c89'
	'8985c12c8ba83e051f4e2edf37ee7e9be0d9f05d25f5c1d517cde0a59bec740d'
	'1498445638b106afdcf73309bcba8859b458abb7b30ce86af4d3e03f68bde251'
	'f53f26b58da00e6f0d611e95f61a33fd7efec04f372e49db5dfb0dd16c5cc6e9'
)

source_x86_64=(
	"https://github.com/aler9/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}_v${pkgver}_linux_amd64.tar.gz"
)
sha256sums_x86_64=('5aae425ae481cbe9e1d1319814d47786826f7cb94f819f801a26fe226cc4e004')

source_aarch64=(
	"https://github.com/aler9/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}_v${pkgver}_linux_arm64v8.tar.gz"
)
sha256sums_aarch64=('4f30ee9c66581e09f32f8b7744712716e8c453bc6630ab57ea8ef313c7eb3a47')

prepare() {
	cd "$srcdir"
	patch --forward --strip=1 --input="package.patch"
}

package() {
	cd "$srcdir"

	install -dm700 "$pkgdir/etc/${pkgname%-bin}"

	install -Dm755 "$srcdir/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm600 "$srcdir/${pkgname%-bin}.yml" "$pkgdir/etc/${pkgname%-bin}/${pkgname%-bin}.yml"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "$srcdir/${pkgname%-bin}.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$srcdir/${pkgname%-bin}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

	install -Dm644 "$srcdir/${pkgname%-bin}.service" "$pkgdir/usr/lib/systemd/system/${pkgname%-bin}.service"
}
