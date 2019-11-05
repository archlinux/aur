# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: Iiridayn
# Contributor: hucsmn

_binname=stdiscosrv
_pkgname=syncthing
pkgname=$_pkgname-discosrv
epoch=1
pkgver=1.3.1
pkgrel=1
pkgdesc='Discover server for the syncthing P2P synchronization utility'
url='http://syncthing.net'
license=('MIT')
install=$pkgname.install
depends=('glibc')
makedepends=('go')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')

source=(
  "https://github.com/$_pkgname/$_pkgname/archive/v$pkgver.tar.gz"
  "$pkgname.service"
  "$pkgname.tmpfiles.conf"
)

sha512sums=(
  'a5f5de85d719379c6d312fa1051d6a0761e3ed73014c8e5b95b26bb0ab264a48f114d210a46f0e990b0535494873a5997284a6acaa0337d1f082bbcd847ab664'
  'f67a6051a1bbe9d3b562caaaecfc4829afa25cfddc5d5dd70dc8170bddc9d938fd85ab89b1c198f074f323d8e385d9fa8bc3a9bfe53594629dbfbf984c2e7015'
  '28b0bb6a6f2fa536ec8cb887cfebf4706be25af5e29da39e2e3776daeeeb48f75fb5be255472920355948d8905830342866e89299facd626ddf8a658d84faf27'
)

prepare() {
  rm -rf src
  install -d src/github.com/$_pkgname
  mv $_pkgname-$pkgver src/github.com/$_pkgname/$_pkgname
  cd src/github.com/$_pkgname/$_pkgname
  go mod vendor
}

build() {
  export GOPATH="$srcdir"
  cd src/github.com/$_pkgname/$_pkgname/cmd/stdiscosrv
  go build -x -i -v -ldflags -w
}

package() {
  # Install systemd service and tmpfiles config
  install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 $pkgname.tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  # Install license and list of authors
  cd src/github.com/$_pkgname/$_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"

  # Install the man page
  install -Dm644 man/$_binname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"

  # Install the binary
  install -Dm755 cmd/$_binname/$_binname "$pkgdir/usr/bin/$pkgname"
}
