# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>
# Maintainer: Allen Zhong <pdev@zhoal.pw>
pkgname=tidb
pkgver=7.6.0
pkgrel=1
pkgdesc='A distributed HTAP database compatible with the MySQL protocol'
makedepends=('go' 'make')
arch=('x86_64')
url='https://github.com/pingcap/tidb'
license=('Apache')
provides=('tidb-server')
backup=(etc/tidb/tidb.toml)
depends=('tikv')
install=tidb.install
source=(tidb-${pkgver}.tar.gz::https://github.com/pingcap/tidb/archive/v${pkgver}.tar.gz
        tidb.service
        tidb-sysusers.conf
        tidb-tmpfiles.conf
        tidb.toml)
sha256sums=('f7c9c022b8fc5c038693bfde67d1f360f3295161789abae5768534aea1fa42a5'
            '22318c19bb89ff5a0852df5186cc1496214cd49f2264192413a326d1e8c93dc9'
            '2b147d80985e714d5f861baf76591104c07058b9b6fa573bf0676d675cf8fc20'
            '30ce83fbec8f102c30e438282bb5b18c026d08480f2386d68f1116c12481bf66'
            'f32709894c0d2c105a4398dcaf027f1cbdee359a2a6747f43cac819e9df25517')

_gopkgname='github.com/pingcap/tidb'

prepare() {
  export GOPATH="$srcdir/build"
  rm -rf "$GOPATH/src/$_gopkgname"
  mkdir -p `dirname "$GOPATH/src/$_gopkgname"`
  mv -Tv "$srcdir/tidb-${pkgver}" "$GOPATH/src/$_gopkgname"

  # patch Makefile
  sed -i '/shell git /d' "$GOPATH/src/$_gopkgname/Makefile.common"
}

build() {
  export GOPATH="$srcdir/build"
  export PATH=$GOPATH/bin:$PATH
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd $GOPATH/src/$_gopkgname

  _LDFLAGS="-X $_gopkgname/pkg/parser/mysql.TiDBReleaseVersion=$pkgver -X $_gopkgname/pkg/util/versioninfo.TiDBGitHash=v$pkgver -X $_gopkgname/pkg/util/versioninfo.TiDBGitBranch=release"

  BUILD_FLAG=$GOFLAGS LDFLAGS=$_LDFLAGS make server
}

package() {
  # Install binary
  install -Dm755 "$srcdir/build/src/$_gopkgname/bin/tidb-server" "$pkgdir/usr/bin/tidb-server"
  # Install systemd service
  install -Dm644 "$srcdir/tidb.service" "$pkgdir/usr/lib/systemd/system/tidb.service"
  # Install sysusers
  install -Dm644 "$srcdir/tidb-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/tidb.conf"
  # Install tmpfiles
  install -Dm644 "$srcdir/tidb-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/tidb.conf"
  # Install default config
  install -Dm644 tidb.toml "$pkgdir/etc/tidb/tidb.toml"
}

# vim: ft=sh syn=sh et
