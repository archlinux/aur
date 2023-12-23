# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=python-mutagen-git
pkgver=1.47.0.r19.gf95d3ae
pkgrel=2
arch=(any)
pkgdesc="An audio metadata tag reader and writer (python library)"
url="https://mutagen.readthedocs.io/en/latest/"
license=(GPL2)
depends=(python)
makedepends=(git python-build python-wheel python-installer python-setuptools)
checkdepends=(python-coverage python-pytest python-hypothesis liboggz vorbis-tools faad2

             python-eyed3
             libogg libvorbis)
provides=(python-mutagen)
conflicts=(python-mutagen)
source=("git+https://github.com/quodlibet/mutagen.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/mutagen"
  git describe --long --tags | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/mutagen"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/mutagen"
  python -m coverage run -m unittest discover -v tests
  python -m coverage report -m
}

package() {
  cd "${srcdir}/mutagen"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {NEWS,README.rst} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
