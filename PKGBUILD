# Maintainer: Hao Zhang <theivorytower [at] gmail [dot] com>

pkgname=python-pyql-git
pkgver=20170427
pkgrel=1
pkgdesc="QuantLib Cython Wrappers"
arch=("i686" "x86_64")
url="https://github.com/enthought/pyql"
license=("BSD")
options=(!libtool)
depends=("quantlib>=1.5" "python" "python-pandas>=0.16.2" "python-tabulate" "python-numpy>1.7.0" "python-pytz>2011.11" "python-dateutil>2.0" "python-six" )
makedepends=("cython>=0.23" "git" "boost")

_gitroot=https://github.com/enthought/pyql.git
_gitname=pyql

prepare() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
}

build() {
  msg "Starting build..."
  cd "$srcdir"/"$_gitname"
  python setup.py build_ext
}

package() {
  cd "$srcdir"/"$_gitname"
  python setup.py install --prefix=usr/ --root=$pkgdir
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
  cd "$pkgdir"
  find . \( -name '*.cpp' -or -name '*.pyx' \) -delete
}

pkgver() {
  cd "$srcdir"/"$_gitname"
  git log -1 --format=%ci|sed  "s/ .*//g"|sed "s/-//g"
}
