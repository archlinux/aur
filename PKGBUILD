# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=filetags-git
pkgver=2025.11.16.1.r241.778a2de
pkgrel=1
pkgdesc="Management of simple tags within file names"
arch=('any')
license=('GPLv3')
url="https://github.com/novoid/filetags"
depends=('python' 'python-colorama' 'python-clint')
makedepends=('git' 'python-build' 'python-installer')
provides=("${pkgname/-git/}")
conflicts=("${pkgname/-git/}")
source=("git+https://github.com/novoid/filetags.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  printf "%s.r%s.%s" "$(grep 'version = ' pyproject.toml | cut -d\" -f2)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname/-git/}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname/-git/}"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm 643 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}
