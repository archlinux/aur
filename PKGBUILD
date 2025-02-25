# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=ffmpy
pkgname=python-${_name}
pkgver=0.5.0
pkgrel=1
pkgdesc="A simple Python wrapper for FFmpeg."
arch=(any)
url="https://github.com/Ch00k/ffmpy"
license=(MIT)
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
depends=('python>=3.8' 'ffmpeg')
checkdepends=('python-pytest' 'python-pytest-cov')
optdepends=('python-psutil')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9c06b857ec87c469c8733c03435455976696b5aaa1bc64644d80581d1eccd112')

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
  )
  cd "${srcdir}"/${_name}-${pkgver}
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}

