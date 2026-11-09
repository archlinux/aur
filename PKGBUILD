# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=smithy-checksums
pkgname=python-$_name
pkgver=0.1.0
pkgrel=1
pkgdesc='Checksum algorithms for Smithy tooling, with native acceleration.'
arch=('x86_64' 'aarch64')
_repo='https://github.com/smithy-lang/smithy-python'
url="$_repo/tree/develop/packages/$_name"
license=('Apache-2.0')
depends=('python'
         'gcc-libs'
         'glibc')
makedepends=('python-maturin'
             'python-build'
             'python-installer')
checkdepends=('python-pytest')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/$_name/v$pkgver.tar.gz")
sha256sums=('8933605127686a1e46c00c25f13641c94d2f5b37fbc88b2c1ae54791aaab63b6')

build() {
  cd "smithy-python-$_name-v$pkgver/packages/$_name"
  export SMITHY_PYTHON_NATIVE_BUILD=always
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --override-ini="addopts="
    --import-mode=importlib
  )
  cd "smithy-python-$_name-v$pkgver/packages/$_name"
  python -m installer --destdir=test-install dist/*.whl
  PYTHONPATH="$PWD/test-install$(python -c 'import site; print(site.getsitepackages()[0])')" python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "smithy-python-$_name-v$pkgver/packages/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
