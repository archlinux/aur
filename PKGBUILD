# Maintainer: Kasei Wang <cnsdwpc at gmail.com>
_pkgname=kcptun
pkgname=$_pkgname-bin
pkgver=20170329
pkgrel=1
pkgdesc="An extremely simple udp tunnel based on KCP"
arch=("i686" "x86_64" "armv6h" "armv7h")
url="https://github.com/xtaci/kcptun"
license=("MIT")
depends=()
provides=("kcptun")
replaces=()
conflicts=("kcptun")

if [ "$CARCH" = "i686" ]; then
  _arch="386"
  source=("https://github.com/xtaci/kcptun/releases/download/v$pkgver/kcptun-linux-$_arch-$pkgver.tar.gz")
  sha1sums=('836d8e83f3d9b4819d62d924cc7ead0f2d91eeaa')
fi
if [ "$CARCH" = "x86_64" ]; then
  _arch="amd64"
  source=("https://github.com/xtaci/kcptun/releases/download/v$pkgver/kcptun-linux-$_arch-$pkgver.tar.gz")
  sha1sums=('8d899488fcf014c96baf17b57772014cb1691f99')
fi
if [[ "$CARCH" = arm* ]]; then
  case "$CARCH" in
    "armv6h")
      _arch="arm6"
      ;;
    "armv7h")
      _arch="arm7"
      ;;
    *)
      echo "Unsupported ARM architecture: $CARCH"
      exit 1
      ;;
  esac
  source=("https://github.com/xtaci/kcptun/releases/download/v$pkgver/kcptun-linux-arm-$pkgver.tar.gz")
  sha1sums=('82f2e50394e7120324ff5d6876684624b6145d65')
fi

source+=('example_client.json'
         'example_server.json'
         'kcptun@.service'
         'kcptun-server@.service')
sha1sums+=('28224cefd0cb946afb55ad25e1ac69389b8d1c56'
          '6727740067b167448603876667f8c66f3a5b55f6'
          '740871c2aad2f8407092d77f6426f8071fd310f8'
          '04f17522d059b8ece03cb2befaefce500fa53a26')

package() {
  cd "$srcdir/"
  install -Dm755 client_linux_$_arch "$pkgdir/usr/bin/kcptun_client"
  install -Dm755 server_linux_$_arch "$pkgdir/usr/bin/kcptun_server"
  install -Dm644 "$srcdir/example_client.json" "$pkgdir/etc/kcptun/example_client.json"
  install -Dm644 "$srcdir/example_server.json" "$pkgdir/etc/kcptun/example_server.json"
  install -Dm644 "$srcdir/kcptun@.service" "$pkgdir/usr/lib/systemd/system/kcptun@.service"
  install -Dm644 "$srcdir/kcptun-server@.service" "$pkgdir/usr/lib/systemd/system/kcptun-server@.service"
}
