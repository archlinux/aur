# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

_pkgname=glew
pkgver=1.13.0
pkgname=glew-${pkgver}
pkgrel=2
pkgdesc="The OpenGL Extension Wrangler Library"
arch=('i686' 'x86_64')
url="http://glew.sourceforge.net"
license=('BSD' 'MIT' 'GPL')
depends=('libxmu' 'libxi' 'glu')
#      https://freefr.dl.sourceforge.net/project/glew/glew/1.13.0/glew-1.13.0.tgz
source=(http://freefr.dl.sourceforge.net/project/${_pkgname}/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tgz)
sha1sums=('d5b1c499f429aa91c466193b4e8ea94a84019e37')

build() {
  cd ${_pkgname}-${pkgver}

  # move include folder to subfolder 'glew-1.13.0'
  sed -i 's:$(GLEW_DEST)/include/GL:$(GLEW_DEST)/include/glew-1.13.0/GL:' Makefile
  
  sed -i 's|lib64|lib|' config/Makefile.linux
  sed -i '/^.PHONY: .*\.pc$/d' Makefile
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  # update glewmx include path to reflect previous changes (see build comments)
  msg update glewmx.pc
  sed -i 's:includedir=${prefix}/include:includedir=${prefix}/include/glew-1.13.0:' glewmx.pc
  # install only mx library
  make GLEW_DEST="${pkgdir}/usr" install.mx
}
