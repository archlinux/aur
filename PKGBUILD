# Maintainer: Shravan Mandava <shravan@mandava8.com>
 
pkgname=musefetch-git
pkgver=cfe0031
pkgrel=1
pkgdesc="A fetch script for playerctl"
arch=('any')
url='https://github.com/AverageComet250/musefetch'
license=('BSD-3-Clause')

provides=(musefetch)
conflicts=(musefetch)

depends=(
  python
  python-dbus
  python-term-image
)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
  python-wheel
)

source=("${pkgname}::git+https://github.com/AverageComet250/musefetch.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
 
prepare() {
  cd "$srcdir/$pkgname"
 
  # arch python-term-image actually works so...
  sed -i 's|"term-image @ git+https://github.com/AverageComet250/term-image"|"term-image"|' pyproject.toml
}
 
build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}
 
package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
