# Maintainer: Donald <d _at_ chaos-reins.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Denis Martinez <deuns.martinez AT gmail.com>
# Contributor: Bogdan Burlacu <bogdan.burlacu AT pm.me>

pkgname=onetbb-git
pkgver=r345.ga6a884ad
pkgrel=1
pkgdesc='High level abstract threading library (oneAPI Threading Building Blocks)'
arch=('x86_64')
url='https://oneapi-src.github.io/oneTBB/'
license=('Apache')
depends=('gcc-libs' 'hwloc')
makedepends=('cmake' 'inetutils' 'ninja' 'python' 'swig')
conflicts=('intel-tbb' 'tbb')
provides=("intel-tbb" "tbb")
replaces=('intel-tbb' 'tbb')
source=("git+https://github.com/oneapi-src/onetbb.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  cmake -G Ninja -D CMAKE_INSTALL_PREFIX=/usr -D TBB_STRICT=OFF -D TBB4PY_BUILD=ON .
  ninja all python_build
}

# rename to check to enable
_check() {
  cd "${srcdir}/${pkgname%-git}"
  ninja test
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  DESTDIR="$pkgdir" ninja install
}
