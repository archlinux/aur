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
						'c1b61cfa9bb7a48f1b8a29467782801f5da679dbe196728da2ed9972e678ff5a'
)
install=eturnal.install

build() {
	mkdir $srcdir/eturnal
	cd $pkgname-$pkgver
	./rebar3 as prod tar
	tar -xzf $srcdir/$pkgname-$pkgver/_build/prod/rel/eturnal/$pkgname-$pkgver.tar.gz -C $srcdir/eturnal
}

package() {
	mkdir -p $pkgdir/opt/eturnal
	cp -r $srcdir/eturnal $pkgdir/opt
	install -m0644 -D "$pkgdir/opt/eturnal/etc/eturnal.yml" "$pkgdir/usr/share/doc/eturnal/eturnal.yml"
	install -m0644 -D "$srcdir/eturnal.conf" "$pkgdir/usr/lib/sysusers.d/eturnal.conf"
	install -m0644 -D "$pkgdir/opt/eturnal/etc/systemd/system/eturnal.service" "$pkgdir/etc/systemd/system/eturnal.service"
}
