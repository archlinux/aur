# Maintainer: wommel <aur at impium dot de>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=telerising-api-bin
pkgver=0.14.6
pkgrel=1
pkgdesc='API web application providing Zattoo TV streams'
arch=('x86_64')
license=('custom')
url='https://github.com/sunsettrack4/telerising-api'
options=(!strip)
depends=('libxcrypt-compat')
source=(
	"https://github.com/sunsettrack4/telerising-api/releases/download/v${pkgver}/telerising-v${pkgver}_x86-64_linux.zip"
	"$pkgname.service"
	startup.sh
)
sha512sums=(
	96b6c4ab96b21cb460ceb36b16241fb1236aeea4fdc11038e6c9388de15bef7afbe3d343451a29c91ea6a48ae04587d6d6334e9a186a9968af8f83ea0963d043 # telerising-v${pkgver}_x86-64_linux.zip
	be39dd0f5c079477969abcdbdaca6c74557772d8beefd7c0ff4194217cab5da83bde6051cd96355d47de209db2bad257a94267326e91292471a5b0580cf095e7 # telerising-api-bin.service
	8d50a8b56efc882f247af83714916abe9f1d2e87830614f38d01790c04f0c0a7c7192e72426d1f4b6c90edc9a705f9e86b5fe7d44543a5755ffdfda2d894d313 # startup.sh
)

package() {
	mkdir -p "$pkgdir/usr/lib/$pkgname/certifi"

	for file in api app _contextvars.so _cffi_backend.so _ssl.so _ctypes.so cryptography curl_cffi
	do
		mv "$srcdir/telerising/$file" "$pkgdir/usr/lib/$pkgname/"
	done

	ln -s /etc/ssl/cert.pem "$pkgdir/usr/lib/$pkgname/certifi/cacert.pem"

	install -Dm0755 "$srcdir/startup.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
