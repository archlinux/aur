# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_name=jarowinkler
pkgname=python-$_name
pkgver=1.0.2
pkgrel=3
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
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "system_lib.patch")
sha256sums=('788ac33e6ffdbd78fd913b481e37cfa149288575f087a1aae1a4ce219cb1c654'
            '86c8215609e33539406eff8a1d778ae63dcbcd21a753f69a17f89e401f0d2e6c')

prepare() {
  cd "$_name-$pkgver"

  # build using system jarowinkler-cpp
  patch -Np1 -i "$srcdir/system_lib.patch"
  rm -r extern/jarowinkler-cpp
}

build() {
  cd "$_name-$pkgver"
  python setup.py build \
      -G "Unix Makefiles" \
      --build-type None \
      -DCMAKE_CXX_FLAGS_INIT=-fmacro-prefix-map="${srcdir@Q}"=. # remove references to srcdir
}

package() {
  cd "$_name-$pkgver"
  python setup.py --skip-cmake install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
