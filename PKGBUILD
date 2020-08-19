# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=cmake-format
pkgver=0.6.12
pkgrel=1
pkgdesc='Source code formatter for CMake listfiles'
arch=('any')
url='https://github.com/cheshirekow/cmake_format'
license=('GPL3')
depends=('python-setuptools' 'python-six>=1.13.0')
optdepends=('python-yaml>=5.3' 'python-jinja>=2.10.3' 'python-argcomplete: automatic shell completion')
checkdepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cheshirekow/cmake_format/archive/v${pkgver}.tar.gz")
sha512sums=('e54d54ba592875ad2d8683a3be7dce10c8ddbf6ef39ac127510de8de3598763179768594d0f30ab98df87a19a989920916dcf9d759abff59854d738227a7644e')

check() {
  mkdir "$srcdir/check"
  cd "$srcdir/check"
  export CTEST_OUTPUT_ON_FAILURE=1
  cmake "$srcdir/cmake_format-$pkgver"
  ctest --exclude-regex 'verify-export|cmakelang-command-db-test|cmakelang-validate-database|cmakelang-doc-verify-README\.rst'

  # note: Excluding the tests cmakelang-validate-database (would require gpg2 and
  # python-pgpy and currently fails because an internet connection is required) and
  # cmakelang-command-db-test (fails if CMake version doesn't match the version
  # in upstream's CI). Also exluding verify-export and cmakelang-doc-verify-README.rst
  # which seem specific to how upstream manages their Git repo.
}

package() {
  cd "$srcdir/cmake_format-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
