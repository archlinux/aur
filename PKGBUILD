# Maintainer: a821
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: bartus
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=pyalpm-git
_pkgname=${pkgname%-git}
pkgver=0.12.0.r1.ge64a1bc
pkgrel=1
pkgdesc="Python bindings for libalpm (git version)"
arch=('x86_64')
url="https://gitlab.archlinux.org/archlinux/pyalpm"
license=('GPL-3.0-or-later')
depends=('python' 'pacman')
makedepends=(
  'git'
  'meson-python'
  'python-build'
  'python-installer'
  'python-wheel'
)
checkdepends=('python-pytest' 'python-pytest-pacman')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

check() {
  meson setup build $_pkgname
  meson compile -C build
  meson test -C build
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
