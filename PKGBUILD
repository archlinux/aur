# Maintainer: Pierre Lalet <pl@ivre.rocks>

pkgbase=ivre
pkgname=('ivre' 'ivre-web' 'ivre-docs' 'python-ivre')
pkgver=0.9.20
pkgrel=5
pkgdesc='Network recon framework based on Nmap, Masscan, Zgrab2, Nuclei, httpx, Zeek (Bro), Argus, Netflow,... Build your own alternatives to Shodan and GreyNoise, run your Passive DNS service, and much more!'
arch=('any')
url='https://ivre.rocks/'
license=('GPL-3.0-or-later')
makedepends=('python' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/ivre/$pkgname/v$pkgver/pkg/apache/ivre.conf")
sha512sums=('4a6775e87c661616335b59010a6ba9da311684e8f37f1f0cfffa364f363ed7cc70a40b2e040b13a66b6bbd4b9a1cbacfa4ffd57cdb43d72c6667082c07f95e97'
            '9db82963976ed0134c88ca779ab2d8ac92fdaf5eff8f6e6c47014b56f92cb78313acd6b6ddee8de13de6c3ae8a2988f216a659496f16b756836475a9b774b0c5')

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  python -m build --wheel --no-isolation
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

  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  rm -r "$pkgdir/usr/lib" \
     "$pkgdir/usr/share/doc" \
     "$pkgdir/usr/share/ivre/dokuwiki" \
     "$pkgdir/usr/share/ivre/web"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/license*
}

package_ivre-docs() {
  pkgdesc+=' (documentation)'

  cd "$srcdir/$pkgbase-$pkgver"

  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  cp README.md "$pkgdir/usr/share/doc/ivre/"
  mv "$pkgdir/usr/share/ivre/web/static/doc" "$pkgdir/usr/share/doc/ivre/html"
  rm -r "$pkgdir/usr/bin" "$pkgdir/usr/lib" \
     "$pkgdir/usr/share/ivre" \
     "$pkgdir/usr/etc/bash_completion.d" \
     "$pkgdir/usr/etc"
}

package_ivre-web() {
  depends=('ivre' 'python-bottle')
  optdepends=('apache: Web server'
              'mod_wsgi: Web server'
              'dokuwiki: Web server (notebook)')
  pkgdesc+=' (web application)'
  backup=('etc/httpd/conf/extra/ivre.conf')

  cd "$srcdir/$pkgbase-$pkgver"

  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  rm -r "$pkgdir/usr/bin" "$pkgdir/usr/lib" \
     "$pkgdir/usr/share/doc" \
     "$pkgdir/usr/share/ivre/zeek" \
     "$pkgdir/usr/share/ivre/data" \
     "$pkgdir/usr/share/ivre/docker" \
     "$pkgdir/usr/share/ivre/geoip" \
     "$pkgdir/usr/share/ivre/honeyd" \
     "$pkgdir/usr/share/ivre/patches" \
     "$pkgdir/usr/etc/bash_completion.d" \
     "$pkgdir/usr/etc"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/license*
  install -Dm0644 "$srcdir/ivre.conf" "$pkgdir/etc/httpd/conf/extra/ivre.conf"
}

package_python-ivre() {
  depends=('python' 'python-pymongo' 'python-pyopenssl' 'python-cryptography')
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

  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  echo -en "-aur-${pkgrel}" >> "${pkgdir}/usr/lib/"python*"/site-packages/ivre/VERSION"
  sed -ri 's#(VERSION = .*)(['\''"])$#\1-aur-'"${pkgrel}"'\2#' "${pkgdir}/usr/lib/"python*"/site-packages/ivre/__init__.py"

  rm -r "$pkgdir/usr/bin" \
     "$pkgdir/usr/share" \
     "$pkgdir/usr/etc/bash_completion.d" \
     "$pkgdir/usr/etc"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/license*
}
