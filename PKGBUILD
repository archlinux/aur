# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=pology-git
pkgver=0.13.r5681.4ed65229
pkgrel=1
pkgdesc='A framework for custom processing of PO files.'
arch=('any')
license=('GPL3')
url='https://invent.kde.org/sdk/pology'
depends=('python' 'gettext')
makedepends=('git' 'cmake' 'libxml2' 'docbook-xsl' 'libxslt' 'python-pygments')
checkdepends=('python-pytest')
options=(!makeflags)
optdepends=('python-dbus: to communicate with external applications'
	    'python-pyenchant: for spell checking functionality'
	    'languagetool: used by the check-grammar sieve'
	    'apertium: used by the pomtrans script'
	    'git: for processing files under version control'
	    'subversion: for processing files under version control')
provides=('pology')
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

check() {
  cd ${srcdir}/pology
  python -m pytest
}

package() {
  cd ${srcdir}/pology/build
  make DESTDIR="${pkgdir}" install

  install -d ${pkgdir}/usr/share/apps/katepart/syntax
  ln -s /usr/share/pology/syntax/kate/synder.xml ${pkgdir}/usr/share/apps/katepart/syntax/synder.xml

  install -d ${pkgdir}/etc/bash_completion.d
  ln -s /usr/share/pology/completion/bash/pology ${pkgdir}/etc/bash_completion.d/pology
}
