# Maintainer: a821
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: bartus
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=pyalpm-git
_pkgname=${pkgname%-git}
pkgver=0.11.1.r0.g2c7917a
pkgrel=1
pkgdesc="Libalpm bindings for Python 3 (Git version)"
arch=('x86_64')
url="https://gitlab.archlinux.org/archlinux/pyalpm"
license=('GPL-3.0-only')
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
