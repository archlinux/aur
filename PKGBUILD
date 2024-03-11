# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
pkgname=pixelserv-tls
pkgver=2.4
pkgrel=3
pkgdesc="A tiny bespoke webserver for adblock with HTTP/1.1 and HTTPS support"
arch=('any')
url="https://github.com/kvic-z/pixelserv-tls"
license=('LGPL-3.0-only')
depends=('openssl>=1.0.2')
install=$pkgname.install
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/kvic-z/pixelserv-tls/archive/$pkgver.tar.gz"
	"pixelserv-ca-init.sh"
	"pixelserv-tls.service"
	"build-fix.patch")
b2sums=('cec2a713c21b98083c5f00b05a49dae50d5f16f6b1014f0635558ce26d29c11e64a1178fc687234810d33267b5d30d1bea2ce0be9407d102a7b44f4501d92eaa'
        'df250241026b758470b3477e089b54552d74b3ee7b138675349a0c3ab2e76fbe5b09c2e6b7cf3cec40318866b28dbd44cc70dc7707c075dcaceb28803097aa88'
        'd5a7f2c193de9685e8daffedee45619d08b3192c53152302fcd9d97d75338a9906030c3511131872f4d4c7946e1d6e9e5dbb1d9918e3d6c011c0b6278e8b1118'
        '2a9c40c6749a3c72b87267a6e6c0d076378a756176aad5fe964202d6a6fb21150b9a54564ec4259103b35223e2cdaf855c886648368be2ca7c2dd504bf58f6e1')

prepare() {
	cd "$pkgname-$pkgver"
	patch --forward --strip=1 --input="${srcdir}/build-fix.patch"
}

build() {
	cd "$pkgname-$pkgver"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 "$srcdir/pixelserv-tls.service" "$pkgdir/usr/lib/systemd/system/pixelserv-tls.service"
	install -Dm755 "$srcdir/pixelserv-ca-init.sh" "$pkgdir/usr/bin/pixelserv-ca-init"
}
