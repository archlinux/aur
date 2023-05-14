# Maintainer: Mark Wagie <mark at proton dot me>
pkgname=python-libsass
_name=${pkgname#python-}
pkgver=0.22.0
pkgrel=2
pkgdesc="Sass for Python: A straightforward binding of libsass for Python."
arch=('x86_64' 'aarch64')
url="https://sass.github.io/libsass-python/"
license=('MIT')
depends=('libsass' 'python-setuptools')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
provides=('_sass.abi3.so')
checkdepends=('python-pip' 'python-pytest' 'python-werkzeug')
_commit=b18db090672676d7c58fcd52e6ae0eb505993886  # tags/0.22.0^0
source=("git+https://github.com/sass/libsass-python.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_name-python"
  export SYSTEM_SASS="1"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_name-python"
  local PLATFORM=$(python -c "import sysconfig; print(sysconfig.get_platform())")
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  export PYTHONPATH=build/lib.${PLATFORM}-cpython-${python_version//./}
  pytest sasstests.py
}

package() {
  cd "$srcdir/$_name-python"
  export SYSTEM_SASS="1"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  # We don't want to install tests
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm "${pkgdir}${site_packages}/sasstests.py" \
    "${pkgdir}${site_packages}"/__pycache__/sasstests.*.pyc
}
