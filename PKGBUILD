# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_name=jarowinkler
pkgname=python-$_name
pkgver=1.0.2
pkgrel=1
pkgdesc="A library for fast approximate string matching using Jaro and Jaro-Winkler similarity"
arch=(x86_64)
url="https://github.com/maxbachmann/JaroWinkler"
license=(MIT)
depends=(python)
makedepends=(
    python-rapidfuzz-capi
    python-scikit-build
    python-setuptools
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('788ac33e6ffdbd78fd913b481e37cfa149288575f087a1aae1a4ce219cb1c654')

build() {
  cd "$_name-$pkgver"
  python setup.py build \
      -G "Unix Makefiles" \
      --build-type None \
      -DCMAKE_CXX_FLAGS_INIT=-fmacro-prefix-map="$srcdir"=. # remove references to srcdir
}

package() {
  cd "$_name-$pkgver"
  python setup.py --skip-cmake install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
