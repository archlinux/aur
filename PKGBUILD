# Maintainer : Kevin MacMartin <prurigro@gmail.com>

_pkgname=syncthing
pkgname=$_pkgname-discosrv
pkgver=20160416.r66.cab456a
pkgrel=1
pkgdesc='Discover server for the syncthing P2P synchronization utility'
url='http://syncthing.net'
license=('MIT')
install=$pkgname.install
depends=('glibc')
makedepends=('git' 'go' 'godep' 'mercurial')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')

source=(
  'git+https://github.com/syncthing/discosrv.git'
  "$pkgname.service"
  "$pkgname.tmpfiles.conf"
)
sha512sums=(
  'SKIP'
  'b0f64ce7f6b6ca97b759dd2ccc8df44acb06a612800c37a2dae3dd6c54b0f524950c70b21fd965b28e2a1dd4b0ca48c6b39e9b2ae67e0f7f093f8f92cb221402'
  '28b0bb6a6f2fa536ec8cb887cfebf4706be25af5e29da39e2e3776daeeeb48f75fb5be255472920355948d8905830342866e89299facd626ddf8a658d84faf27'
)

pkgver() {
  cd discosrv
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd discosrv

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
  install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 $pkgname.tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
  install -Dm755 discosrv/discosrv "$pkgdir/usr/bin/$pkgname"
  install -Dm644 discosrv/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
