# $Id$
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: t3ddy  <t3ddy1988 "at" gmail {dot} com>
# Contributor: AdriÃ¡n Chaves FernÃ¡ndez (Gallaecio) <adriyetichaves@gmail.com>
pkgname=0ad-git
_pkgname=0ad
pkgver=18062
pkgrel=1
pkgdesc="Cross-platform, 3D and historically-based real-time strategy game"
arch=('i686' 'x86_64')
url="http://play0ad.com/"
conflicts=('0ad')
provides=('0ad')
license=('GPL2' 'CCPL')
depends=('binutils' 'boost-libs' 'curl' 'enet' 'libogg' 'libpng' 'libvorbis'
         'libxml2' 'openal' 'sdl2' 'wxgtk' 'zlib' 'libgl' '0ad-data' 'glu'
         'gloox' 'miniupnpc' 'icu' 'nspr')
makedepends=('boost' 'cmake' 'mesa' 'zip' 'python2' 'libsm')
source=("git+https://github.com/0ad/0ad.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git rev-list --count HEAD
}

prepare() {
  cd "$srcdir/${_pkgname}"
  sed -i "s/env python/env python2/g" libraries/source/cxxtest-4.4/bin/cxxtestgen
}

build() {
  cd "$srcdir/${_pkgname}/build/workspaces"

  unset CPPFLAGS # for le spidermonkey

  ./update-workspaces.sh \
      --bindir=/usr/bin \
      --libdir=/usr/lib/0ad \
      --datadir=/usr/share/${pkgname}/data

  cd "$srcdir/${_pkgname}/build/workspaces/gcc"

  make
}

package() {
  install -d "${pkgdir}"/usr/{bin,lib/${pkgname},share/"${pkgname}"/data}
  cd "$srcdir/${_pkgname}"

  install -Dm755 binaries/system/pyrogenesis "${pkgdir}/usr/bin"
  install -Dm755 binaries/system/*.so "${pkgdir}/usr/lib/$pkgname"

  cp -r binaries/data/l10n/ ${pkgdir}/usr/share/${pkgname}/data/

  install -Dm755 build/resources/${_pkgname}.sh "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 build/resources/${_pkgname}.desktop \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 build/resources/${_pkgname}.png \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
