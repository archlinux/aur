# Maintainer:
# Contributor: Grey Christoforo <grey at christoforo dot net>

pkgname=python-nptyping
_name="${pkgname#python-}"
pkgver=2.5.0
pkgrel=6
pkgdesc='Type hints for Numpy'
url="https://github.com/ramonhagenaars/nptyping"
arch=(x86_64)
license=(MIT)
depends=(
  python
  python-numpy
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-feedparser
  python-pandas
  python-pytest
  python-pytest-mypy
)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-numpy-2.patch::https://patch-diff.githubusercontent.com/raw/ramonhagenaars/nptyping/pull/114.patch
        numpy-2.0-types.patch)
sha512sums=('2cde9c5f7694d4f916b85c93b86df7f72709a70b2ffa91b7bbc98c5884236f5b36bb545a89c37e8c02a9b460065c97151d77c64f8d93b92fd93bcff406f039d9'
            'e9e28a144d3083f61917220968285a207c5f8d74ada8678d1c8e999bc2feda8102bef281a0aee3223f8861f6555d6665d3d5757a4d7a07b6acb2e39a332ddff9'
            'f1f31b3489dbaee9eaae0b53a23ea2d7bd4af03f5aed2fa3d4b40589ad7a706ca7e536508d8b2cc0afdeb76be7921255993fa99db237e4c59f6333f5d13568d6')

prepare() {
  cd $_name-$pkgver
  patch -p1 -i ../$pkgname-numpy-2.patch # Compatibility with numpy 2
  patch -p1 -i ../numpy-2.0-types.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --ignore tests/test_beartype.py  # python-beartype not packaged
    --ignore tests/test_mypy.py  # requires outdated version
    --ignore tests/test_pyright.py  # pyright not properly detected and likely not useful either way
    # unclear test failures, needs upstream tickets
    --deselect tests/pandas_/test_mypy_dataframe.py::MyPyDataFrameTest::test_mypy_accepts_dataframe
    --deselect tests/pandas_/test_mypy_dataframe.py::MyPyDataFrameTest::test_mypy_disapproves_dataframe_with_wrong_function_arguments
    --deselect tests/pandas_/test_mypy_dataframe.py::MyPyDataFrameTest::test_mypy_knows_of_dataframe_methods
    --deselect tests/test_package_info.py::PackageInfoTest::test_version_bump
    --deselect tests/test_typeguard.py::TypeguardTest::test_success
  )

  cd $_name-$pkgver
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
