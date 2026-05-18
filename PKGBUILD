# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=mtproto.zig
pkgver=0.24.0
pkgrel=1
pkgdesc="High-performance Telegram MTProto proxy written in Zig"
arch=(any)
url="https://github.com/sleep3r/mtproto.zig"
license=('MIT')
source=("https://github.com/sleep3r/mtproto.zig/archive/v$pkgver.tar.gz"
        "mtproto-proxy.sysusers"
        "mtproto-proxy.service"
        "mtproto-proxy.toml")
makedepends=('zig')
depends=(
	'python'
	'uvicorn'
	'python-fastapi'
	'python-psutil'
	'python-websockets'
)
sha256sums=('44d4a3ce41c90cd3f99df3ef247546bf0033ae157f03ac612f37fdea2a1435b1'
            'd58880e0feeef1e9f157bd7469760e391bccf940a3cb8e1795dbb9bf0434c4d7'
            '7dcd7cf03d013b2d93bcb400867cc8d23f707d54018df3c752caaabe3725a425'
            'a089d6059846f1513ce566225c37b256ae2ac3cd9b18e0d85d1d473f3d067c90')
backup=('etc/mtproto-proxy.toml')
install='mtproto-proxy.install'
build () {
	cd "$pkgname-$pkgver"
	make build
#	sudo zig-out/bin/mtbuddy setup dashboard
}
package() {
	cd "$pkgname-$pkgver"
	install -Dm755 -d "$pkgdir/usr/bin/"
	cp -r zig-out/bin/* "${pkgdir}/usr/bin/"
	install -Dm644 README.md -t "$pkgdir/usr/share/docs/$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 config.toml.example "$pkgdir/etc/mtproto-proxy.toml"
	install -Dm644 "${srcdir}/mtproto-proxy.service" "$pkgdir/etc/systemd/system/mtproto-proxy.service"
	install -Dm644 "${srcdir}/mtproto-proxy.sysusers" "${pkgdir}/usr/lib/sysusers.d/mtproto-proxy.conf"
}
