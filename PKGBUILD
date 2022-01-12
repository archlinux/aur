# Maintainer: Electro707 <develop@electro707.com>

pkgname=python-pynec-git
pkgver=r97.03713c8
pkgrel=1
pkgdesc="Antenna simulation in python"
url="https://github.com/tmolteno/python-necpp/tree/master/PyNEC"
arch=(x86_64)
license=(GPL)
depends=(python python-numpy)
makedepends=(swig cython python-setuptools)
source=("${pkgname}"'::git+https://github.com/tmolteno/python-necpp.git' build_diff.patch)
sha256sums=(SKIP f5454afc38f05cb6db2b300c83bfe4981ed353b938f602a405a13c7a19dada1e)

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Patch build.sh: https://github.com/tmolteno/python-necpp/issues/18
  patch "${srcdir}/${pkgname}/PyNEC/build.sh" build_diff.patch
  cd "${srcdir}/${pkgname}"
  git submodule update --init --force
}

build() {
  cd "${srcdir}/${pkgname}/PyNEC"
  ./build.sh
}

package() {
  cd "${srcdir}/${pkgname}/PyNEC"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir"
}
