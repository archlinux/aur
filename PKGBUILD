# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=python-wpiformat-git
pkgver=2023.28
pkgrel=1
pkgdesc="Linters and formatters for ensuring WPILib's source code conforms to its style guide"
arch=('i686' 'x86_64')
url="https://github.com/wpilibsuite/styleguide"
license=('custom=FRC-BSD')
depends=('python-regex' 'python-black')
makedepends=('python-tox')
provides=('python-wpiformat')
conflicts=('python-wpiformat')
source=(git+https://github.com/wpilibsuite/styleguide)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/styleguide"
  year=$(date +%Y)
  echo $year.$(git rev-list --count --after="main@{$(($year - 1))-01-01}" main)
}

build() {
  cd "$srcdir/styleguide/wpiformat"
  python -m build --wheel
}

check() {
  cd "$srcdir/styleguide/wpiformat"
  tox
}

package() {
  cd "$srcdir/styleguide/wpiformat"
  pip install clang-format clang-tidy --no-deps --root ${pkgdir} --ignore-installed
  pip install dist/wpiformat-*.whl --no-deps --root ${pkgdir} --ignore-installed
}
