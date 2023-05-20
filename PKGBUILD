# Maintainer: AkechiShiro <akechishiro-aur at lahfa dot xyz>

_pyname=unblob-native
pkgname=python-${_pyname}-git
pkgver=v0.1.1
pkgrel=1
pkgdesc='Performance critical parts of Unblob'
arch=('x86_64')
url="https://github.com/onekey-sec/$_pyname"
license=(MIT)
depends=(python)
conflicts=()
provides=(python-unblob-native)
makedepends=(git python-pip python-build python-installer python-wheel python-setuptools maturin python-maturin)
checkdepends=(python-pytest python-pytest-cov)
source=("git+https://github.com/onekey-sec/$_pyname")
sha256sums=('SKIP')


build() {
    cd "$_pyname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pyname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
 
check()  {
  cd "$_pyname"
  local tmp=$(mktemp -d)
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  ls -lah *
  python -m installer --destdir="$tmp" dist/${_pyname//-/_}-${pkgver:1}-cp*_$CARCH.whl
  PYTHONPATH="$tmp$site_packages" python -m pytest tests

  rmdir --ignore-fail-on-non-empty $tmp 
}

