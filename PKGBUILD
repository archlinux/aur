# Maintainer: megadriver <megadriver at gmx dot com>
# Shamelessly ripped off from the a7xpg PKGBUILD, also in the AUR
# Contributor: delta48 <dark.magician.48[at]gmail[dot]com>
# added just a few touches to make it compile again

pkgname=parsec47
pkgver=0.2
pkgrel=2
pkgdesc="Fast-paced retro shoot'em up in an abstract world"
arch=('i686' 'x86_64')
url="http://www.asahi-net.or.jp/~cs8k-cyu/windows/p47_e.html"
license=('custom')
depends=('sdl_mixer' 'libbulletml')
makedepends=('gdc')
source=("http://abagames.sakura.ne.jp/windows/p47_0_2.zip"
	"http://ftp.de.debian.org/debian/pool/main/p/${pkgname}/${pkgname}_${pkgver}.dfsg1-6.debian.tar.gz")
md5sums=('9d90057a269591fe992b7ed44de2d29f'
         '98d19456f1bf69709b20dbf9fd175ab5')

prepare() {
  cd $srcdir/p47

  _patchdir="../debian/patches"
  cat $_patchdir/series | egrep -v '^#|^\ #' | sed "s:^:$_patchdir/:" | xargs -n1 patch -p1 -i

  sed -i 's:/games::g' ./src/abagames/p47/BarrageManager.d
  sed -i 's:/games::g' ./src/abagames/util/sdl/{Sound,Texture}.d
  sed -i 's:gdmd-v1:gdmd:' Makefile
  sed -i 's:gdc-v1:gdc:' Makefile
}

build() {
  cd $srcdir/p47
  make
}

package() {
  cd $srcdir/p47

  # Install binaries
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname

  # Install other resources
  find {images,large,largemove,middle,middlebackmove,middlemove,middlesub,middlesub_lock,morph,morph_lock,small,smallmove,smallsidemove,small_lock,sounds} -type f -exec install -Dm644 {} $pkgdir/usr/share/$pkgname/{} \;

  # Install man page and debian copyright notice
  install -D -m644 ../debian/$pkgname.6 $pkgdir/usr/share/man/man6/$pkgname.6
  install -D -m644 ../debian/copyright $pkgdir/usr/share/licenses/$pkgname/copyright

  # Install desktop file and icon
  install -D -m644 ../debian/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m644 ../debian/$pkgname.xpm $pkgdir/usr/share/pixmaps/$pkgname.xpm
}
