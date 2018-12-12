# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

pkgname=libzypp
pkgver=17.10.2
pkgrel=3
pkgdesc="Package, Patch, Pattern, and Product Management"
arch=('i686' 'x86_64')
url="https://github.com/openSUSE/libzypp"
license=('GPL')
depends=('libsolv-git' 'openssl' 'curl' 'libsystemd')
makedepends=('git' 'cmake' 'ninja' 'boost' 'dejagnu' 'graphviz'
             'libxml2' 'expat' 'gnupg' 'rpm-org' 'libproxy' 'asciidoc')
provides=('libzypp')
source=("https://github.com/openSUSE/libzypp/archive/${pkgver}.tar.gz")
sha256sums=('3f7eced19de3b892b845147b01220de2a80dc6f721deb148c65902fe62ae5dc7')

build() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build && cd build
  cmake \
    -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_SKIP_RPATH=1 \
    -D DISABLE_AUTODOCS=1 \
    -D DISABLE_LIBPROXY=0 \
    ..
  ninja
}

package() {
  cd "${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}/" ninja install

  # cmake fix (see GH#28)
  mkdir -p "${pkgdir}/usr/lib/cmake/Zypp"
  mv "${pkgdir}/usr/share/cmake/Modules/FindZypp.cmake" "${pkgdir}/usr/lib/cmake/Zypp/ZyppConfig.cmake"
  mv "${pkgdir}/usr/share/cmake/Modules/ZyppCommon.cmake" "${pkgdir}/usr/lib/cmake/Zypp/ZyppCommon.cmake"
  
  # hacky lib64 symlink fix
  mv "${pkgdir}"/usr/lib64/* "${pkgdir}/usr/lib/"
  rmdir "${pkgdir}/usr/lib64"
}
