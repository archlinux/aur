# Maintainer : Kevin MacMartin <prurigro@gmail.com>

_pkgname=syncthing
pkgname=$_pkgname-discosrv
epoch=1
pkgver=0.13.7
pkgrel=1
pkgdesc='Discover server for the syncthing P2P synchronization utility'
url='http://syncthing.net'
license=('MIT')
install=$pkgname.install
depends=('glibc')
makedepends=('git' 'go' 'godep' 'mercurial')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')

source=(
  "https://github.com/$_pkgname/$_pkgname/archive/v$pkgver.tar.gz"
  "$pkgname.service"
  "$pkgname.tmpfiles.conf"
)
sha512sums=(
  '8e00355f9774329cb4da1173ad27528213520644c32d5b5ba2345b93787bc762d0498c33ccf2d72e91b770258e8a55d86573934baeff0bc0799416850320c82b'
  'b2a8daa48be57ad47542569473128c8590d4bbe124de0912ce5b3de7deb1b54dd0d3ed66e925fc11addded075d24d6a1fe822d71338d128b7ca03fd43c082d8c'
  '28b0bb6a6f2fa536ec8cb887cfebf4706be25af5e29da39e2e3776daeeeb48f75fb5be255472920355948d8905830342866e89299facd626ddf8a658d84faf27'
)

build() {
  cd $_pkgname-$pkgver/cmd/discosrv
  export GOPATH="$srcdir"
  go get -d -tags purego

  case "$CARCH" in
    x86_64)
      export target='discosrv-linux-amd64'
      ;;
    i686)
      export target='discosrv-linux-386'
      ;;
    arm*)
      export target='discosrv-linux-arm'
      ;;
  esac

  go build -i -v -ldflags -w
}

package() {
  # Install systemd service and tmpfiles config
  install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 $pkgname.tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf

  # Install license and list of authors
  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"

  # Install documentation and binary
  cd cmd/discosrv
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm755 discosrv "$pkgdir/usr/bin/$pkgname"
}
