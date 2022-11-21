# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=python38-scikit-learn
pkgver=1.1.3
pkgrel=1
pkgdesc="A set of python modules for machine learning and data mining"
arch=(x86_64)
url="https://scikit-learn.org"
license=(BSD)
depends=(python38-scipy python38-joblib python38-numpy python38-threadpoolctl)
optdepends=('python38-matplotlib: plotting capabilities')
makedepends=(cython
             openmp
             python38-{build,installer,wheel}
             python38-setuptools)
options=(!emptydirs)
_archive=${pkgname#python38-}-${pkgver}
source=(https://github.com/scikit-learn/scikit-learn/archive/${pkgver}/$_archive.tar.gz)
sha256sums=('b7c0a9fb8dfcefcfc7ef8fe02a064d194980251d57efaea972cb76005afb3c63')

prepare() {
  cd $_archive
  sed -i -E '/setuptools/s/<[0-9.]+//;/numpy/d' pyproject.toml
}

build() {
  cd $_archive
  python3.8 -m build -wn
}

package() {
  cd $_archive
  python3.8 -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname}/ COPYING

  # See FS#49651
  install -d "${pkgdir}"/usr/share/doc/${pkgname}
  cp -r doc/tutorial "${pkgdir}"/usr/share/doc/${pkgname}/tutorial
}
