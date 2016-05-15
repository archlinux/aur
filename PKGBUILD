# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=mattermost
pkgver=3.0.0
_pkgver=${pkgver/rc/-rc}
pkgrel=1
pkgdesc="Open source Slack-alternative in Golang and React"
arch=('i686' 'x86_64')
url="http://mattermost.org"
license=('MIT')
depends=('glibc')
makedepends=('go' 'godep' 'npm' 'python2' 'git' 'mercurial')
backup=('etc/webapps/mattermost/config.json')
optdepends=('mariadb: SQL server storage'
            'percona-server: SQL server storage'
            'postgresql: SQL server storage')
install=mattermost.install
source=(https://github.com/mattermost/platform/archive/v$_pkgver/$pkgname-$_pkgver.tar.gz
        mattermost.service
        mattermost-user.conf
				mattermost.sh)
sha256sums=('4cc023d0b80e1aec59e53b6ebf666512364a58f47c3133b61075e03eed784a2c'
            'b3fbb2d04e72396677b2c8e34df089ff135796f7a0e8a42d45e989773d6d5b07'
            '7cd154ed034a09f6671cab68bc9c30a7fd84e777e801e2aaf93a567cfa0dccfd'
            '32105266886cb21eb62537b8f90767428e4bd6f9d5b54d395d7db2847f3746ed')

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

	go clean -x
	godep get
	make build-client

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
	install -dm755 "$DISTDIR"/{bin,config,webapp} "$pkgdir"/var/log/$pkgname "$pkgdir"/etc/webapps/mattermost
	cd "$DISTDIR"

	ln -s /var/log/$pkgname logs

	cp -RL "$GO_PLATFORM_DIR"/webapp/dist webapp/
	cp -RL "$GO_PLATFORM_DIR"/{fonts,templates,i18n} .
	rm webapp/dist/*.map

	mv webapp/dist/bundle{,-$pkgver}.js
	sed "s#/bundle\.js#/bundle-$pkgver.js#" -i webapp/dist/root.html

	sed -e 's@"StorageDirectory": ".*"@"StorageDirectory": "/var/lib/mattermost/"@g' \
	    -e 's@tcp(dockerhost:3306)@unix(/run/mysqld/mysqld.sock)@g' \
	    "$srcdir"/platform-$_pkgver/config/config.json > "$pkgdir"/etc/webapps/mattermost/config.json

	ln -s /etc/webapps/mattermost/config.json config/config.json

	cd "$srcdir"
	install -Dm755 mattermost.sh "$pkgdir"/usr/bin/mattermost
	install -Dm755 bin/platform "$DISTDIR"/bin/platform
	install -Dm644 mattermost.service "$pkgdir"/usr/lib/systemd/system/mattermost.service
	install -Dm644 mattermost-user.conf "$pkgdir"/usr/lib/sysusers.d/mattermost.conf

	cd "$srcdir"/platform-$_pkgver/
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
	install -Dm644 NOTICE.txt "$pkgdir"/usr/share/doc/$pkgname/NOTICE.txt
	install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
