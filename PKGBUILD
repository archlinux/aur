# Maintainer: ajs124 < aur AT ajs124 DOT de >

pkgname=magichexagon-git
pkgver=89.3f4972a
pkgrel=1
pkgdesc="Super Hexagon, ponified"
arch=('x86_64' 'i686')
url="https://github.com/meh2481/magichexagon"
license=('custom:zlib')
depends=('sdl2' 'freeimage' 'box2d' 'tinyxml' 'openal' 'libvorbis' 'glu' 'fmodex')
makedepends=('git' 'cmake')
source=($pkgname::git+https://github.com/meh2481/magichexagon.git
        git+https://github.com/fgenesis/ttvfs.git
        $pkgname.desktop)
sha256sums=(SKIP
         SKIP
         67f1b6e2ebaf1b6ff5de7991fde388b4efcea97e0c04b1cbd425e9079ead280b)

[[ $CARCH == x86_64 ]] && BITS=64
[[ $CARCH == i686 ]] && BITS=32

pkgver() {
  cd ${pkgname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  install -d ttvfs/build
  cd ttvfs/build
  cmake ..
  make
  cp ttvfs/libttvfs.a ../../${pkgname}/lib/Linux_x$BITS
  cd "${srcdir}/${pkgname}"
  sed -i 's_<fmod.h>_<fmodex/fmod.h>_' Engine.h
  sed -i 's/-ltinyxml2/-ltinyxml -lfmodex/;s/-lSDL2main//;s/-ltyrsound//' Makefile*.unix
  make release

  if [ -x /usr/bin/chrpath ] ; then
    chrpath -d magichexagon_$BITS
  fi
}

package() {
  cd "${srcdir}/${pkgname}"
  install -D magichexagon_$BITS "${pkgdir}/usr/lib/${pkgname}/${pkgname}"
  install -d "${pkgdir}/usr/bin/"
  printf "#!/bin/sh\ncd /usr/lib/${pkgname}\n./${pkgname}" > "${pkgdir}/usr/bin/${pkgname}"
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"
  cp -a res "${pkgdir}/usr/lib/${pkgname}/"
  install -D "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
