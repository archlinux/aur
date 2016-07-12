# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python-pocketsphinx-git
pkgbase=python-pocketsphinx-git
pkgname=('python-pocketsphinx-git' 'python2-pocketsphinx-git' 'sphinxbase-git' 'pocketsphinx-git')
pkgver=r68.24ab446
pkgrel=1
pkgdesc='Python interface to CMU SphinxBase and PocketSphinx libraries'
arch=('i686' 'x86_64')
url='https://github.com/bambocher/pocketsphinx-python'
license=('BSD')
depends=('python' 'swig')
makedepends=('git')
source=('python-pocketsphinx::git+https://github.com/cmusphinx/pocketsphinx-python.git')
sha256sums=('SKIP')
_gitname='python-pocketsphinx'

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"
  
  # Should I do a status before init?
  git submodule init
  git submodule update

  cd "${srcdir}"
  cp -rf "${_gitname}" python2-pocketsphinx-git
}

build() {
  cd "${srcdir}/${_gitname}/sphinxbase"
  ./autogen.sh --prefix=/usr
  make

  cd "${srcdir}/${_gitname}/pocketsphinx"
  ./autogen.sh --prefix=/usr
  make

  cd "${srcdir}/${_gitname}"
  python setup.py build

  export PYTHON=/usr/bin/python2
  
  cd "${srcdir}/python2-pocketsphinx-git/sphinxbase"
  ./autogen.sh --prefix=/usr --libdir=/garbage --bindir=/garbage --includedir=/garbage --datarootdir=/garbage
  make

  cd "${srcdir}/python2-pocketsphinx-git/pocketsphinx"
  ./autogen.sh --prefix=/usr --libdir=/garbage --bindir=/garbage --includedir=/garbage --datarootdir=/garbage
  make

  cd "${srcdir}/python2-pocketsphinx-git"
  python2 setup.py build
}

package_sphinxbase-git() {
  provides=('sphinxbase')
  conflicts=('sphinxbase')

  cd "${srcdir}/${_gitname}/sphinxbase"
  
  export PYTHON=/usr/bin/python
  make DESTDIR="${pkgdir}/" install
  rm -f "${pkgdir}/usr/lib/python3.5/site-packages/sphinxbase/__init__.py"
  rm -f "${pkgdir}/usr/lib/python3.5/site-packages/sphinxbase/sphinxbase.py"
  rm -rf "${pkgdir}/usr/lib/python3.5/site-packages/sphinxbase/__pycache__"
}

package_pocketsphinx-git() {
  provides=('pocketsphinx')
  conflicts=('procketsphinx')
  depends=('sphinxbase')

  cd "${srcdir}/${_gitname}/pocketsphinx"
  
  export PYTHON=/usr/bin/python
  make DESTDIR="${pkgdir}/" install
  rm -f "${pkgdir}/usr/lib/python3.5/site-packages/pocketsphinx/__init__.py"
  rm -f "${pkgdir}/usr/lib/python3.5/site-packages/pocketsphinx/pocketsphinx.py"
  rm -rf "${pkgdir}/usr/lib/python3.5/site-packages/pocketsphinx/__pycache__"
}

package_python-pocketsphinx-git() {
  cd "${srcdir}/${_gitname}"

  export PYTHON=/usr/bin/python
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-pocketsphinx-git() {
  export PYTHON=/usr/bin/python2

  cd "${srcdir}/python2-pocketsphinx-git/sphinxbase"
  make DESTDIR="${pkgdir}/" install

  cd "${srcdir}/python2-pocketsphinx-git/pocketsphinx"
  make DESTDIR="${pkgdir}/" install
  
  cd "${srcdir}/python2-pocketsphinx-git"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  
  msg "Removing files provided by sphinxbase and pocketsphinx"
  rm -rf "${pkgdir}/garbage"
}

# vim: set ts=2 sw=2 ft=sh noet:
