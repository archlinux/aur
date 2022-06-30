# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_name=jarowinkler
pkgname=python-$_name
pkgver=1.0.5
pkgrel=1
pkgdesc="A library for fast approximate string matching using Jaro and Jaro-Winkler similarity"
arch=(x86_64)
url="https://github.com/maxbachmann/JaroWinkler"
license=(MIT)
depends=(python)
makedepends=(
    jarowinkler-cpp
    python-rapidfuzz-capi
    python-scikit-build
)
checkdepends=(
    python-hypothesis
    python-pytest
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d0ecdae8e122594d22e09ceebfca23342d290a9305d669958e674e0e39e2e260')

build() {
  cd "$_name-$pkgver"
  python setup.py build \
      -G "Unix Makefiles" \
      --build-type None \
      -DCMAKE_CXX_FLAGS_INIT=-fmacro-prefix-map="${srcdir@Q}"=. # remove references to srcdir
}

check() {
  cd "$_name-$pkgver"
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  PYTHONPATH="$PWD/_skbuild/linux-$CARCH-$python_version/cmake-install" pytest
}

package() {
  cd "$_name-$pkgver"
  python setup.py --skip-cmake install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
