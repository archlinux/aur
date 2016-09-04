# Maintainer: Thomas Ascher <thomas.ascher@gmx.at>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>
_pkgname=k3d
pkgname=${_pkgname}-git
pkgver=r3516.5a9dcad
pkgrel=2
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
makedepends=('asciidoc'
             'boost'
             'cmake'
             'doxygen'
	     'git'
             'graphviz'
             'libxslt')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/K-3D/${_pkgname}.git")
sha256sums=(SKIP)

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "${srcdir}/${_pkgname}-build"
  cd "${srcdir}/${_pkgname}-build"
  # aqsis: only required for Qt UI rendering preview
  # carve: current library version in AUR is not compatible, newer snapshot is required
  # gperftools: python wrapper generation fails if enabled
  cmake "${srcdir}/${_pkgname}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DK3D_BUILD_AQSIS_MODULE=OFF \
        -DK3D_BUILD_CARVE_MODULE=OFF \
        -DK3D_BUILD_GPERFTOOLS_MODULE=OFF \
        -DBOOST_SYSTEM_NO_DEPRECATED=1 \
        -DPython_ADDITIONAL_VERSIONS=2.7
  make -j $(cat /proc/cpuinfo | grep processor | wc -l)
}

package() {
  cd "${srcdir}/${_pkgname}-build"
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
