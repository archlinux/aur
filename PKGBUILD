# Maintainer: Thomas Ascher <thomas.ascher@gmx.at>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>
pkgname=k3d
pkgver=0.8.0.6
pkgrel=3
pkgdesc="A free 3D modelling and animation software"
arch=('x86_64' 'i686')
url="http://www.k-3d.org"
license=('GPL')
depends=('cgal'
         'collada-dom'
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
optdepends=('aqsis: Rendering engine')
makedepends=('asciidoc'
             'boost'
             'cmake'
             'doxygen'
	     'git'
             'graphviz'
             'libxslt')
source=("https://github.com/K-3D/k3d/archive/${pkgname}-${pkgver}.tar.gz"
        "gtkmm_inclues.patch"
        "cmake_python2_detection.patch"
        "iostream_includes.patch")
sha256sums=('c884667715c13543354d1e3e8edca9557a20d5ad3aa6bc35762394916655e817'
            '701865e74d57c93688a463d19df98afbe2f7b9030ce4201515abd7fdbd98da85'
            'ec8d4c398350baf4c8694f0faa06a5a160f88e8e826cd7ca6d079bd0afceef35'
            'fdf2378ec7a0813eb56dfb168b81f9146e02516fc0bfbe5e7be11108fa81926c')

prepare() {
	cd "${pkgname}-${pkgname}-${pkgver}"
	patch -Np1 -i "${srcdir}/gtkmm_inclues.patch"
	patch -Np1 -i "${srcdir}/cmake_python2_detection.patch"
	patch -Np1 -i "${srcdir}/iostream_includes.patch"
}

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  # for profiling add -DK3D_ENABLE_PROFILING=ON to cmake configuration and gperftools to dependencies
  cmake "${srcdir}/${pkgname}-${pkgname}-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DK3D_BUILD_CARVE_MODULE=OFF \
        -DBOOST_SYSTEM_NO_DEPRECATED=1
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

post_install() {
  update-desktop-database -q
}

post_upgrade() {
  post_install $1
}

post_remove() {
  post_install $1
}
