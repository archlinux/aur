pkgbase=python-jq-git
pkgname=python-jq-git
true && pkgbase=('python2-jq')
true && pkgname=('python2-jq-git' 'python-jq-git')
pkgver=20140923
pkgrel=1
pkgdesc="Python bindings for jq"
arch=('i686' 'x86_64')
license=('AGPLv3')
url="https://github.com/mwilliamson/jq.py"
makedepends=('git' 'python' 'python2' 'python-distribute' 'python2-distribute' 'cython')

_gitroot=https://github.com/mwilliamson/jq.py.git
_gitname=jq

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"

  #export LDFLAGS="$LDFLAGS -shared"

  echo "Building Python2"
  rm -rf "$srcdir/$_gitname-py2-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-py2-build"
  cd "$srcdir/$_gitname-py2-build"
  cython jq.pyx
  python2 setup.py build

  echo "Building Python3"
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  cython jq.pyx
  python setup.py build
}

package_python2-jq-git() {
  depends=('python2')
  provides=("python2-jq=${pkgver}")
  conflicts=('python2-jq')
  replaces=('python2-jq')

  cd "${srcdir}/$_gitname-py2-build"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_python-jq-git() {
  depends=('python')
  provides=("python3-jq=${pkgver}" "python-jq=${pkgver}")
  conflicts=('python3-jq' 'python-jq')
  replaces=('python3-jq' 'python-jq')

  cd "${srcdir}/$_gitname-build"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
