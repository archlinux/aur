# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
# Contributor: Gianluca Montecchi <gian@grys.it>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Dmitriy Morozov <archlinux@foxcub.org>
# Contributor: Larry Hajali <larryhaja [at] gmail [dot] com>

pkgname=libqglviewer-qt5
_pkgname=libQGLViewer
pkgver=2.9.1
pkgrel=1
pkgdesc="C++ library based on Qt that eases the creation of OpenGL 3D viewers, qt5 version"
url="https://github.com/GillesDebunne/libQGLViewer"
arch=('i686' 'x86_64' 'aarch64')
depends=(
	'gcc-libs'
	'glibc'
	'glu'
	'libglvnd'
	'qt5-base'
)
makedepends=('cmake')
conflicts=('libqglviewer')
license=('GPL-2.0-only' 'GPL-3.0-only' 'LicenseRef-libQGLViewer')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
"qt-option.patch"
)
sha256sums=('ea4f9ac627c136a6851ffd3763b154f21c87a58bcec4e5d5b2d07e65a403096b'
            '7501d3fe3b2b280cf4a5cd3b5cc7b0198bd9bbeae6f960cd4d20e9c94a9310a5')
prepare(){
  cd ${_pkgname}-${pkgver} || exit 1
  patch --strip=1 < ../qt-option.patch
}
build()
{
  cmake -B build -S ${_pkgname}-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None -DQT6=OFF
  cmake --build build
}

package()
{
  cd "$srcdir"/build || exit 1
  make install DESTDIR="${pkgdir}"

  cd "$srcdir"/${_pkgname}-${pkgver} || exit 1
  # Install license.
  install -d -m 0755 "${pkgdir}"/usr/share/licenses/$pkgname/
  install -m 0644 LICENCE GPL_EXCEPTION "${pkgdir}"/usr/share/licenses/$pkgname/
}
