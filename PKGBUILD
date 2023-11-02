# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: bartus
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Dave Reisner <d@falconindy.com>

_pkgname=pyalpm
pkgname=$_pkgname-git
pkgver=0.10.6.r9.g90941d0
pkgrel=1
pkgdesc="Libalpm bindings for Python 3 (Git version)"
arch=('x86_64')
url="https://git.archlinux.org/pyalpm.git/"
license=('GPL3')
depends=('python>=3.6' 'pacman>=5')
makedepends=('git' 'python-setuptools' 'python-pkgconfig')
checkdepends=('python-pytest' 'python-pytest-pacman')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=('git+https://gitlab.archlinux.org/archlinux/pyalpm.git'
        'pyalpm-mr19.patch::https://gitlab.archlinux.org/archlinux/pyalpm/-/merge_requests/19.patch')
sha256sums=('SKIP'
            '78098e9ebdc2e90846cb836913edab0ca74abdf5c8e846468063300a017d5fb7')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  )
}

prepare() {
  cd $_pkgname
  patch -Np1 -i ../pyalpm-mr19.patch
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
