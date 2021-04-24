# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: dibblethewrecker <dibblethewrecker.at.jiwe.dot.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=proj6
_pkgname=proj
pkgver=6.3.2
pkgrel=1
pkgdesc='Cartographic Projections library (version 6)'
arch=('x86_64')
url="https://trac.osgeo.org/proj/"
license=('MIT')
depends=('sqlite')
makedepends=('cmake' 'gmock' 'gtest')
source=(https://github.com/OSGeo/PROJ/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz
        https://download.osgeo.org/proj/proj-datumgrid-1.8.zip
        add_suffix.patch)
sha256sums=('cb776a70f40c35579ae4ba04fb4a388c1d1ce025a1df6171350dc19f25b80311'
            'b9838ae7e5f27ee732fb0bfed618f85b36e8bb56d7afb287d506338e9f33861e'
            'ff22b6684c72e0a24d6b214487f09d74c80b1d0520d90297afbac5ce9163e59f')

prepare() {
  cd "${srcdir}"/$_pkgname-$pkgver
  patch -p0 -i "${srcdir}"/add_suffix.patch
}

build(){
  cmake -S $_pkgname-$pkgver -B build -DCMAKE_INSTALL_PREFIX='/usr' -DUSE_EXTERNAL_GTEST=ON \
        -DINCLUDEDIR=/usr/include/proj6 -DDATADIR=/usr/share/proj6 -DCMAKECONFIGDIR=/usr/lib/cmake/proj6
  cmake --build build
}

check(){
  ctest --test-dir build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_pkgname-$pkgver/COPYING "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  bsdtar --no-same-owner -xzvf "${srcdir}"/proj-datumgrid-1.8.zip -C "${pkgdir}"/usr/share/$pkgname

  # This is simpler than rewriting the CMake install commands.
  cd "$pkgdir"/usr/lib/cmake/proj6
  for fn in *.cmake; do
    mv "$fn" "${fn/proj4/proj6}"
  done
  cd "$pkgdir"/usr/share/man/man1
  for fn in *.1; do
    mv "$fn" "${fn/.1/6.1}"
  done
  cd "$pkgdir"/usr/share/man/man3
  for fn in *.3; do
    mv "$fn" "${fn/.3/6.3}"
  done
}
