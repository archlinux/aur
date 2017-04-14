pkgname=gogs
gitver="v0.11.4"
pkgver="0.11.4"
pkgrel=1
pkgdesc="Gogs(Go Git Service) is a Self Hosted Git Service in the Go Programming Language."
arch=('x86_64')
url="http://gogs.io/"
license=('MIT')
depends=('git' 'sqlite')
conflicts=('gogs' 'gogs-git')
provides=('gogs')
replaces=('gogs-master-git')
options=('!buildflags')
makedepends=('go' 'go-bindata-git' 'nodejs-less')
install="gogs.install"
source=("${pkgname}::git+https://github.com/gogits/gogs#tag=${gitver}"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}.install"
)
sha256sums=('SKIP'
            'f9f56b4946ad58f6c38ca4bda68f80ee02706d322986b5ffec2280accc83b55e'
            'a51f93aefe8724aad67e8cacaaaa1f140c930cffcdb1f5dd951272a340c59650'
            'e761cd82ad26d732bbeaac73307a032674612d30be98f9a9c8c769340139605c'
            'c120a3458ad295815020441c940e81ee0dbd9d0322a2bd585b7c3d56da0e9dea')

_gogsdir="src/github.com/gogits/gogs"

prepare() {
  export GOPATH="$srcdir"

  mkdir -p ./src/github.com/gogits

  mv    -t ./src/github.com/gogits   ./gogs

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

build() {
  export GOPATH="$srcdir"

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
