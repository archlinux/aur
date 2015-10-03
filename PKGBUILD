# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=mattermost
pkgver=1.0.0
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="Open source Slack-alternative in Golang and React"
arch=('i686' 'x86_64')
url="http://mattermost.org"
license=('AGPL')
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
sha256sums=('3e5dd5658afa7a6e1953e368c56af5b79f05fb30299dbf3c88ea8d4d5cfd9c02'
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

	sed -r 's|github.com/throttled/throttled|gopkg.in/throttled/throttled.v2|g' -i \
	  Godeps/Godeps.json \
	  api/server.go
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
	npm install
	npm run build
	popd

	msg2 "Building compass stylesheets"
	pushd "$GO_PLATFORM_DIR"/web/sass-files
	gem install compass -n "$srcdir"/bin
	"$srcdir"/bin/compass compile
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

	echo $pkgver > config/build.txt
	mv web/static/js/bundle{,-$pkgver}.min.js

	sed -ri 's/(react-with-addons|jquery|bootstrap|perfect-scrollbar)(-[0-9\.]+)?\.js/\1\2.min.js/g' web/templates/head.html
	sed -ri "s/bundle.js/bundle-$pkgver.min.js/g" web/templates/head.html

	sed -e 's@"StorageDirectory": ".*"@"StorageDirectory": "/var/lib/mattermost/"@g' \
	    -e 's@tcp(dockerhost:3306)@unix(/run/mysqld/mysqld.sock)@g' \
	    "$srcdir"/platform-$_pkgver/config/config.json > "$pkgdir"/etc/webapps/mattermost/config.json

	ln -s /etc/webapps/mattermost/config.json config/config.json

	cd "$srcdir"
	install -Dm755 bin/mattermost "$pkgdir"/usr/bin/mattermost
	install -Dm644 mattermost.service "$pkgdir"/usr/lib/systemd/system/mattermost.service
	install -Dm644 mattermost-user.conf "$pkgdir"/usr/lib/sysusers.d/mattermost.conf
}
