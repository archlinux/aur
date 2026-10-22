# Maintainer: Jesus Alvarez <jesusalv@rez.codes>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=cyclopts
pkgname=python-$_name
pkgver=5.3.0
pkgrel=1
pkgdesc='Intuitive, easy CLIs based on type hints.'
arch=('any')
url='https://github.com/BrianPugh/cyclopts'
license=('Apache-2.0')
depends=('python'
         'python-attrs'
         'python-rich'
         'python-rich-rst'
         'python-docstring-parser')
makedepends=('python-hatchling'
             'python-hatch-vcs'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-mock'
              'python-pytest-timeout'
              'python-pydantic'
              'python-syrupy'
              'python-trio'
              'python-yaml'
              'mkdocs'
              'python-pexpect'
              'python-sphinx'
              'python-markdown'
              'python-pymdown-extensions'
              'zsh'
              'fish')
optdepends=('python-trio: trio'

            'python-yaml: yaml'

            'python-sphinx: sphinx'

            'mkdocs: mkdocs'
            'python-markdown: mkdocs'
            'python-pymdown-extensions: mkdocs')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('14a59414bb21652b87974a8433c9cf7d963092ce6cccff683cc2d21f4f1062b7')

build() {
  cd "$_name-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --run-slow
  )
  cd "$_name-$pkgver"
  export TERM=xterm-256color
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  install -m755 /usr/bin/mkdocs /usr/bin/sphinx-build test-env/bin/
  sed -i "1s|.*|#!$PWD/test-env/bin/python|" test-env/bin/mkdocs test-env/bin/sphinx-build
  PATH="$PWD/test-env/bin:$PATH" test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
