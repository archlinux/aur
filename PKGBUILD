# Maintainer: Florijan Hamzic <fh@infinicode.de>

pkgname='manticoresearch'
pkgver=2.7.5
pkgrel=1
pkgdesc='Manticore Search is a fork of Sphinx, a fast, stable and powerful open source full-text search solution'
arch=('x86_64')
url='https://manticoresearch.com/'
license=('GPL')
backup=('etc/conf.d/sphinx')
conflicts=('sphinx' 'sphinx-bin')
install='sphinx.install'
depends=('unixodbc' 'expat' 'libmariadbclient' 'postgresql-libs')

source=(
    "https://github.com/manticoresoftware/manticoresearch/archive/${pkgver}.tar.gz"
    'sphinx.conf.d'
    'sphinx.install'
    'sphinx.service')

build() {
  cd "${srcdir}"
  cp "${srcdir}/${pkgname}-${pkgver}/src/sphinxversion.h.in" "${srcdir}/${pkgname}-${pkgver}/src/sphinxversion.h"

  mkdir -p "${srcdir}/build"
  cd build

  cmake -D WITH_MYSQL=1 WITH_PGSQL=1 "${srcdir}/${pkgname}-${pkgver}"
  make -j4
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # create directories
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/etc/sphinx
  install -d "$pkgdir"/usr/share/sphinx/lib
  #install -d "$pkgdir"/usr/share/licenses/sphinx

  mv sphinx.conf.in "${pkgdir}"/etc/sphinx/sphinx.conf
  mv sphinx-min.conf.in "${pkgdir}"/etc/sphinx/sphinx-min.conf

  mv api "${pkgdir}"/usr/share/sphinx/lib/api
  # mv doc/license-* "$pkgdir"/usr/share/licenses/sphinx/
  mv doc "${pkgdir}"/usr/share/sphinx/lib/doc

  cd "${srcdir}/build/src/"

  # create links
  install -Dm755 "indexer" "${pkgdir}/usr/bin/indexer"
  ln -s "/usr/bin/indexer" "${pkgdir}/usr/bin/manticoresearch-indexer"

  install -Dm755 "indextool" "${pkgdir}/usr/bin/indextool"
  ln -s "/usr/bin/indextool" "${pkgdir}/usr/bin/manticoresearch-indextool"

  install -Dm755 "searchd" "${pkgdir}/usr/bin/searchd"
  ln -s "/usr/bin/searchd" "${pkgdir}/usr/bin/manticoresearch-searchd"

  install -Dm755 "spelldump" "${pkgdir}/usr/bin/spelldump"
  ln -s "/usr/bin/spelldump" "${pkgdir}/usr/bin/manticoresearch-spelldump"

  install -Dm755 "wordbreaker" "${pkgdir}/usr/bin/wordbreaker"
  ln -s "/usr/bin/wordbreaker" "${pkgdir}/usr/bin/manticoresearch-wordbreaker"

  install -Dm644 "${srcdir}/sphinx.conf.d" "${pkgdir}/etc/conf.d/sphinx"
  install -Dm644 "${srcdir}/sphinx.service" "${pkgdir}/usr/lib/systemd/system/sphinx.service"
}

md5sums=('e7a941b7fb85eb12b072374882517201'
         '48e3e1857919d26d5104a48caffb531b'
         '7a2c3709978d7e904a5b541baf255a90'
         'fe06a8aff0520a6f75596ee43d2e5935')
