# Maintainer: robertfoster

pkgname=pump.io
pkgver=5.1.4
pkgrel=1
pkgdesc="A stream server that does most of what people really want from a social network"
url='http://pump.io'
license=('Apache')
arch=('i686' 'x86_64')
depends=('nodejs' 'graphicsmagick')
optdepends=('mongodb' 'redis')
provides=('pumpio')
conflicts=('pumpio-git' 'pumpio')
install=${pkgname}.install
backup=(etc/webapps/$pkgname/$pkgname.json)
source=(https://github.com/pump-io/pump.io/archive/v$pkgver.tar.gz
	"$pkgname.sysusers")

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
	npm prune --production

	msg2 "Installing systemd service"
	install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
        install -D -m644 "${srcdir}/$pkgname.sysusers" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"

	install -Dm755 -d "$pkgname.json.sample" "$pkgdir/etc/$pkgname.json"
	rm -rf $pkgdir/usr/etc
	chmod 755 $pkgdir/usr/lib/node_modules/
}

md5sums=('bbed99788547daa2bbfcdd7f2055aceb'
         '6e86aca928cf55108fcc8b7403cd2b39')
