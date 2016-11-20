# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>
pkgname='thelounge'
_npmname='thelounge'
pkgver=2.1.0
pkgrel=1
pkgdesc="Web-based IRC client - Official community fork of Shout"
url='https://thelounge.github.io/'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
install=install
backup=('etc/thelounge/config.js')
source=(
	"http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz"
	"system.service"
	"user.service"
)
noextract=("$_npmname-$pkgver.tgz")
sha256sums=(
	'19f243fc32dc4762caf933b29feeab6edea332764304dbc2f4a22bcc460a5e2b'
	'SKIP'
	'SKIP'
)

package() {
	local _etc="$pkgdir/etc/$pkgname"
	
	npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
	
	install -dm700 "$_etc" "$_etc/users"
	install -Dm600 \
		"$pkgdir/usr/lib/node_modules/$_npmname/defaults/config.js" \
		"$_etc/config.js"
	
	install -Dm644 "$srcdir/system.service" \
		"$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "$srcdir/user.service" \
		"$pkgdir/usr/lib/systemd/user/$pkgname.service"
	
	grep -FRlZ "$startdir" "$pkgdir" | \
		xargs -0 -- sed -i "s|$startdir|/tmp/build|g"
}
