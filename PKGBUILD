# Maintainer: Pierre Lalet <pl@ivre.rocks>

pkgbase=ivre-git
_pkgname=ivre
pkgname=('ivre-git' 'ivre-web-git' 'ivre-docs-git' 'python-ivre-git' 'python2-ivre-git')
pkgver=0.9.14.dev64
pkgrel=1
pkgdesc='Network recon framework based on Nmap, Masscan, Zeek (Bro), Argus, Netflow,...'
arch=('any')
url='https://ivre.rocks/'
license=('GPL3')
makedepends=('git')
source=('git+https://github.com/cea-sec/ivre.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  python setup.py --version 2>/dev/null
}

prepare() {
  cp -a $srcdir/$_pkgname{,-py2}
}

build() {
  (
    cd "$srcdir/$_pkgname"

    python setup.py build
  )
  (
    cd "$srcdir/$_pkgname-py2"

    python2 setup.py build
  )
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

  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

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

  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

  cp README.md "$pkgdir/usr/share/doc/ivre/"
  mv "$pkgdir/usr/share/ivre/web/static/doc" "$pkgdir/usr/share/doc/ivre/html"
  rm -r "$pkgdir/usr/bin" "$pkgdir/usr/lib" \
     "$pkgdir/usr/share/ivre" \
     "$pkgdir/etc/bash_completion.d"
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

  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

  rm -r "$pkgdir/usr/bin" "$pkgdir/usr/lib" \
     "$pkgdir/usr/share/doc" \
     "$pkgdir/usr/share/ivre/bro" \
     "$pkgdir/usr/share/ivre/zeek" \
     "$pkgdir/usr/share/ivre/data" \
     "$pkgdir/usr/share/ivre/docker" \
     "$pkgdir/usr/share/ivre/geoip" \
     "$pkgdir/usr/share/ivre/honeyd" \
     "$pkgdir/usr/share/ivre/nmap_scripts" \
     "$pkgdir/etc/bash_completion.d"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/license*
  install -Dm0644 "pkg/apache/ivre.conf" "$pkgdir/etc/httpd/conf/extra/ivre.conf"
}

package_python-ivre-git() {
  depends=('python' 'python-pymongo' 'python-future')
  optdepends=('python-py2neo: experimental flow analysis (Neo4j backend)'
              'python-sqlalchemy: experimental PostgreSQL & SQLite backends'
              'python-psycopg2: experimental PostgreSQL backend'
              'python-elasticsearch: experimental Elasticsearch backend'
              'python-elasticsearch-dsl: experimental Elasticsearch backend'
              'python-pillow: trim screenshots on insertion'
              'tesseract: extract words from screenshots on insertion'
              'python-pycryptodome: extract data from public keys ("ivre getmoduli")'
              'python-scapy: parse PCAP files for ARP inspection (flow analysis)'
              'python-matplotlib: create graphs from command line tools'
              'python-dbus: 3D traceroute graphs'
              'mongodb: database server'
              'postgresql: database server (experimental backend)'
              'neo4j-community: database server (experimental flow analysis)')
  provides=('python-ivre')
  conflicts=('python-ivre')
  pkgdesc+=' (library)'

  cd "$srcdir/$_pkgname"

  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

  rm -r "$pkgdir/usr/bin" \
     "$pkgdir/usr/share" \
     "$pkgdir/etc/bash_completion.d"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/license*
}

package_python2-ivre-git() {
  depends=('python2' 'python2-pymongo' 'python2-future')
  optdepends=('python2-py2neo: experimental flow analysis (Neo4j backend)'
              'python2-sqlalchemy: experimental PostgreSQL & SQLite backends'
              'python2-psycopg2: experimental PostgreSQL backend'
              'python2-elasticsearch: experimental Elasticsearch backend'
              'python2-elasticsearch-dsl: experimental Elasticsearch backend'
              'python2-pillow: trim screenshots on insertion'
              'tesseract: extract words from screenshots on insertion'
              'python2-pycryptodome: extract data from public keys ("ivre getmoduli")'
              'python2-scapy: parse PCAP files for ARP inspection (flow analysis)'
              'python2-matplotlib: create graphs from command line tools'
              'python2-dbus: 3D traceroute graphs'
              'mongodb: database server'
              'postgresql: database server (experimental backend)'
              'neo4j-community: database server (experimental flow analysis)')
  provides=('python2-ivre')
  conflicts=('python2-ivre')
  pkgdesc+=' (library)'

  cd "$srcdir/$_pkgname-py2"

  python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

  rm -r "$pkgdir/usr/bin" \
     "$pkgdir/usr/share" \
     "$pkgdir/etc/bash_completion.d"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/license*
}

