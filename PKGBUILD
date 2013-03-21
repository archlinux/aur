# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=redis-munin-git
pkgver=20130321
pkgrel=1
pkgdesc="A set of munin scripts to monitor redis"
arch=(any)
url="https://github.com/gilles/redis-munin"
license=('GPL')
depends=('munin-node' 'ruby-redis')
makedepends=('git')

_gitroot="https://github.com/gilles/redis-munin.git"
_gitname="redis-munin"

build() {
	cd "$srcdir"

	msg "Connecting to GIT server...."

	if [ -d $srcdir/$_gitname ]; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone --depth=0 $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
}

package() {
	cd "$srcdir/$_gitname"
	for plugin in redis_* resque_*; do
		install -m0755 -D $plugin "$pkgdir/usr/lib/munin/plugins/$plugin"
	done
}
