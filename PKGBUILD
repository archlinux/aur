# Maintainer: Chris <christopher.r.mullins g-mail>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=gdcm
pkgver=2.6.3
pkgrel=4
pkgdesc='a C++ library for DICOM medical files'
arch=('i686' 'x86_64')
url='http://gdcm.sourceforge.net'
license=('BSD')
optdepends=('python2: python bindings'
            'java-runtime: java bindings'
            'vtk: vtk bindings'
            'swig: generate python wrappers')
makedepends=('cmake')
source=("http://sourceforge.net/projects/gdcm/files/gdcm%202.x/GDCM%20$pkgver/gdcm-$pkgver.tar.gz"
        "skip-manpages.patch")
sha512sums=('3d3abcaa84b23b0a689d1ba530bd65408e220cce2461b10ff5c0dd07a67fc0ccb29269fa4eb733121d227adab9e5e8b64885d06709850c43f0b1a1e8cca33a07'
            '2178179be7adbb16334cfa9f4c19165d97ffbf099bb5c134fef7aedea26e7e47b3c67cf0de1af8b2aa1be150acc323d1b0f9c737003b75ccec4f02af5df2b52e')

prepare() {
 cd "${srcdir}"/${pkgname}-${pkgver}
 patch -Np1 -i ../../skip-manpages.patch
}

build() {
  cd "$srcdir"
  mkdir -p build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/usr \
    -DGDCM_BUILD_SHARED_LIBS:BOOL=ON \
    -DGDCM_BUILD_TESTING:BOOL=OFF \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DGDCM_DOCUMENTATION_SKIP_MANPAGES:BOOL=ON \
    ../$pkgname-$pkgver 
    make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -Dm644 Copyright.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
}

