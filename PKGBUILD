# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=qt5-quartz-git
pkgver=v1.0.0.7.g1f07a9b
pkgrel=1
pkgdesc="Raytrace over Vulkan for Qt (works only Nvidia RTX users)"
arch=('x86_64')
url='https://github.com/Nadrin/Quartz'
license=('GPL')
depends=('qt5-3d'
         'assimp-git'
         'vulkan-icd-loader'
         )
makedepends=('qt5-tools'
             'cmake'
             'git'
             'python'
             'vulkan-headers'
             )
provides=('qt5-quatz')
conflicts=('qt5-quatz')
source=('git+https://github.com/Nadrin/Quartz.git'
        'esee.esee'
        )
sha256sums=('SKIP'
            'SKIP'
            )

pkgver() {
  cd Quartz
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd Quartz
  patch -p1 -i "${srcdir}/esee.esee"

  python src/raytrace/renderers/vulkan/shaders/compile.py
}

build() {
  cd build
  cmake ../Quartz \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_EXAMPLES=OFF \
    -DCMAKE_SKIP_RPATH=ON

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
