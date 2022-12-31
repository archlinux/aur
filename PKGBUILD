# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=forgejo
pkgver=1.18.0.1
pkgrel=1
pkgdesc='A lightweight software forge'
arch=('x86_64')
url='https://forgejo.org'
license=('MIT')
depends=('git')
makedepends=('go' 'nodejs' 'npm')
checkdepends=('openssh')
optdepends=(
  'mariadb: MariaDB support'
  'memcached: MemCached support'
  'openssh: GIT over SSH support'
  'pam: Authentication via PAM support'
  'postgresql: PostgreSQL support'
  'redis: Redis support'
  'sqlite: SQLite support'
)
backup=('etc/forgejo/app.ini')
options=('!lto')
_commit='88445b62374e8165d44d5520de736a7b7c98fd1b'
source=(
  "$pkgname::git+https://codeberg.org/forgejo/forgejo#commit=$_commit"
  'systemd.service'
  'sysusers.conf'
  'tmpfiles.conf'
)
sha512sums=('SKIP'
            '90684aa56930f40ff791fb4789375bbcf69cecc98c3a9fd3764c6f53e60bb32ddedd83cd75c00ff9d6aa90741361815dc7e23904ac355075b0f0990853639198'
            '933c0b6cee9d32d2b11a8ee2476e20c5f06a089ed4310ffb24155902f308b4fb447b3b2f3bf7dee76be24475873da5bd026c4823cd56590b20bdf2805f4d07a8'
            'c43bac86c75078a27e4ac022d8c09b22118f8eff73e1e4d5358f3b67ec7c4376ff7b8520aa9018f489ab2d0dea88d2748c71405fa3293924979808b3b873b237')
b2sums=('SKIP'
        '6c51a7d121dc365c9839d5a6cb3d0edf36018f0ca34c5e9b21dc8f45ea21fa05971f12aedc5af6dcc5c1bd81f7430ab4df1e63f8cd19e1dfcb8088538edf9c15'
        'cab7b5cbf24242e3d941725111de012c0ee16495e8f367ab48cb02b2261133c262a1704f58b20fd08ec626bcb23cef2473b55e19dbf7db60c243b1f30fd13743'
        'eb4dd769dc540c8bc75cdf0bfbd889940f5a0d0a3eafda5faa9166be3de88375a245a4adcc1e27ee0807cefde8afaa068e10e8397e7025861af107352824bfc6')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/v//' -e 's/-/./g'
}

prepare() {
  cd "$pkgname"

  make deps
}

build() {
  cd "$pkgname"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export EXTRA_GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export LDFLAGS="-X 'code.gitea.io/gitea/modules/setting.AppWorkPath=/var/lib/forgejo/' -X 'code.gitea.io/gitea/modules/setting.CustomConf=/etc/forgejo/app.ini'"
  export TAGS="bindata sqlite sqlite_unlock_notify pam"

  make -j1
}

package() {
  # systemd integration
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  cd "$pkgname"

  # binary
  install -vDm755 gitea "$pkgdir/usr/bin/$pkgname"

  # configuration example
  install -vDm644 custom/conf/app.example.ini -t "$pkgdir/etc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
