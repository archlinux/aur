# Maintainer: Straw <straw@pinnoto.org>
pkgname=eturnal
pkgver=1.12.2
pkgrel=1
pkgdesc="Modern, straightforward STUN and TURN server with full IPv6 support."
arch=('i686' 'x86_64' 'aarch64')
url="https://eturnal.net/"
license=('Apache')
depends=(
	'erlang-headless'
	'libyaml'
	'openssl'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://eturnal.net/download/eturnal-${pkgver}.tar.gz"
	eturnal.conf
)
sha256sums=('904157ff96fb5baca469ab2ebe4c273e6b348fde31080cc2a0bb971a5963fcdb'
            'da8fedd8d6e33f23eb333e5631884da77f404398db0e6542d0b30753ee74efa8')
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
