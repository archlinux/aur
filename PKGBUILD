# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: fzerorubigd <fzero@rubi.gd>
_pkgmain=backports.csv
pkgname=python-$_pkgmain-git
pkgver=1.0.7.r4.g6981b5c
pkgrel=1
pkgdesc="Backport of Python 3 csv module."
arch=('any')
url="https://github.com/ryanhiebert/backports.csv"
license=('PSF-2.0')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
options=(!emptydirs)
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  git -C "${srcdir}/${_pkgmain}" describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/${_pkgmain}" clean -dfx
}

build() {
  cd "$srcdir/$_pkgmain"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgmain"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -m755 -d "$pkgdir/usr/share/doc/${pkgname%-git}"
  install -m644 -t "$pkgdir/usr/share/doc/${pkgname%-git}/" README.rst HISTORY.rst
}
