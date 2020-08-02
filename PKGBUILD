# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=cmake-format
pkgver=0.6.11
pkgrel=1
pkgdesc='Source code formatter for CMake listfiles'
arch=('any')
url='https://github.com/cheshirekow/cmake_format'
license=('GPL3')
depends=('python-setuptools' 'python-six>=1.13.0')
optdepends=('python-yaml>=5.3' 'python-jinja>=2.10.3' 'python-argcomplete: automatic shell completion')
checkdepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cheshirekow/cmake_format/archive/v${pkgver}.tar.gz")
sha512sums=('52b6752d2b62097df790f432ecfb2e3d196950ad49548fa3c68a329f16f9e2d3db2741debe2b3f913894857805b60b1b460a939fd1b34a58efa738175839dea8')

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
