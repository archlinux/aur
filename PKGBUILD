# Maintainer: jerry73204 <jerry73204 at gmail dot com>
pkgname=tilecache
pkgver=2.11
pkgrel=3
pkgdesc='TileCache is an implementation of a WMS-C compliant server made available under the BSD license by MetaCarta.'
arch=('x86_64')
url='http://tilecache.org/'
license=('BSD')
depends=('python2')
optdepends=(
  'memcached'
  'mapserver'
  'python2-pillow'
  'python2-boto'
  'python2-flup'
  'python2-mapnik'
  'python2-memcached'
  'python2-wsgiref'
  'python2-paste'
)
makedepends=(
  'python-sphinx'
)
backup=('etc/tilecache.cfg')
source=("http://tilecache.org/${pkgname}-${pkgver}.tar.gz"
        'apache.example.conf')
sha256sums=('b46dc2731a19b40e3207cf3c9b43ea59b899a622a586aaa3c397c3b5aa00f887'
            '06583b0fdbee9a057d8e8aeb3591a4cd1d5dbe230c71f4f0f0588042dc0dce57')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i 's_#!/usr/bin/python_#!/usr/bin/env python2_g' \
      ez_setup.py \
      setup.py \
      tilecache_clean.py \
      tilecache_http_server.py \
      tilecache_install_config.py \
      tilecache_seed.py \
      tilecache.cgi \
      tilecache.fcgi
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # compile Python scripts
  python2 setup.py build

  # build docs
  cd docs
  make html
}

package() {
  # install Python scripts
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1

  install -dm0755 "${pkgdir}/etc"
  install -m0644 tilecache.cfg "${pkgdir}/etc/tilecache.cfg"
  rm -v "${pkgdir}/usr/dev.ini"  # remove unused dev.ini

  # install docs
  cd "${srcdir}/${pkgname}-${pkgver}/docs/_build"
  local DOCS_DIR="${pkgdir}/usr/share/doc/tilecache"
  install -dm0755 "$DOCS_DIR"
  cp -rv html "$DOCS_DIR/html"

  # install example apache config
  cd "${srcdir}"
  local CONFIG_DIR="${pkgdir}/etc/webapps/tilecache"
  install -dm0755 "$CONFIG_DIR"
  install -m0644 apache.example.conf "$CONFIG_DIR/apache.example.conf"

  # build CGI directory
  local CGI_DIR="${pkgdir}/usr/share/tilecache/sbin"
  install -dm0755 "$CGI_DIR"
  mv -v "${pkgdir}/usr/bin/tilecache.cgi" "${CGI_DIR}/tilecache.cgi"
  mv -v "${pkgdir}/usr/bin/tilecache.fcgi" "${CGI_DIR}/tilecache.fcgi"
}

# vim:set ts=2 sw=2 et:
