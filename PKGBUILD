# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname='diceware-git'
pkgver=1.0.1.r14.gbf29ffd
pkgrel=1
pkgdesc='Wordlist-based password generator'
url="https://github.com/ulif/diceware"
depends=('python')
makedepends=(
  'python-build' 'python-installer' 'python-wheel' 'python-setuptools'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'python-docutils'
  'git'
)
checkdepends=(
  'python-pytest'
  'python-pytest-cov'
  'python-coverage'
)
license=('GPL-3.0-or-later')
arch=('any')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --always | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
  rst2man docs/manpage.rst > dist/diceware.1
}

check() {
  cd "$pkgname"
  python -m pytest
}

package() {
  cd "$pkgname"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 dist/diceware.1 -t "$pkgdir"/usr/share/man/man1/
}

# vim:set ts=2 sw=2 et
