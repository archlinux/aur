# Maintainer: Pierre Lalet <pl@ivre.rocks>

pkgbase='ivre'
pkgname=('ivre' 'ivre-web' 'ivre-docs' 'python-ivre' 'python2-ivre')
pkgver=0.9.13
pkgrel=1
pkgdesc='Network recon framework based on Nmap, Masscan, Zeek (Bro), Argus, Netflow,...'
arch=('any')
url='https://ivre.rocks/'
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/cea-sec/$pkgname/v$pkgver/pkg/apache/ivre.conf")
sha256sums=('056388ea0b6da1205ec531f9689043b91449d5b18a658345389de6e30d34f8f7'
            '1befe4daf20ccdf1b1906de244df2de5519843210e95491f3d8fe62ec660848c')

prepare() {
    cp -a ${pkgbase}-${pkgver}{,-py2}
}

build() {
  (
    cd "$srcdir/$pkgbase-$pkgver"
    python setup.py build
  )
  (
    cd "$srcdir/$pkgbase-$pkgver-py2"
    python2 setup.py build
  )
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
  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
  rm -r "${pkgdir}/usr/lib" \
     "${pkgdir}/usr/share/doc" \
     "${pkgdir}/usr/share/ivre/dokuwiki" \
     "${pkgdir}/usr/share/ivre/web"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/LICENSE*
}

package_ivre-docs() {
  pkgdesc+=' (documentation)'
  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
  rm -r "${pkgdir}/usr/bin" "${pkgdir}/usr/lib" \
     "${pkgdir}/usr/share/ivre" \
     "${pkgdir}/etc/bash_completion.d"
}

package_ivre-web() {
  depends=('ivre' 'python-bottle')
  optdepends=('apache: Web server'
              'mod_wsgi: Web server'
              'dokuwiki: Web server (notebook)')
  pkgdesc+=' (web application)'
  backup=('etc/httpd/conf/extra/ivre.conf')
  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
  rm -r "${pkgdir}/usr/bin" "${pkgdir}/usr/lib" \
     "${pkgdir}/usr/share/doc" \
     "${pkgdir}/usr/share/ivre/bro" \
     "${pkgdir}/usr/share/ivre/data" \
     "${pkgdir}/usr/share/ivre/docker" \
     "${pkgdir}/usr/share/ivre/geoip" \
     "${pkgdir}/usr/share/ivre/honeyd" \
     "${pkgdir}/usr/share/ivre/nmap_scripts" \
     "${pkgdir}/etc/bash_completion.d"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/LICENSE*
  install -Dm0644 "$srcdir/ivre.conf" "$pkgdir/etc/httpd/conf/extra/ivre.conf"
}

package_python-ivre() {
  depends=('python' 'python-pymongo' 'python-future')
  optdepends=('python-py2neo: experimental flow analysis (Neo4j backend)'
              'python-sqlalchemy: experimental PostgreSQL & SQLite backends'
              'python-psycopg2: experimental PostgreSQL backend'
              'python-pillow: trim screenshots on insertion'
              'tesseract: extract words from screenshots on insertion'
              'python-pycryptodome: extract data from public keys ("ivre getmoduli")'
              'python-scapy: parse PCAP files for ARP inspection (flow analysis)'
              'python-matplotlib: create graphs from command line tools'
              'python-dbus: 3D traceroute graphs'
              'mongodb: database server'
              'postgresql: database server (experimental backend)'
              'neo4j-community: database server (experimental flow analysis)')
  pkgdesc+=' (library)'
  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
  rm -r "${pkgdir}/usr/bin" \
     "${pkgdir}/usr/share" \
     "${pkgdir}/etc/bash_completion.d"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/LICENSE*
}

package_python2-ivre() {
  depends=('python2' 'python2-pymongo' 'python2-future')
  optdepends=('python2-py2neo: experimental flow analysis (Neo4j backend)'
              'python2-sqlalchemy: experimental PostgreSQL & SQLite backends'
              'python2-psycopg2: experimental PostgreSQL backend'
              'python2-pillow: trim screenshots on insertion'
              'tesseract: extract words from screenshots on insertion'
              'python2-pycryptodome: extract data from public keys ("ivre getmoduli")'
              'python2-scapy: parse PCAP files for ARP inspection (flow analysis)'
              'python2-matplotlib: create graphs from command line tools'
              'python2-dbus: 3D traceroute graphs'
              'mongodb: database server'
              'postgresql: database server (experimental backend)'
              'neo4j-community: database server (experimental flow analysis)')
  pkgdesc+=' (library)'
  cd "$srcdir/$pkgbase-$pkgver-py2"
  python2 setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
  rm -r "${pkgdir}/usr/bin" \
     "${pkgdir}/usr/share" \
     "${pkgdir}/etc/bash_completion.d"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/LICENSE*
}
