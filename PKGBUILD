# Maintainer: Chris Simpson <csimpson.archlinux at gmail dot com>

pkgname=glshim-git
_gitname=glshim
pkgver=879.7a60f13
pkgrel=1
pkgdesc='OpenGL 1.x driver for OpenGL ES devices'
arch=('armv7h')
url='https://github.com/lunixbochs/glshim'
license=('custom')
depends=('libx11' 'gcc-libs')
makedepends=('git' 'cmake')
provides=('libgl')
source=("git+https://github.com/lunixbochs/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  cmake .
  make GL
}

package() {
  cd "${_gitname}"
  sed -i "s/-P cmake_install/-DCMAKE_INSTALL_PREFIX=\/usr -P cmake_install/" Makefile
  make install DESTDIR="${pkgdir}"
  install -d "${pkgdir}"/etc/ld.so.conf.d
  echo "/usr/lib/${_gitname}" > "${pkgdir}"/etc/ld.so.conf.d/${_gitname}.conf
  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  cp -v LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/
}
