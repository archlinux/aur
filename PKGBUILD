# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='rapidfuzz'
pkgname="python-${_pkgname}"
pkgver=2.0.6
pkgrel=1
pkgdesc='Rapid fuzzy string matching in Python and C++ using the Levenshtein Distance'
arch=('x86_64')
url='https://github.com/maxbachmann/rapidfuzz'
license=('MIT')
depends=('python-jarowinkler')
makedepends=(
    'python-numpy'
    'python-rapidfuzz-capi'
    'python-scikit-build'
    'python-setuptools'
)
optdepends=('python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b926bca71a113ab8fc91bd03609f0f1836159be0d201e76070132a75e88c2be3')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build \
      -G "Unix Makefiles" \
      --build-type None \
      -DCMAKE_CXX_FLAGS_INIT=-fmacro-prefix-map="$srcdir"=. # remove references to srcdir
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py --skip-cmake install --root="$pkgdir" --optimize=1 --skip-build
  # remove unnecessary files (upstream issue #201)
  rm -r "$pkgdir/usr/include" "$pkgdir/usr/lib/cmake"

  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
