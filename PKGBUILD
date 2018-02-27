# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=acestream-proxy
pkgver=0.9.1
pkgrel=2
pkgdesc="AceProxy allows you to watch Ace Stream live streams or BitTorrent files over HTTP"
arch=("any")
url="https://github.com/ValdikSS/aceproxy"
license=("MIT")
depends=("acestream-engine" "python2-gevent" "python2-psutil")
provides=("acestream-proxy")
source=("https://github.com/ValdikSS/aceproxy/archive/v$pkgver.tar.gz")
md5sums=("SKIP")

package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/lib/systemd/system"

  cp -a "$srcdir/aceproxy-$pkgver" "$pkgdir/opt/aceproxy"
  cp -a "$srcdir/aceproxy-$pkgver/systemd/aceproxy.service" "$pkgdir/usr/lib/systemd/system/aceproxy@.service"
  cp -a "$srcdir/aceproxy-$pkgver/systemd/aceproxy.service" "$pkgdir/usr/lib/systemd/system/aceproxy.service"

  ln -s "/opt/aceproxy/acehttp.py" "$pkgdir/usr/bin/aceproxy"

  sed -i "s/acespawn = False/acespawn = True/g" "$pkgdir/opt/aceproxy/aceconfig.py"
  sed -i "/\b\(User\|nobody\)\b/d" "$pkgdir/usr/lib/systemd/system/aceproxy.service"
  sed -i "s/User=nobody/User=%i/g" "$pkgdir/usr/lib/systemd/system/aceproxy@.service"

  rm -R "$pkgdir/opt/aceproxy/systemd"
}
