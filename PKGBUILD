# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=python-wpiformat-git
pkgver=2025.78
pkgrel=1
pkgdesc="Linters and formatters for ensuring WPILib's source code conforms to its style guide"
arch=('i686' 'x86_64')
url="https://github.com/wpilibsuite/styleguide"
license=('BSD-3-Clause')
depends=('clang'
         'python-autoflake'
         'python-black'
         'python-cpplint'
         'python-gersemi'
         'python-isort')
makedepends=('python-build'
             'python-installer'
             'python-pytest'
             'python-setuptools-git-versioning')
provides=('python-wpiformat')
conflicts=('python-wpiformat')
source=(git+https://github.com/wpilibsuite/styleguide)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/styleguide"
  year=$(date +%Y)
  echo $year.$(git rev-list --count --after="main@{$(($year - 1))-01-01}" main)
}

prepare() {
  cd "${srcdir}/styleguide/wpiformat"
  sed -i 's/==[0-9]\+\.[0-9]\+\.[0-9]\+//' pyproject.toml
}

build() {
  cd "${srcdir}/styleguide/wpiformat"
  python -m build --wheel
}

check() {
  cd "${srcdir}/styleguide/wpiformat"
  python -m venv --system-site-packages test-env
  test-env/bin/pip install clang-format clang-tidy
  test-env/bin/pip install dist/*.whl --no-deps
  test-env/bin/python -P -m pytest
}

package() {
  cd "${srcdir}/styleguide/wpiformat"
  pip install clang-format clang-tidy --no-deps --root ${pkgdir} --ignore-installed
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Remove duplicates already provided by clang package
  cd "${pkgdir}/usr/bin"
  rm clang-format clang-tidy git-clang-format
}
