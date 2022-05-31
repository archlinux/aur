# Maintainer: Straw <straw@pinnoto.org>
pkgname=eturnal
pkgver=1.8.3
pkgrel=1
pkgdesc="Modern, straightforward STUN and TURN server with full IPv6 support."
arch=('i686' 'x86_64' 'aarch64')
url="https://eturnal.net/"
license=('Apache')
depends=(
	'erlang-nox>=22.0'
	'libyaml'
	'openssl'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://eturnal.net/download/eturnal-${pkgver}.tar.gz"
	eturnal.conf
)
sha256sums=('74e3eef81a57569a499aeb0b7a6f055432bce2068a9d6b255fae50399575ecd9'
						'da8fedd8d6e33f23eb333e5631884da77f404398db0e6542d0b30753ee74efa8'
)
install=eturnal.install

build() {
	mkdir $srcdir/eturnal
	cd $pkgname-$pkgver
	./rebar3 as prod tar
	tar -xzf $srcdir/$pkgname-$pkgver/_build/prod/rel/eturnal/$pkgname-$pkgver.tar.gz -C $srcdir/eturnal
}

package() {
	install -m0644 -D "$srcdir/eturnal/etc/eturnal.yml" "$pkgdir/usr/share/doc/eturnal/eturnal.yml"
	install -m0644 -D "$srcdir/eturnal.conf" "$pkgdir/usr/lib/sysusers.d/eturnal.conf"
	install -m0644 -D "$srcdir/eturnal/etc/systemd/system/eturnal.service" "$pkgdir/etc/systemd/system/eturnal.service"
  install -dm0755 $pkgdir/opt/eturnal
  cp -r $srcdir/eturnal $pkgdir/opt
}
