# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=filetags-git
pkgver=2026.06.06.1.r296.308c763
pkgrel=1
pkgdesc="Management of simple tags within file names"
arch=('any')
license=('GPLv3')
url="https://github.com/novoid/filetags"
depends=('python' 'python-colorama' 'python-clint')
makedepends=('git' 'python-build' 'python-installer')
provides=("${pkgname/-git/}")
conflicts=("${pkgname/-git/}")
source=("git+https://github.com/novoid/filetags.git"
        "0001-Allow-_:-separators.patch")
sha512sums=('SKIP'
            '39884fe0fc4ed33835417d57d9f4be6b24612c8ace7697288ce0d670852d30d2385f6af86a55715be73da574a44936e5ea37f3c25e070eae3f559ff4c81d2ae7')

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  printf "%s.r%s.%s" "$(grep 'version = ' pyproject.toml | cut -d\" -f2)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname/-git/}"
  patch -Np1 -i "$srcdir/0001-Allow-_:-separators.patch"
}

build() {
  cd "$srcdir/${pkgname/-git/}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname/-git/}"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}
