# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=pology
pkgver=0.12
pkgrel=1
pkgdesc='A framework for custom processing of PO files.'
arch=('any')
license=('GPL3')
url='http://techbase.kde.org/Localization/Tools/Pology'
depends=('python2' 'gettext')
makedepends=('cmake' 'libxml2' 'docbook-xsl' 'epydoc' 'python2-pygments')
options=(!makeflags)
optdepends=('python2-dbus: to communicate with external applications'
	    'python2-pyenchant: spell checking functionality (needs a dictionary)'
	    'hunspell-lang: a spell-checking dictionary for your language(s)'
	    'aspell-lang: a spell-checking dictionary for your language(s)'
	    'ispell-lang: a spell-checking dictionary for your language(s)'
	    'languagetool: used by the check-grammar sieve'
	    'apertium: used by the pomtrans script'
	    'git: for processing files under version control'
	    'subversion: for processing files under version control')
conflicts=('pology-svn')
changelog=changelog
source=(http://pology.nedohodnik.net/release/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('33fd75b7214fc70882df128b5651d4870cb7d6cc73ca27c5517b4686976de5de')

prepare() {
  sed -i -e 's|^#!/usr/bin/env python$|#!/usr/bin/env python2|' $(find ${srcdir} -name '*.py')
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DDOCBOOK_XSL_DIR=/usr/share/xml/docbook/xsl-stylesheets-1.78.1/
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -d ${pkgdir}/usr/share/apps/katepart/syntax
  ln -s /usr/share/pology/syntax/kate/synder.xml ${pkgdir}/usr/share/apps/katepart/syntax/synder.xml

  install -d ${pkgdir}/etc/bash_completion.d
  ln -s /usr/share/pology/completion/bash/pology ${pkgdir}/etc/bash_completion.d/pology
}
