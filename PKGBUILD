# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-xdoctest
_pkgname="${pkgname#python-}"
pkgver=1.1.0
pkgrel=1
pkgdesc='A Python package for executing tests in documentation strings'
arch=('any')
url='https://github.com/Erotemic/xdoctest'
license=('MIT')
depends=('python' 'python-six' 'python-pygments')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
_commit='9a6f1e777272285d3d2d0465830f7d299de30652'
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python setup.py build
}

check() {
  cd "$pkgname"

  # tests expect the package to actually be installed, so here's a temporary environment
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/${site_packages}:$PYTHONPATH"
  export PATH="$PWD/tmp_install/usr/bin:${PATH}"
  pytest
}

package() {
  cd "$pkgname"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
