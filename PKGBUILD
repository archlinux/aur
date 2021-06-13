# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=pology-git
pkgver=0.13.r5504.72c73d7d
pkgrel=1
pkgdesc='A framework for custom processing of PO files.'
arch=('any')
license=('GPL3')
url='https://invent.kde.org/sdk/pology'
depends=('python2' 'gettext' 'python2-pyenchant')
makedepends=('git' 'cmake' 'libxml2' 'docbook-xsl' 'epydoc' 'python2-pygments')
options=(!makeflags)
optdepends=('python2-dbus: to communicate with external applications'
	    'hunspell-lang: a spell-checking dictionary for your language(s)'
	    'aspell-lang: a spell-checking dictionary for your language(s)'
	    'ispell-lang: a spell-checking dictionary for your language(s)'
	    'languagetool: used by the check-grammar sieve'
	    'katepart4: for synder syntax highlighting in KDE editors'
	    'apertium: used by the pomtrans script'
	    'git: for processing files under version control'
	    'subversion: for processing files under version control')
provides=('pology')
replaces=('pology-svn')
changelog=changelog
source=("git+https://invent.kde.org/sdk/pology.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/pology
  printf "%s.r%s.%s" "$(cat VERSION)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i -e 's|^#!/usr/bin/env python$|#!/usr/bin/env python2|' $(find ${srcdir} -name '*.py')
}

build() {
  cd ${srcdir}/pology
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ${srcdir}/pology/build
  make DESTDIR="${pkgdir}" install

  install -d ${pkgdir}/usr/share/apps/katepart/syntax
  ln -s /usr/share/pology/syntax/kate/synder.xml ${pkgdir}/usr/share/apps/katepart/syntax/synder.xml

  install -d ${pkgdir}/etc/bash_completion.d
  ln -s /usr/share/pology/completion/bash/pology ${pkgdir}/etc/bash_completion.d/pology
}
