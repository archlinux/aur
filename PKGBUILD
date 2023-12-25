# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-html
pkgname=python-pytest-html
pkgver=3.2.0
pkgrel=3
pkgdesc="Plugin for generating HTML reports for pytest results"
arch=(any)
url="https://github.com/pytest-dev/pytest-html"
license=(MPL-2.0)
depends=(
  python
  python-py
  python-pytest
  python-pytest-metadata
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-ansi2html
  python-pytest-mock
  python-pytest-rerunfailures
  python-pytest-xdist
)
source=(
  $_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
  $pkgname-3.2.0-build_system.patch
)
sha512sums=('096e9d52a5f0ea69b18bf7743d6ff45fb4ac7ba59acc6b85a59e8d3d9f65868cdea157954e1e7d84da69f85e3a7d35c073f2cbe39cd9b3275d89e51b0c33dea6'
            '83c82f453ae07c030ba7807674ac6a33ca119ba482d52e73d1093395dad30e95bbe196f501290a70714b02ba40fdf8d1d82b5a790e02bc891605917fd4f1bdde')
b2sums=('547d0cee2bb8bda8ab5a9d1c45fca2b5bdb73dd68f4c119c4643392a81826fdedfc9bd0cf35fd88f7fb16792867f2de5e1369ddf50ce245433265a2a84f0dfc1'
        '826b11bf59badf2a24cc92c53a8d70e2f95b5ab20c623042c7b72e7f2dba7b13287d5811acfaf42c4931401d97bec29c933cc755b4f5a22257a13bfe6a47448b')

prepare() {
  # remove the use of wheel and setuptools-scm-git-archive: https://github.com/pytest-dev/pytest-html/pull/567
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-3.2.0-build_system.patch
}

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --deselect testing/test_pytest_html.py::TestHTML::test_environment
    --deselect testing/test_pytest_html.py::TestHTML::test_environment_xdist
    --deselect testing/test_pytest_html.py::TestHTML::test_environment_xdist_reruns
    --deselect 'testing/test_pytest_html.py::TestHTML::test_environment_list_value[content0-123Go, Hello, fzWZP6vKRv, garAge, hello]'
    --deselect 'testing/test_pytest_html.py::TestHTML::test_environment_list_value[content1-1, 2, 2, 4, 54]'
    --deselect 'testing/test_pytest_html.py::TestHTML::test_environment_list_value[content2-400, 5.4, Yes]'
    --deselect 'testing/test_pytest_html.py::TestHTML::test_environment_unordered_dict_value[unordered_dict0-<td>content</td>\\n\\s+<td>{"123Go": 5, "Hello": 5, "fzWZP6vKRv": 10, "garAge": 6, "hello": 5}</td>]'
    --deselect 'testing/test_pytest_html.py::TestHTML::test_environment_unordered_dict_value[unordered_dict1-<td>content</td>\\n\\s+<td>{"First Link": "<a href=\\\\"https://www.w3schools.com\\\\">W3Schools</a>", "Second Link": "<a href=\\\\"https://www.w3schools.com\\\\">W2Schools</a>", "Third Link": "<a href=\\\\"https://www.w3schools.com\\\\">W4Schools</a>"}</td>]'
    --deselect testing/test_pytest_html.py::TestHTML::test_environment_table_redact_list
  )
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
