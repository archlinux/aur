# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='rapidfuzz'
pkgname="python-${_pkgname}"
pkgver=2.2.0
pkgrel=1
pkgdesc='Rapid fuzzy string matching in Python using various string metrics'
arch=('x86_64')
url='https://github.com/maxbachmann/rapidfuzz'
license=('MIT')
depends=('python-jarowinkler')
makedepends=(
    'cpp-taskflow'
    'jarowinkler-cpp'
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
sha256sums=('acb8839aac452ec61a419fdc8799e8a6e6cd21bed53d04678cdda6fba1247e2f')

build() {
  cd "${_pkgname}-${pkgver}"
  RAPIDFUZZ_BUILD_EXTENSION=1 \
      python setup.py build \
      -G "Unix Makefiles" \
      --build-type None \
      -DCMAKE_CXX_FLAGS_INIT=-fmacro-prefix-map="${srcdir@Q}"=. # remove references to srcdir
}

check() {
  cd "$_pkgname-$pkgver"
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  PYTHONPATH="$PWD/_skbuild/linux-$CARCH-$python_version/cmake-install/src" pytest
}

package() {
  cd "${_pkgname}-${pkgver}"
  RAPIDFUZZ_BUILD_EXTENSION=1 \
      python setup.py --skip-cmake install --root="$pkgdir" --optimize=1 --skip-build

  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
