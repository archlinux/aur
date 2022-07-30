# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='rapidfuzz'
pkgname="python-${_pkgname}"
pkgver=2.4.2
pkgrel=1
pkgdesc='Rapid fuzzy string matching in Python using various string metrics'
arch=('x86_64')
url='https://github.com/maxbachmann/rapidfuzz'
license=('MIT')
depends=('python-jarowinkler')
makedepends=(
    'cpp-taskflow'
    'jarowinkler-cpp'
    'python-build'
    'python-installer'
    'python-rapidfuzz-capi'
    'python-scikit-build'
    'rapidfuzz-cpp'
)
checkdepends=(
    python-hypothesis
    python-pandas
    python-pytest
)
optdepends=('python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('5046d8beaa829e4bc172014a006fa78825643fa39589cbf96f0e7bb098f1e973')

build() {
  cd "${_pkgname}-${pkgver}"

  # remove references to srcdir
  CXXFLAGS+=" -fmacro-prefix-map=${srcdir@Q}=."

  RAPIDFUZZ_BUILD_EXTENSION=1 \
      python -m build --wheel --no-isolation \
      --config-setting=--global-option=--generator="Unix Makefiles" \
      --config-setting=--global-option=--skip-generator-test \
      --config-setting=--global-option=--build-type=None
}

check() {
  cd "$_pkgname-$pkgver"
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  PYTHONPATH="$PWD/_skbuild/linux-$CARCH-$python_version/cmake-install/src" pytest
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
