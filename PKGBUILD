# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgname=mapbox-geometry.hpp
pkgver=2.0.3
pkgrel=2
pkgdesc='C++ geometry types'
arch=('any')
url='https://github.com/mapbox/geometry.hpp'
license=('ISC')
checkdepends=('gcc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9d750d34576069bcc4f39677af08cde2862fbe4b8c0d9af504877c2fae2ae273')

check() {
  local src_dir="${srcdir}/geometry.hpp-${pkgver}"

  cat <<'EOF' > "${srcdir}/geometry_check.cpp"
#include <mapbox/geometry/point.hpp>
#include <mapbox/geometry/polygon.hpp>
#include <cassert>

int main() {
  mapbox::geometry::point<double> pt{1.0, 2.0};
  mapbox::geometry::linear_ring<double> ring{
    {0.0, 0.0},
    {10.0, 0.0},
    {10.0, 10.0},
    {0.0, 10.0},
    {0.0, 0.0}
  };
  mapbox::geometry::polygon<double> poly{ring};

  assert(pt.x == 1.0);
  assert(pt.y == 2.0);
  assert(poly.size() == 1);
  assert(poly.front().size() == 5);
  return 0;
}
EOF

  g++ ${CXXFLAGS} ${CPPFLAGS} \
    -I"${src_dir}/include" \
    "${srcdir}/geometry_check.cpp" \
    -o "${srcdir}/geometry_check"

  "${srcdir}/geometry_check"
}

package() {
  local src_dir="${srcdir}/geometry.hpp-${pkgver}"

  install -D --mode=644 \
    "${src_dir}"/include/mapbox/*.hpp \
    --target-directory="${pkgdir}/usr/include/mapbox"

  install -D --mode=644 \
    "${src_dir}"/include/mapbox/geometry/*.hpp \
    --target-directory="${pkgdir}/usr/include/mapbox/geometry"

  install -D --mode=644 \
    "${src_dir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
