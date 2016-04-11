# Maintainer: Étienne Deparis <etienne [at] depar [dot] is>
# Contributor: eolianoe <eolianoe [at] googlemail [dot] com>

pkgname=khal-git
_gitname=khal
pkgver=0.7.0
pkgrel=1
pkgdesc="Command line CalDav client"
license=("MIT")
url="http://lostpackets.de/khal/"
depends=('python-urwid' 'python-xdg' 'vdirsyncer' 'python-dateutil'
         'python-configobj' 'python-tzlocal' 'python-icalendar'
         'sqlite' 'python-pkginfo')
makedepends=('python-setuptools' 'python-setuptools-scm'
             'git' 'python-sphinxcontrib-newsfeed')
optdepends=('python-setproctitle: Display a clearer name in your process list')
source=("${_gitname}::git+https://github.com/geier/khal.git")
md5sums=('SKIP')
install='khal.install'
provides=('khal')
conflicts=('khal')
arch=('any')
options=(!emptydirs)

pkgver() {
  cd "$srcdir/${_gitname}/"
  python setup.py --version
}

build() {
  cd "$srcdir/${_gitname}/"
  python setup.py build

  cd "$srcdir/${_gitname}/doc"
  PYTHONPATH="$srcdir/khal" make man
}

package() {
  cd "$srcdir/${_gitname}/"
  python setup.py install --root=$pkgdir

  install -D -m644 khal.conf.sample "${pkgdir}/usr/share/doc/${_gitname}/examples/khal.conf"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
  install -D -m644 AUTHORS.txt "${pkgdir}/usr/share/licenses/${_gitname}/AUTHORS"

  install -D -m644 doc/build/man/khal.1 "${pkgdir}/usr/share/man/man1/khal.1"

  # You can comment the following to disable zsh completion (if you do
  # not plan to use zsh for example)
  install -D -m644 misc/__khal "${pkgdir}/usr/share/zsh/site-functions/_khal"
}
