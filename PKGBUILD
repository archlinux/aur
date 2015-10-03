# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Ismael Barros (RazZziel) <razielmine@gmail.com>

pkgname=blackshades-svn
pkgver=r110
pkgrel=1
pkgdesc="A game where you control a psychic bodyguard, and try to protect the VIP from hordes of would-be assassins"
arch=('i686')
url="http://icculus.org/blackshades/"
license=('uDevGame')
depends=('sdl' 'sdl_image' 'openal' 'libvorbis' 'mesa' 'freealut')
makedepends=('subversion')
source=(blackshades::svn://svn.icculus.org/blackshades/trunk/ blackshades.patch)
md5sums=('SKIP'
         'bb04f4414f4a7a693b8bad4314399145')

pkgver() {
 cd "${pkgname%%-svn}"
 local ver="$(svnversion)"
 printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd $srcdir/${pkgname%%-svn}
  patch -Np1 -i $srcdir/blackshades.patch
  make
}

package() {
  cd $srcdir/${pkgname%%-svn}
  install -d $pkgdir/opt/$pkgname/ $pkgdir/usr/bin/ $pkgdir/usr/share/licenses/common/uDevGame
  install -m755 objs/blackshades $pkgdir/opt/$pkgname/
  install -m644 Readme uDevGame_License uDevGame_Readme $pkgdir/opt/$pkgname/
  svn export Data $pkgdir/opt/$pkgname/Data

  echo -e "#!/bin/sh\n cd /opt/$pkgname/; ./blackshades" > $pkgdir/usr/bin/$pkgname
  chmod 755 $pkgdir/usr/bin/$pkgname

  install -m644 $pkgdir/opt/$pkgname/uDevGame_License $pkgdir/usr/share/licenses/common/uDevGame/
}
