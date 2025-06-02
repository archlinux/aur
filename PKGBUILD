# Maintainer: Pierre Lalet <pl@ivre.rocks>

pkgbase=ivre-git
_pkgname=ivre
pkgname=('ivre-git' 'ivre-web-git' 'ivre-docs-git' 'python-ivre-git')
pkgver=0.9.21.dev79
pkgrel=1
pkgdesc='Network recon framework based on Nmap, Masscan, Zgrab2, Nuclei, httpx, Zeek (Bro), Argus, Netflow,... Build your own alternatives to Shodan and GreyNoise, run your Passive DNS service, and much more!'
arch=('any')
url='https://ivre.rocks/'
license=('GPL-3.0-or-later')
makedepends=('git' 'python' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=('git+https://github.com/ivre/ivre.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  python setup.py --version 2>/dev/null
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

package_ivre-git() {
  depends=('python-ivre-git')
  optdepends=('ivre-docs-git: Documentation'
              'ivre-web-git: Web server'
              'nmap: Network scan'
              'masscan: Network scan'
              'zmap: Network scan'
              'zeek: Network traffic analysis'
              'argus: Network traffic analysis'
              'nfdump: Netflow analysis'
              'imagemagick: Screenshots via Nmap scripts'
              'phantomjs: HTTP screenshots via Nmap script'
              'ffmpeg: RTSP Screenshots via Nmap script')
  provides=('ivre')
  conflicts=('ivre')

  cd "$srcdir/$_pkgname"

  python -m installer --destdir="$pkgdir" --compile-bytecode=2 "dist/${_pkgname}-${pkgver}-py3-none-any.whl"

  rm -r "$pkgdir/usr/lib" \
     "$pkgdir/usr/share/doc" \
     "$pkgdir/usr/share/ivre/dokuwiki" \
     "$pkgdir/usr/share/ivre/web"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/license*
}

package_ivre-docs-git() {
  provides=('ivre-docs')
  conflicts=('ivre-docs')
  pkgdesc+=' (documentation)'

  cd "$srcdir/$_pkgname"

  python -m installer --destdir="$pkgdir" --compile-bytecode=2 "dist/${_pkgname}-${pkgver}-py3-none-any.whl"

  cp README.md "$pkgdir/usr/share/doc/ivre/"
  mv "$pkgdir/usr/share/ivre/web/static/doc" "$pkgdir/usr/share/doc/ivre/html"
  rm -r "$pkgdir/usr/bin" "$pkgdir/usr/lib" \
     "$pkgdir/usr/share/ivre" \
     "$pkgdir/usr/etc/bash_completion.d" \
     "$pkgdir/usr/etc"
}

package_ivre-web-git() {
  depends=('python-ivre-git' 'python-bottle')
  optdepends=('apache: Web server'
              'mod_wsgi: Web server'
              'dokuwiki: Web server (notebook)')
  provides=('ivre-web')
  conflicts=('ivre-web')
  pkgdesc+=' (web application)'
  backup=('etc/httpd/conf/extra/ivre.conf')

  cd "$srcdir/$_pkgname"

  python -m installer --destdir="$pkgdir" --compile-bytecode=2 "dist/${_pkgname}-${pkgver}-py3-none-any.whl"

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
  install -Dm0644 "pkg/apache/ivre.conf" "$pkgdir/etc/httpd/conf/extra/ivre.conf"
}

package_python-ivre-git() {
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
  provides=('python-ivre')
  conflicts=('python-ivre')
  pkgdesc+=' (library)'

  cd "$srcdir/$_pkgname"

  python -m installer --destdir="$pkgdir" --compile-bytecode=2 "dist/${_pkgname}-${pkgver}-py3-none-any.whl"

  echo -en "-aur-${pkgrel}" >> "${pkgdir}/usr/lib/"python*"/site-packages/ivre/VERSION"
  sed -ri 's#(VERSION = .*)(['\''"])$#\1-aur-'"${pkgrel}"'\2#' "${pkgdir}/usr/lib/"python*"/site-packages/ivre/__init__.py"

  rm -r "$pkgdir/usr/bin" \
     "$pkgdir/usr/share" \
     "$pkgdir/usr/etc/bash_completion.d" \
     "$pkgdir/usr/etc"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/license*
}
