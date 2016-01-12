# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>
# Contributor: Duncan K. <duncank@fastmail.fm>
pkgname=shout-irc
pkgver=0.53.0
pkgrel=1
pkgdesc="Web-based IRC client"
url='http://shout-irc.com/'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
install=install
backup=('etc/shout-irc/config.js')
source=(
	"https://github.com/erming/shout/archive/v${pkgver}.tar.gz"
	"system.service"
	"user.service"
)
sha256sums=(
	'5d31de338fae4ec44d9338ed6ca8c0de5d18bac21c192508d9afa942ae0d6fc0'
	'SKIP'
	'SKIP'
)

build() {
	cd "$srcdir/shout-$pkgver"
	npm install
}

package() {
	_share="$pkgdir/usr/share/$pkgname"
	_etc="$pkgdir/etc/$pkgname"
	
	cd "$srcdir/shout-$pkgver"
	
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$_share"
	install -dm700 "$_etc" "$_etc/users"
	install -Dm600 "defaults/config.js" "$_etc/config.js"
	cp -RT . "$_share"
	ln -s /usr/share/$pkgname/index.js $pkgdir/usr/bin/$pkgname
	
	install -Dm644 $srcdir/system.service $pkgdir/usr/lib/systemd/system/${pkgname}.service
	install -Dm644 $srcdir/user.service $pkgdir/usr/lib/systemd/user/${pkgname}.service
}
