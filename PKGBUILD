# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: sn6uv mathics@angusgriffith.com
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: rnestler
# Contributor: mefistofeles

pkgname=mathics
_pkgname=mathics3
pkgver=9.0.0
pkgrel=2
pkgdesc="A general-purpose computer algebra system."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('mathics-scanner'
         'python-mpmath'
         'python-numpy'
         'python-palettable'
         'python-stopit'
         'python-pillow'
         'python-pint'
         'python-dateutil'
         'python-pympler'
         'python-requests'
         'python-scipy'
         'python-sympy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-packaging' 'cython')
checkdepends=('python-pytest')
optdepends=( 'python-ipywidgets: For Manipulate'
             'python-llvmlite: Used for llvm compiling'
             'python-lxml: for HTML parsing used in builtin/fileformats/html'
             'python-psutil: SystemMemory and MemoryAvailable'
             'python-pyocr: Used for TextRecognize'
             'python-scikit-image>=0.17: FindMinimum can use this; used by Image as well'
             'python-unidecode: Used in Transliterate'
             'python-wordcloud>=1.9.3: Used in builtin/image.py by WordCloud')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_pkgname/$pkgname-core/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('8b49c156b012dd8ac9ebb08963208a7de3651cd1eb048ec60a4e1f9be586e703')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  sed -i 's/sympy>=1.13,<1.14/sympy>=1.13/g' pyproject.toml
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # Remove failing tests: https://github.com/Mathics3/mathics-core/issues/1498
  # Remove test that changed for SymPy 1.14:
  sed -i '229,$d' test/builtin/numbers/test_calculus.py
  # Remove tests that require mathics installed before testing:
  rm test/test_main.py
  rm test/test_returncode.py
  PYTHONPATH="." MATHICS_CHARACTER_ENCODING="ASCII" pytest test
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
