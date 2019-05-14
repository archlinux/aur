# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgbase=python-mbdata-git
_pkgbase=${pkgbase%-git}
_name=${_pkgbase#python-}
pkgname=($pkgbase ${pkgbase/python-/python2-})
pkgver=25.0.0.r0.g384f8ab
pkgrel=1
pkgdesc='MusicBrainz database tools for Python'
url="https://github.com/lalinsky/$_name"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd python3
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cp -a $_name python2
  mv $_name python3
}

build() {
  pushd python3
  python3 setup.py build
  popd

  pushd python2
  python2 setup.py build
}

package_python-mbdata-git() {
  depends=(python python-psycopg2 python-six)
  provides=(${_pkgbase})
  conflicts=(${_pkgbase})

  cd python3
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
  install -d "$pkgdir/usr/share/doc/$_pkgbase"
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgbase" README.rst CHANGELOG.rst settings.py.sample mbslave.conf.default
}

package_python2-mbdata-git() {
  depends=(python2 python2-psycopg2 python2-six)
  provides=(${_pkgbase/python-/python2-})
  conflicts=(${_pkgbase/python-/python2-})

  cd python2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgbase/python-/python2-}/LICENSE"
  install -d "$pkgdir/usr/share/doc/${_pkgbase/python-/python2-}"
  install -m644 -t "$pkgdir/usr/share/doc/${_pkgbase/python-/python2-}" README.rst CHANGELOG.rst settings.py.sample mbslave.conf.default
  # `mbslave` is provided by python-mbdata-git (for Python 3); no sense in duplicating
  rm -rf "$pkgdir/usr/bin"
}
