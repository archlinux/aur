# Maintainer: Pierre Lalet <pl@ivre.rocks>

pkgbase=ivre
pkgname=('ivre' 'ivre-web' 'ivre-docs' 'python-ivre')
pkgver=0.9.17
pkgrel=2
pkgdesc='Network recon framework based on Nmap, Masscan, Zgrab2, Nuclei, httpx, Zeek (Bro), Argus, Netflow,... Build your own alternatives to Shodan and GreyNoise, run your Passive DNS service, and much more!'
arch=('any')
url='https://ivre.rocks/'
license=('GPL3')
makedepends=('python')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/ivre/$pkgname/v$pkgver/pkg/apache/ivre.conf")
sha512sums=('6bb852080c54c490450b9904717fdf93ce9750d560c9c4a70824ab7a2cdaaa46553156dac3a17798c17acbc47e701afe04b257602949088b72bf33d8af06c247'
            '9db82963976ed0134c88ca779ab2d8ac92fdaf5eff8f6e6c47014b56f92cb78313acd6b6ddee8de13de6c3ae8a2988f216a659496f16b756836475a9b774b0c5')

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py build
}

package_ivre() {
  depends=('python-ivre')
  optdepends=('ivre-docs: Documentation'
              'ivre-web: Web server'
              'nmap: Network scan'
              'masscan: Network scan'
              'zmap: Network scan'
              'zeek: Network traffic analysis'
              'argus: Network traffic analysis'
              'nfdump: Netflow analysis'
              'imagemagick: Screenshots via Nmap scripts'
              'phantomjs: HTTP screenshots via Nmap script'
              'ffmpeg: RTSP Screenshots via Nmap script')

  cd "$srcdir/$pkgbase-$pkgver"

  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

  rm -r "$pkgdir/usr/lib" \
     "$pkgdir/usr/share/doc" \
     "$pkgdir/usr/share/ivre/dokuwiki" \
     "$pkgdir/usr/share/ivre/web"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/license*
}

package_ivre-docs() {
  pkgdesc+=' (documentation)'

  cd "$srcdir/$pkgbase-$pkgver"

  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

  cp README.md "$pkgdir/usr/share/doc/ivre/"
  mv "$pkgdir/usr/share/ivre/web/static/doc" "$pkgdir/usr/share/doc/ivre/html"
  rm -r "$pkgdir/usr/bin" "$pkgdir/usr/lib" \
     "$pkgdir/usr/share/ivre" \
     "$pkgdir/etc/bash_completion.d"
}

package_ivre-web() {
  depends=('ivre' 'python-bottle')
  optdepends=('apache: Web server'
              'mod_wsgi: Web server'
              'dokuwiki: Web server (notebook)')
  pkgdesc+=' (web application)'
  backup=('etc/httpd/conf/extra/ivre.conf')

  cd "$srcdir/$pkgbase-$pkgver"

  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

  rm -r "$pkgdir/usr/bin" "$pkgdir/usr/lib" \
     "$pkgdir/usr/share/doc" \
     "$pkgdir/usr/share/ivre/zeek" \
     "$pkgdir/usr/share/ivre/data" \
     "$pkgdir/usr/share/ivre/docker" \
     "$pkgdir/usr/share/ivre/geoip" \
     "$pkgdir/usr/share/ivre/honeyd" \
     "$pkgdir/usr/share/ivre/nmap_scripts" \
     "$pkgdir/etc/bash_completion.d"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/license*
  install -Dm0644 "$srcdir/ivre.conf" "$pkgdir/etc/httpd/conf/extra/ivre.conf"
}

package_python-ivre() {
  depends=('python' 'python-pymongo' 'python-future' 'python-pyopenssl' 'python-cryptography')
  optdepends=('python-sqlalchemy: experimental PostgreSQL & SQLite backends'
              'python-psycopg2: experimental PostgreSQL backend'
              'python-elasticsearch: experimental Elasticsearch backend'
              'python-elasticsearch-dsl: experimental Elasticsearch backend'
              'python-tinydb: experimental file-based backend (no DB server)'
              'python-pillow: trim screenshots on insertion'
              'tesseract: extract words from screenshots on insertion'
              'python-scapy: parse PCAP files for ARP inspection (flow analysis)'
              'python-matplotlib: create graphs from command line tools'
              'python-dbus: 3D traceroute graphs'
              'mongodb: database server'
              'postgresql: database server (experimental backend)')
  pkgdesc+=' (library)'

  cd "$srcdir/$pkgbase-$pkgver"

  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

  rm -r "$pkgdir/usr/bin" \
     "$pkgdir/usr/share" \
     "$pkgdir/etc/bash_completion.d"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/license*
}
