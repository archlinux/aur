# Maintainer: a821
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: bartus
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=pyalpm-git
_pkgname=${pkgname%-git}
pkgver=0.10.12.r2.g9f9448f
pkgrel=1
pkgdesc="Libalpm bindings for Python 3 (Git version)"
arch=('x86_64')
url="https://gitlab.archlinux.org/archlinux/pyalpm"
license=('GPL-3.0-only')
depends=('python' 'pacman')
makedepends=(
  'git'
  'meson'
  'meson-python'
  'python-build'
  'python-installer'
  'python-sphinx'
  'python-wheel'
)
checkdepends=('python-pytest' 'python-pytest-pacman')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  )
}

build() {
  arch-meson build $_pkgname
  meson compile -C build
  meson compile -C build doc
}

check() {
  meson install -C build --destdir "$srcdir"
  local _site=$(python -c 'import site; print(site.getsitepackages()[0])')
  PYTHONPATH="$srcdir/$_site" pytest -v $_pkgname/test
}

package() {
  meson install -C build --destdir "$pkgdir"

  # install docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  rm -rf build/html/.doctrees
  cp -rv build/html "$pkgdir/usr/share/doc/$pkgname"
}
