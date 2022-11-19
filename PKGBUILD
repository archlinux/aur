# Maintainer: Dan McGee <dan@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniele Paolella <dp@mcrservice.it>

pkgname=python38-virtualenv
pkgver=20.16.7
pkgrel=1
pkgdesc="Virtual Python Environment builder"
url="https://virtualenv.pypa.io/"
arch=('any')
license=('MIT')
depends=('python38-distlib' 'python38-filelock' 'python38-platformdirs')
makedepends=('python38-setuptools' 'python38-setuptools-scm' 'python38-sphinx' 'python38-sphinx_rtd_theme'
             'python38-sphinx-argparse' 'towncrier' 'python38-importlib-metadata')
checkdepends=('python38-pytest-freezegun' 'python38-pytest-mock' 'python38-pip' 'python38-coverage' 'fish'
              'xonsh' 'python38-flaky')  # 'tcsh' removed: randomly hangs tests
replaces=('virtualenv')
conflicts=('virtualenv')
options=('!makeflags')
source=(https://github.com/pypa/virtualenv/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('ff8df8a79e6185375b7b5372d6088808d2be24ca3fbebba79a2f87cc595e3d4bf4085d1e55d92aea2ba02f8c8c381635cf9d91627a58b348b4a751f6984747ed')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

prepare() {
  # workaround pip vendorod certifi
  sed -i "s|pkgutil.get_data(\"pip._vendor.certifi\", \"cacert.pem\")|open(os.path.join('/etc/ssl/certs/ca-certificates.crt'), 'rb').read()|" virtualenv-$pkgver/tests/conftest.py
}

build() {
  (cd virtualenv-$pkgver
    python3.8 setup.py build egg_info
    export PYTHONPATH="$PWD/build/lib:$PWD/src"
    sphinx-build -b man docs docs/_build/man
  )
}

check() {
  cd virtualenv-$pkgver
  # tests/unit/create/test_creator.py::test_py_pyc_missing: asking for Python 2.x
  PYTHONPATH="$PWD/build/lib:$PWD/src" python3.8 -m pytest --deselect tests/unit/create/test_creator.py::test_py_pyc_missing
}

package() {
  cd virtualenv-$pkgver
  python3.8 setup.py install --prefix=/usr --root="$pkgdir" --skip-build
  install -Dm 644 docs/_build/man/virtualenv.1 "${pkgdir}/usr/share/man/man1/virtualenv.1"
  ln -s virtualenv.1.gz "${pkgdir}/usr/share/man/man1/virtualenv3.1.gz"

  # link to a version with 3 suffix as well
  ln "$pkgdir/usr/bin/virtualenv" "$pkgdir/usr/bin/virtualenv3"

  install -D -m644 LICENSE -t \
    "$pkgdir"/usr/share/licenses/$pkgname/
}
