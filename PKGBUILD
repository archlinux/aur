# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: sn6uv mathics@angusgriffith.com
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: rnestler
# Contributor: mefistofeles

pkgname=mathics3
_repo_name=mathics-core
pkgver=10.0.1
pkgrel=1
pkgdesc="A general-purpose computer algebra system."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('mathics3-scanner'
         'python-mpmath'
         'python-numpy'
         'python-palettable'
         'python-pillow'
         'python-pint'
         'python-dateutil'
         'python-pympler'
         'python-requests'
         'python-scipy'
         'python-sympy'
         'python-timed-threads')
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
conflicts=('mathics')
replaces=('mathics')
source=("https://github.com/$pkgname/$_repo_name/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('fbf153b110245fbfa4e7f4098f13c86e8d616f986b805ede80d3051b400ddd94')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  #sed -i 's/sympy>=1.13,<1.14/sympy>=1.13/g' pyproject.toml
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Remove tests that require mathics installed before testing:
  rm test/test_main.py
  rm test/test_returncode.py
  PYTHONPATH="." MATHICS_CHARACTER_ENCODING="ASCII" pytest test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
