# Maintainer: Duck
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: SleepyDog

_pkgbase=glew
pkgname=glew-egl-glx
pkgver=2.1.0
pkgrel=1
pkgdesc="The OpenGL Extension Wrangler Library"
arch=('x86_64')
url="http://glew.sourceforge.net" # no https available
license=('BSD' 'MIT' 'GPL')
depends=('libxmu' 'libxi' 'glu')
conflicts=('glew' 'glew-wayland')
provides=('glew')
source=(https://downloads.sourceforge.net/${_pkgbase}/${_pkgbase}-${pkgver}.tgz
        egl+glx.patch)
sha256sums=('04de91e7e6763039bc11940095cd9c7f880baba82196a7765f727ac05a993c95'
            '73ad84f9e69fb5630fda13cd95f420f4c751ab9fbc3ea5b5aadd1184d27e0601')

prepare() {
  cd ${_pkgbase}-${pkgver}

  sed -i 's|lib64|lib|' config/Makefile.linux
  sed -i '/^.PHONY: .*\.pc$/d' Makefile

  patch -p1 <"${srcdir}/egl+glx.patch"
}

build() {
  cd ${_pkgbase}-${pkgver}

  make STRIP= glew.bin
  mv bin/glewinfo bin/glxewinfo
  make STRIP= SYSTEM=linux-egl glew.lib.shared bin/glewinfo
  mv bin/glewinfo bin/eglewinfo
}

package() {
  cd ${_pkgbase}-${pkgver}
  make GLEW_DEST="${pkgdir}/usr" STRIP= SYSTEM=linux-egl install
  install -D -m755 -t "${pkgdir}/usr/bin" bin/eglewinfo bin/glxewinfo bin/visualinfo
  ln -s eglewinfo "${pkgdir}/usr/bin/glewinfo"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
