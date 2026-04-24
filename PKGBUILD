# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>
# Contributor: Manolo Martínez <manolo@austrohungaro.com>

_pkgname=greg
pkgname=greg-git
pkgver=v0.4.7.r75.g2e4cbf0
pkgrel=2
pkgdesc="A command-line podcast aggregator."
arch=('x86_64')
url="https://github.com/manolomartinez/greg"
license=('GPL-3.0-only')
depends=('python-feedparser')
optdepends=('python-stagger-git: writing metadata'
  'wget: alternative downloadhandler'
  'aria2: alternative downloadhandler'
  'python-beautifulsoup4: convert html to text for tagging'
)
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
conflicts=('greg')
source=('git+https://github.com/manolomartinez/greg.git'
        '00-replace-pkg_resources.patch')
md5sums=('SKIP'
         '1c2d6b7a7b0512a8720fb447ad1e2c93')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -Np1 < "$srcdir/00-replace-pkg_resources.patch"
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
