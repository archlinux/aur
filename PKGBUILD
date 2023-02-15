# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
pkgname=pixelserv-tls
pkgver=2.4
pkgrel=2
pkgdesc="A tiny bespoke webserver for adblock with HTTP/1.1 and HTTPS support"
arch=('any')
url="https://github.com/kvic-z/pixelserv-tls"
license=('GPL3')
depends=('openssl>=1.0.2')
install=$pkgname.install
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/kvic-z/pixelserv-tls/archive/$pkgver.tar.gz"
	"pixelserv-ca-init.sh"
	"pixelserv-tls.service"
	"build-fix.patch")
b2sums=('cec2a713c21b98083c5f00b05a49dae50d5f16f6b1014f0635558ce26d29c11e64a1178fc687234810d33267b5d30d1bea2ce0be9407d102a7b44f4501d92eaa'
        '9e482f626c9e2451c29ee7d384b984d4d7a1fc580e5b343ba92d5301009676c336d53b0b409bbdde162f8a4f80f3a3b14fc27a801fba7f84e1a1961d80e759c0'
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
