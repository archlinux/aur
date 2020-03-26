# $Id$
# Maintainer:  Brenton Horne <brentonhorne77@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: t3ddy  <t3ddy1988 "at" gmail {dot} com>
# Contributor: AdriÃ¡n Chaves FernÃ¡ndez (Gallaecio) <adriyetichaves@gmail.com>
pkgname=('0ad-git' '0ad-data-git')
_pkgname=0ad
pkgver=21551
pkgrel=1
arch=('i686' 'x86_64')
url="http://play0ad.com/"
license=('GPL2' 'CCPL')
depends=('binutils' 'boost-libs' 'curl' 'enet' 'libogg' 'libpng' 'libvorbis'
         'libxml2' 'openal' 'sdl2' 'wxgtk' 'zlib' 'libgl' 'glu'
         'gloox' 'miniupnpc' 'icu' 'nspr')
makedepends=('boost' 'cmake' 'mesa' 'zip' 'python2' 'libsm' 'git')
source=("git+https://github.com/0ad/0ad.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git rev-list --count HEAD
}

prepare() {
  cd "$srcdir/${_pkgname}"
  sed -i "s/env python/env python2/g" libraries/source/cxxtest-4.4/bin/cxxtestgen
#  patch -Np1 -i "$srcdir/tmpfixgcsegfault3.patch"
}

build() {
  cd "$srcdir/${_pkgname}/build/workspaces"

  unset CPPFLAGS # for le spidermonkey
  export SDL2_CONFIG="pkg-config sdl2"

  ./update-workspaces.sh \
      --bindir=/usr/bin \
      --libdir=/usr/lib/0ad \
      --datadir=/usr/share/${pkgname}/data

  cd "$srcdir/${_pkgname}/libraries/source/fcollada/src"
  make -j9

  cd "$srcdir/${_pkgname}/build/workspaces/gcc"
  make -j9
}

package_0ad-git() {
  pkgdesc="Cross-platform, 3D and historically-based real-time strategy game — built from git source tree. WARNING: the 0ad git repo is approximately 7 GB in size!"
  conflicts=('0ad')
  depends=('0ad-data-git')
  provides=('0ad')

  install -d "${pkgdir}"/usr/{bin,lib/${_pkgname}}
  cd "$srcdir/${_pkgname}"

  install -Dm755 binaries/system/pyrogenesis "${pkgdir}/usr/bin"
  install -Dm755 binaries/system/*.so "${pkgdir}/usr/lib/${_pkgname}"
  install -Dm755 build/resources/${_pkgname}.sh "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 build/resources/${_pkgname}.desktop \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 build/resources/${_pkgname}.png \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}

package_0ad-data-git() {
  pkgdesc="Data package for 0ad built from source code. WARNING: the 0ad git repo is approximately 7 GB in size!"
  conflicts=('0ad-data')
  depends=('0ad-git')
  provides=('0ad-data')

  mkdir -p ${pkgdir}/usr/share/${_pkgname}-git
  cp -r ${srcdir}/${_pkgname}/binaries/data ${pkgdir}/usr/share/${_pkgname}-git
}
