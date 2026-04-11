# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=mtproto.zig
pkgver=0.16.0
pkgrel=1
pkgdesc="High-performance Telegram MTProto proxy written in Zig"
arch=(any)
url="https://github.com/sleep3r/mtproto.zig"
license=('MIT')
source=("https://github.com/sleep3r/mtproto.zig/archive/v$pkgver.tar.gz"
        "mtproto-proxy.sysusers"
        "mtproto-proxy.service"
        "mtproto-monitor.service"
        "mtproto-proxy.toml")
makedepends=('zig')
depends=(
	'python'
	'uvicorn'
	'python-fastapi'
	'python-psutil'
	'python-websockets'
)
sha256sums=('17e0d62cf214a78f972c4a4dbf0e3c41049c3eadbf649cea1759b350a735a797'
            'd58880e0feeef1e9f157bd7469760e391bccf940a3cb8e1795dbb9bf0434c4d7'
            '262a7da689f7710ad69953291f2baf42e681868a451bad4d346a9c674ea6705f'
            'd2081ca0a94892a538c145f2f429fe9f45d55b389d4622e87bbf436207301946'
            'a089d6059846f1513ce566225c37b256ae2ac3cd9b18e0d85d1d473f3d067c90')
backup=('etc/mtproto-proxy.toml')
install='mtproto-proxy.install'
build () {
	cd "$pkgname-$pkgver"
	make build
}
package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "zig-out/bin/mtproto-proxy" "$pkgdir/usr/bin/mtproto-proxy"
	install -Dm755 -d "${pkgdir}/usr/share/webapps/mtproto-proxy/monitor"
	cp -r deploy/monitor/* "${pkgdir}/usr/share/webapps/mtproto-proxy/monitor/"
	install -Dm644 README.md -t "$pkgdir/usr/share/docs/$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "${srcdir}/mtproto-proxy.toml" "$pkgdir/etc/mtproto-proxy.toml"
	install -Dm644 "${srcdir}/mtproto-proxy.service" "$pkgdir/etc/systemd/system/mtproto-proxy.service"
	install -Dm644 "${srcdir}/mtproto-monitor.service" "$pkgdir/etc/systemd/system/mtproto-monitor.service"
	install -Dm644 "${srcdir}/mtproto-proxy.sysusers" "${pkgdir}/usr/lib/sysusers.d/mtproto-proxy.conf"
}
