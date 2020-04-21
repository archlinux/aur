# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=cmake-format
pkgver=0.6.10
pkgrel=1
pkgdesc='Source code formatter for CMake listfiles'
arch=('any')
url='https://github.com/cheshirekow/cmake_format'
license=('GPL3')
depends=('python-setuptools' 'python-six>=1.13.0')
optdepends=('python-yaml>=5.3' 'python-jinja>=2.10.3')
checkdepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cheshirekow/cmake_format/archive/v${pkgver}.tar.gz")
sha512sums=('dcab1d8c8f1048ad6a8a372051b255dbae52bfeafbfa699eca5b9d7517dc61140b410e4205eea2b8cb215dc37c91e3bb0ccebefc1be0c8491f7dbbe846cde886')

check() {
  mkdir "$srcdir/check"
  cd "$srcdir/check"
  export CTEST_OUTPUT_ON_FAILURE=1
  cmake "$srcdir/cmake_format-$pkgver"
  ctest --exclude-regex 'verify-export|cmake_format-command-db-test|cmake_format-validate-database|cmake_format-doc-verify-README\.rst'

  # note: Excluding the tests cmake_format-validate-database (would require gpg2 and
  # python-pgpy and currently fails because an internet connection is required) and
  # cmake_format-command-db-test (fails if CMake version doesn't match the version
  # in upstream's CI). Also exluding verify-export and cmake_format-doc-verify-README.rst
  # which seem specific to how upstream manages their Git repo.
}

package() {
  cd "$srcdir/cmake_format-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
