# Maintainer: Gustav Sörnäs <gustav@sornas.net>
# vim: ts=2 sw=2 et:

pkgname=nekontrol-git
pkgver=v0.2.5.r49.g6652622
pkgrel=1
pkgdesc="Run and test Kattis problems"
arch=('any')
url="https://github.com/Quaqqer/nekontrol"
license=('unknown')
depends=('python' 'python-click' 'python-termcolor' 'python-requests'
         'python-appdirs' 'python-natsort' 'python-rich' 'python-lxml')
optdepends=('gcc: for testing solutions in C++ using gcc'
            'clang: for testing solutions in C++ using clang'
            'rust: for testing solutions in Rust'
            'pypy3: for testing solutions in Python using pypy'
            'ghc: for testing solutions in Haskell'
            'lua: for testing solutions in Lua'
            'luajit: for testing solutions in Lua using luajit'
            'nodejs: for testing solutions in JavaScript (Node.js)')
makedepends=('git' 'python-poetry' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --abbrev=7 --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python -m build --wheel --no-isolation

  # install to tmp dir for tests
  python -m installer --destdir=test_dir dist/*.whl

}

check() {
  cd "$srcdir/${pkgname%-git}"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest -vv tests
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
