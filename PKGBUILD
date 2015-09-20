# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Suat SARIALP <muhendis.suat@gmail.com>

set -u
pkgname='docbook-utils'
pkgver='0.6.14'
pkgrel='5'
pkgdesc='Shell scripts to manage DocBook documents'
#arch=('i686' 'x86_64')
arch=('any')
url='http://sources.redhat.com/docbook-tools/'
license=('GPL2')
depends=('docbook-sgml31' 'docbook-dsssl' 'jade' 'docbook-xml-dtd' 'perl-sgmls' 'lynx' 'opensp')
conflicts=('docbook2x')
source=('html.tar.gz' "ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES/${pkgname}-${pkgver}.tar.gz" 'docbook-utils-0.6.14-grep_fix-1.patch')
sha256sums=('257789a91ec92f5db809e966aaa324c2d259298d4815d356932b1134e6a3ba14'
            '48faab8ee8a7605c9342fb7b906e0815e3cee84a489182af38e8f7c0df2e92e9'
            'ddf0ddca0a540fd4f34f38b7b9090f96746e37da12b4e2bf8f4174c5ad61f54a')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/docbook-utils-0.6.14-grep_fix-1.patch"
  ./configure --prefix='/usr' --sysconfdir='/etc'
  cp -p "${srcdir}/html"/* 'doc/HTML'
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" mandir='/usr/share/man' htmldir="/usr/share/doc/${pkgname}/html" install
  #common alternative names
  local doctype
  for doctype in 'html' 'ps' 'dvi' 'man' 'pdf' 'rtf' 'tex' 'texi' 'txt'; do
    ln -sf "docbook2${doctype}" "${pkgdir}/usr/bin/db2${doctype}"
  done
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
