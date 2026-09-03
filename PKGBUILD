# Maintainer: Assaf Sapir <assaf AT sapir.io>
pkgname=graphs1090-git
pkgver=1.0.1.r462.g426c70c
pkgrel=1
pkgdesc="Graphs for dump1090: message rate, aircraft, range, signal, gain, CPU and temperature over time"
arch=('any')
url="https://github.com/wiedehopf/graphs1090"
license=('MIT')
depends=('bash' 'collectd' 'rrdtool' 'python' 'dump1090')
optdepends=('lighttpd: serve the web interface'
            'nginx: serve the web interface')
backup=('etc/default/graphs1090' 'etc/lighttpd/conf.d/graphs1090.conf')
install=graphs1090.install
source=("graphs1090::git+https://github.com/wiedehopf/graphs1090.git")
sha256sums=('SKIP')

pkgver() {
  cd graphs1090
  printf '%s.r%s.g%s' "$(cat version)" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd graphs1090
  rm install.sh uninstall.sh tag.sh
  # Arch keeps collectd's config in /etc/collectd.conf; upstream's optional configs are not under git/ here
  grep -rl --exclude-dir=.git '/etc/collectd/collectd.conf' . | xargs sed -i 's?/etc/collectd/collectd.conf?/etc/collectd.conf?g'
  sed -i 's?/graphs1090/git/?/graphs1090/?' default
  sed -i "s|<!-- version -->| $(cat version)|" html/index.html
}

package() {
  cd graphs1090
  install -d "$pkgdir/usr/share/graphs1090/data-symlink" "$pkgdir/var/lib/graphs1090/scatter"
  install -m755 *.sh "$pkgdir/usr/share/graphs1090/"
  install -m644 *.py dump1090.db malarky.conf collectd.conf hide_system-collectd.conf "$pkgdir/usr/share/graphs1090/"
  cp -r html "$pkgdir/usr/share/graphs1090/html"
  # collectd.conf reads stats.json from data-symlink/data/, which upstream points at the decoder
  ln -s /run/dump1090 "$pkgdir/usr/share/graphs1090/data-symlink/data"
  install -Dm644 default "$pkgdir/etc/default/graphs1090"
  install -Dm644 service.service "$pkgdir/usr/lib/systemd/system/graphs1090.service"
  install -Dm644 88-graphs1090.conf "$pkgdir/etc/lighttpd/conf.d/graphs1090.conf"
  install -Dm644 -t "$pkgdir/usr/share/doc/graphs1090" nginx-graphs1090.conf README.md
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
