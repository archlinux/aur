# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=searchandrescue2
pkgver=2.3.1
pkgrel=7
pkgdesc="Helicopter based search and rescue flight simulator"
arch=('i686' 'x86_64')
url="http://sar2.sourceforge.net/"
license=('GPL2')
depends=('freealut' 'libxmu' 'libxpm' 'mesa' 'sdl_image')
makedepends=('scons')
#source=(http://sourceforge.net/projects/sar2/files/sar2-$pkgver.tar.bz2)
source=(https://github.com/hsanjuan/sar2/archive/master.zip)
md5sums=('6a7e2b9537363ae92b713f498dac79a0')

prepare() {
  cd $srcdir/sar2-master
  # Patch (add 'openal' in /src/SConscript env.Append LIBS array. Thanks to nous for the fix!)
  sed -i "s/alut/alut\', \'openal/" src/SConscript
}

build() {
  cd $srcdir/sar2-master
  scons
}

package() {
  cd $srcdir/sar2-master
  # Binary
  install -Dm755 bin/sar2 $pkgdir/usr/bin/sar2

  # Desktop icon
  install -Dm644 extra/sar2.xpm $pkgdir/usr/share/pixmaps/sar2.xpm
  install -Dm644 extra/sar2.desktop $pkgdir/usr/share/applications/sar2.desktop

  # Data files
  mkdir -p $pkgdir/usr/share/sar2
  cp -R data/* $pkgdir/usr/share/sar2

  # Man page
  install -Dm644 man/sar2.6.bz2 $pkgdir/usr/share/man/man6/sar2.6.bz2

  # Icons
  cd src/icons
  for file in $(find . -name '*.xpm' -print); do
  install -Dm644 $file $pkgdir/usr/share/pixmaps/$file
  done
}
