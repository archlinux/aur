# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=mattermost
pkgver=3.0.2
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
sha256sums=('bc2d81b980d80733d312ca4e0f11c6ad09320d90b61bc049c29f2e89a14bda71'
            'b3fbb2d04e72396677b2c8e34df089ff135796f7a0e8a42d45e989773d6d5b07'
            '7cd154ed034a09f6671cab68bc9c30a7fd84e777e801e2aaf93a567cfa0dccfd'
            '7f4993798d1a2ae9a78fed5fc3fe88d44a7a669e7ffefda7fa6a36c27c6c5840')

prepare() {
  mkdir -p src/github.com/mattermost
  cd src/github.com/mattermost
  rm -f platform
  ln -s "$srcdir"/platform-$_pkgver platform
}

build() {
  export GOPATH="$srcdir"
  export GOBIN="$GOPATH/bin"
  export PATH="$PATH:$GOBIN"
  GO_PLATFORM_DIR="$srcdir"/src/github.com/mattermost/platform
  cd "$GO_PLATFORM_DIR"

  go clean -x
  godep get

  msg2 "Building client"
  make build-client

  msg2 "Building go libraries"
  godep go build

  msg2 "Building mattermost"
  godep go install -ldflags \
    "-X 'github.com/mattermost/platform/model.BuildNumber=$pkgver-$pkgrel' \
     -X 'github.com/mattermost/platform/model.BuildDate=$(date -u)' \
     -X 'github.com/mattermost/platform/model.BuildHash=-' \
     -X 'github.com/mattermost/platform/model.BuildEnterpriseReady=false'" \
    mattermost.go
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

  sed -e 's@"Directory": ".*"@"Directory": "/var/lib/mattermost/"@g' \
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
