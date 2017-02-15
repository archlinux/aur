# Maintainer: surefire@cryptomile.net

pkgname=gogs-master-git
pkgver=0.9.145.0213.r7.1381f0f28
pkgrel=1
pkgdesc="Gogs(Go Git Service) is a Self Hosted Git Service in the Go Programming Language."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://gogs.io/"
license=('MIT')
provides=('gogs')
depends=('git' 'sqlite')
conflicts=('gogs' 'gogs-git' 'gogs-git-dev' 'gogs-openrc' 'gitea')
options=('!buildflags')
optdepends=('mariadb: MariaDB support'
            'postgresql: PostgreSQL support'
            'redis: Redis support'
            'memcached: MemCached support'
            'openssh: GIT over SSH support')
makedepends=('go' 'git' 'nodejs-less')
source=('git+https://github.com/gogits/gogs.git#branch=master'
        'git+https://github.com/jteeuwen/go-bindata.git' #Because сommunity package is very outdated
        'gogs.service'
        'gogs.sysusers'
        'gogs.tmpfiles')
md5sums=('SKIP'
         'SKIP'
         '4ea1610580f7e7de4259025f8980942d'
         'e919a9b9cfee91e3ff146bc8841d4d28'
         '0cef7ff4495be24a34178a4f29e803b6')
install=gogs.install
_gogsdir="src/github.com/gogits/gogs"

prepare() {
	export GOPATH="$srcdir"

	mkdir -p ./src/github.com/{gogits,jteeuwen}

	mv    -t ./src/github.com/gogits   ./gogs
	mv    -t ./src/github.com/jteeuwen ./go-bindata

	cd "$_gogsdir"

	sed -r -i conf/app.ini \
		-e '0,             /^\[/ s/^(RUN_USER)\W.*$/\1 = gogs/' \
		-e '/^\[server\]/, /^\[/ s/^(STATIC_ROOT_PATH)\W.*$/\1 = \/usr\/share\/gogs/' \
		-e '/^\[log\]/,    /^\[/ s/^(ROOT_PATH)\W.*$/\1 = \/var\/log\/gogs/' \
	;

	# Dirty hack
	sed -i vendor/github.com/go-xorm/xorm/logger.go \
		-e '/DEFAULT_LOG_LEVEL/ s/core\.LOG_DEBUG/core.LOG_WARNING/' vendor/github.com/go-xorm/xorm/logger.go \
	;
}

pkgver() {
	cd "$_gogsdir"
	printf '%s.r%s.%s' \
		$(<templates/.VERSION) \
		$(git rev-list --count HEAD...$(git log --pretty=format:%H -n 1 -- templates/.VERSION)) \
		$(git rev-parse --short HEAD) \
	;
}

build() {
	export GOPATH="$srcdir"

	cd "$srcdir/src/github.com/jteeuwen/go-bindata/go-bindata"
	go install -v

	cd "$srcdir/$_gogsdir"

	make PATH="$GOPATH/bin:$PATH" TAGS='libsqlite3 sqlite pam cert' build
}

package() {
	cd "$_gogsdir"

	rm -rf ./public/{less,config.codekit}

	install -d "$pkgdir/usr/share/gogs"
	cp     -rt "$pkgdir/usr/share/gogs" ./{templates,public}

	install -Dm0755 -t "$pkgdir/usr/bin"                 ./gogs
	install -Dm0644 -t "$pkgdir/usr/share/licenses/gogs" ./LICENSE
	install -Dm0644 -t "$pkgdir/usr/lib/systemd/system"  "$srcdir/gogs.service"

	install -Dm0644 "$srcdir/gogs.sysusers" "$pkgdir/usr/lib/sysusers.d/gogs.conf"
	install -Dm0644 "$srcdir/gogs.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/gogs.conf"
}
