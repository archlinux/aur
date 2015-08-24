# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=mattermost
pkgver=0.6.0
pkgrel=1
pkgdesc="Open source Slack-alternative in Golang and React"
arch=('i686' 'x86_64')
url="http://mattermost.org"
license=('AGPL')
depends=('glibc')
makedepends=('go' 'godep' 'ruby' 'npm' 'python2')
backup=('etc/webapps/mattermost/config.json')
optdepends=('mariadb: SQL server storage'
            'percona-server: SQL server storage'
						'postgresql: SQL server storage')
install=mattermost.install
source=(https://github.com/mattermost/platform/archive/v$pkgver/$pkgname-$pkgver.tar.gz
        mattermost.service
				mattermost-user.conf)
sha256sums=('935e842a7143959c6ad90e4c1d8286d0848e329c04ff13d020ddb7fa8700b8b2'
            'b02a0bdbffd17a3a02b6d0098d2a10363ad595070ce6985513b7e6496f9b655a'
            '7cd154ed034a09f6671cab68bc9c30a7fd84e777e801e2aaf93a567cfa0dccfd')

build() {
	cd "$srcdir"/platform-$pkgver

	export GEM_HOME="$srcdir"/gem
	export GOPATH="$PWD:$PWD/Godeps/_workspace"
	export GOBIN="$PWD/bin"

	GO_PLATFORM_DIR="$PWD"/Godeps/_workspace/src/github.com/mattermost/platform

	rm -rf "$GO_PLATFORM_DIR"
	mkdir -p "$GO_PLATFORM_DIR"
	mkdir -p src bin pkg

	mv api manualtesting model store utils web "$GO_PLATFORM_DIR"

	go clean

	msg2 "Building react application"
	pushd "$GO_PLATFORM_DIR"/web/react
	npm install
	npm run build
	popd

	msg2 "Building compass stylesheets"
	pushd "$GO_PLATFORM_DIR"/web/sass-files
	gem install compass -n "$srcdir"/bin
	"$srcdir"/bin/compass compile
	popd

	msg2 "Building go libraries"
	go build

	msg2 "Building mattermost"
	go install mattermost.go
}

package() {
	GO_PLATFORM_DIR="$srcdir"/platform-$pkgver/Godeps/_workspace/src/github.com/mattermost/platform

	DISTDIR="$pkgdir"/usr/share/webapps/$pkgname
	install -dm755 "$DISTDIR"/{config,web,api} "$pkgdir"/var/log/$pkgname "$pkgdir"/etc/webapps/mattermost
	cd "$DISTDIR"

	ln -s /var/log/$pkgname logs

	cp -RL "$GO_PLATFORM_DIR"/web/{static,templates} web/
	cp -RL "$GO_PLATFORM_DIR"/api/templates api/

	echo $pkgver > config/build.txt
	mv web/static/js/bundle{,-$pkgver}.min.js

	sed -ri 's/(react-with-addons|jquery|bootstrap|perfect-scrollbar)(-[0-9\.]+)?\.js/\1\2.min.js/g' web/templates/head.html
	sed -ri "s/bundle.js/bundle-$pkgver.min.js/g" web/templates/head.html

	sed -e 's@"StorageDirectory": ".*"@"StorageDirectory": "/var/lib/mattermost/"@g' \
	    -e 's@tcp(dockerhost:3306)@unix(/run/mysqld/mysqld.sock)@g' \
			"$srcdir"/platform-$pkgver/config/config.json > "$pkgdir"/etc/webapps/mattermost/config.json

	ln -s /etc/webapps/mattermost/config.json config/config.json

	cd "$srcdir"
	install -Dm755 platform-$pkgver/bin/mattermost "$pkgdir"/usr/bin/mattermost
	install -Dm644 mattermost.service "$pkgdir"/usr/lib/systemd/system/mattermost.service
	install -Dm644 mattermost-user.conf "$pkgdir"/usr/lib/sysusers.d/mattermost.conf
}
