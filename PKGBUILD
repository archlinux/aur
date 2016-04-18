# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=mattermost
pkgver=2.2.0
_pkgver=${pkgver/rc/-rc}
pkgrel=1
pkgdesc="Open source Slack-alternative in Golang and React"
arch=('i686' 'x86_64')
url="http://mattermost.org"
license=('MIT')
depends=('glibc')
makedepends=('go' 'godep' 'ruby' 'npm' 'python2' 'git' 'mercurial')
backup=('etc/webapps/mattermost/config.json')
optdepends=('mariadb: SQL server storage'
            'percona-server: SQL server storage'
            'postgresql: SQL server storage')
install=mattermost.install
source=(https://github.com/mattermost/platform/archive/v$_pkgver/$pkgname-$_pkgver.tar.gz
        mattermost.service
        mattermost-user.conf)
sha256sums=('61cd2ae77e795e899a61d79156aa58b91e39071c893b6b5092d731e5879b3393'
            'b02a0bdbffd17a3a02b6d0098d2a10363ad595070ce6985513b7e6496f9b655a'
            '7cd154ed034a09f6671cab68bc9c30a7fd84e777e801e2aaf93a567cfa0dccfd')

prepare() {
	mkdir -p src/github.com/mattermost
	cd src/github.com/mattermost
	rm -f platform
	ln -s "$srcdir"/platform-$_pkgver platform

	cd platform
	sed "s|_BUILD_DATE_|$(date -u)|g" -i model/version.go
	sed "s|_BUILD_NUMBER_|$_pkgver-$pkgrel|g" -i model/version.go
	sed "s|_BUILD_HASH_|-|g" -i model/version.go
}

build() {
	export GOPATH="$srcdir"
	export GOBIN="$GOPATH/bin"
	export PATH="$PATH:$GOBIN"
	GO_PLATFORM_DIR="$srcdir"/src/github.com/mattermost/platform
	cd "$GO_PLATFORM_DIR"

	go clean
	godep get

	msg2 "Building react application"
	pushd "$GO_PLATFORM_DIR"/web/react
	HOME="$srcdir" npm install
	npm run build
	npm run build-libs
	popd

	msg2 "Building compass stylesheets"
	pushd "$GO_PLATFORM_DIR"/web/sass-files
	gem install compass -n "$srcdir"/bin
	"$srcdir"/bin/compass compile -e production --force
	popd

	msg2 "Building go libraries"
	godep go build

	msg2 "Building mattermost"
	godep go install mattermost.go
}

package() {
	export GOPATH="$srcdir"
	export PATH="$PATH:$GOPATH/bin"
	GO_PLATFORM_DIR="$srcdir"/src/github.com/mattermost/platform
	cd "$GO_PLATFORM_DIR"

	DISTDIR="$pkgdir"/usr/share/webapps/$pkgname
	install -dm755 "$DISTDIR"/{config,web,api} "$pkgdir"/var/log/$pkgname "$pkgdir"/etc/webapps/mattermost
	cd "$DISTDIR"

	ln -s /var/log/$pkgname logs

	cp -RL "$GO_PLATFORM_DIR"/web/{static,templates} web/
	cp -RL "$GO_PLATFORM_DIR"/api/templates api/
	cp -RL "$GO_PLATFORM_DIR"/i18n .

	echo $pkgver > config/build.txt
	mv web/static/js/bundle{,-$pkgver}.min.js
	mv web/static/js/libs{,-$pkgver}.min.js

	for ext in js css; do
		for asset in web/static/$ext/*.$ext; do
			asset=$(basename "$asset" ".$ext")
			if [ -f "web/static/$ext/$asset.min.$ext" ]; then
				sed -ri "s#/static/$ext/$asset\.$ext#/static/$ext/$asset.min.$ext#g" web/templates/head.html
				rm "web/static/$ext/$asset.$ext"
			fi
		done
	done

	sed -ri "s#/static/js/(bundle|libs)(\.min)?\.js#/static/js/\1-$pkgver.min.js#g" web/templates/head.html

	sed -e 's@"StorageDirectory": ".*"@"StorageDirectory": "/var/lib/mattermost/"@g' \
	    -e 's@tcp(dockerhost:3306)@unix(/run/mysqld/mysqld.sock)@g' \
	    "$srcdir"/platform-$_pkgver/config/config.json > "$pkgdir"/etc/webapps/mattermost/config.json

	ln -s /etc/webapps/mattermost/config.json config/config.json

	cd "$srcdir"
	install -Dm755 bin/mattermost "$pkgdir"/usr/bin/mattermost
	install -Dm644 mattermost.service "$pkgdir"/usr/lib/systemd/system/mattermost.service
	install -Dm644 mattermost-user.conf "$pkgdir"/usr/lib/sysusers.d/mattermost.conf

	cd "$srcdir"/platform-$_pkgver/
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
	install -Dm644 NOTICE.txt "$pkgdir"/usr/share/doc/$pkgname/NOTICE.txt
	install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
