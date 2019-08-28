# Maintainer: Clément DEMOULINS <clement@archivel.fr>

pkgname=vcsn-git
_realname=vcsn
pkgver=v2.8.r2.g1780f25b8
pkgrel=1
pkgdesc="Finite state machine manipulation platform, consisting of a library and tools implemented on top of it."
arch=('i686' 'x86_64')
url="http://vcsn.lrde.epita.fr/"
license=('GPL3')
depends=('boost' 'gcc' 'ccache' 'libltdl' 'jupyter' 'mathjax' 'graphviz' 'yaml-cpp')
optdepends=('python-regex: to get better error messages')
makedepends=('git' 'texlive-core' 'doxygen' 'python2-docutils')
conflicts=('vaucanson-git' 'vaucanson' 'vcsn')
provides=('vaucanson-git' 'vaucanson' 'vcsn')
options=(!buildflags)

source=(git+https://gitlab.lrde.epita.fr/vcsn/vcsn.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_realname}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

check() {
  cd "$srcdir/${_realname}"
  ./tests/bin/vcsn python -c 'import vcsn; vcsn.B.expression("a").automaton()'
}

build() {
  cd "$srcdir/${_realname}"
  ./bootstrap
  ./configure --prefix="/usr" CXXFLAGS='-O3' CPPFLAGS='-DNDEBUG'
  # make V=1
  # Temporary fix for Boost Python 1.64
  make V=1 VISIBILITY_CXXFLAGS=""
}

package() {
  cd "$srcdir/${_realname}"
  make install DESTDIR="$pkgdir"
}

