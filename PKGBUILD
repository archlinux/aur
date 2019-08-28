# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: bartus
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Dave Reisner <d@falconindy.com>

_pkgname=pyalpm
pkgname=$_pkgname-next-git
pkgver=0.8.4.r72.g871346f
pkgrel=1
pkgdesc="Libalpm bindings for Python 3 (Git version, compatible with pacman-git)"
arch=('x86_64')
url="https://git.archlinux.org/pyalpm.git/"
license=('GPL3')
depends=('python>=3.6' 'pacman-git')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=('git+https://git.archlinux.org/pyalpm.git#branch=next')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  )
}

prepare() {
  cd $_pkgname
  # https://github.com/archlinux/pyalpm/pull/31
  sed -i 's#str(excinfo)#str(excinfo.value)#' test/*.py
}

build() {
  cd $_pkgname

  python setup.py build
}

check() {
  cd $_pkgname

  PYTHONPATH="$(ls -d build/lib.linux-$CARCH-*)" pytest -v test
}

package() {
  cd $_pkgname

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
