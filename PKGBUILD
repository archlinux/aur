# Maintainer: Thomas Ascher <thomas.ascher@gmx.at>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>
pkgname=k3d
pkgver=0.8.0.5
pkgrel=2
pkgdesc="A free 3D modelling and animation software"
arch=('x86_64' 'i686')
url="http://www.k-3d.org"
license=('GPL')
depends=('cgal'
         'ftgl'
         'glew'
         'gnome-vfs'
         'gtkglext'
         'gtkmm'
         'gtksourceview2'
         'gts'
         'imagemagick'
         'lib3ds'
         'libjpeg-turbo'
         'ode'
         'openexr')
makedepends=('asciidoc'
             'boost'
             'cmake'
             'doxygen'
             'git'
             'graphviz'
             'libxslt')
source=("git+https://github.com/K-3D/${pkgname}.git#tag=${pkgname}-${pkgver}"
        "cmake_paths_and_defs_fixes.patch")
sha256sums=(SKIP
            'fc8b7be14382b6b49fa908ff43773df5ec4e7b3401cc22629f6e2f6f7c4ee704')

build() {
  cd "${srcdir}/${pkgname}"
  patch -Np1 -i "${srcdir}/cmake_paths_and_defs_fixes.patch"
  mkdir -p "${srcdir}/${pkgname}-build"
  cd "${srcdir}/${pkgname}-build"
  # aqsis module: AUR package build is broken and cmake package information missing
  # carve module: current library version is no longer compatible
  # collada io module: current library version is no longer compatible 
  # google perftools module: upstream release is broken, cmake error
  # opencascade module: upstream release is broken, missing header
  cmake "${srcdir}/${pkgname}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DK3D_BUILD_AQSIS_MODULE=OFF \
        -DK3D_BUILD_CARVE_MODULE=OFF \
        -DK3D_BUILD_COLLADA_IO_MODULE=OFF \
        -DK3D_BUILD_GOOGLE_PERFTOOLS_MODULE=OFF \
        -DK3D_BUILD_OPENCASCADE_MODULE=OFF
  make -j $(cat /proc/cpuinfo | grep processor | wc -l)
}

package() {
  cd "${srcdir}/${pkgname}-build"
  make DESTDIR="${pkgdir}/" install
}
