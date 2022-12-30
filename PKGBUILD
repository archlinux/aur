# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=pology-git
pkgver=0.13.r5625.91ebf8fb
pkgrel=1
pkgdesc='A framework for custom processing of PO files.'
arch=('any')
license=('GPL3')
url='https://invent.kde.org/sdk/pology'
depends=('python' 'gettext' 'python-pyenchant')
makedepends=('git' 'cmake' 'libxml2' 'docbook-xsl' 'libxslt' 'python-pygments')
options=(!makeflags)
optdepends=('python2-dbus: to communicate with external applications'
	    'hunspell-lang: a spell-checking dictionary for your language(s)'
	    'aspell-lang: a spell-checking dictionary for your language(s)'
	    'ispell-lang: a spell-checking dictionary for your language(s)'
	    'languagetool: used by the check-grammar sieve'
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
