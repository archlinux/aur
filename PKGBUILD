# Contributor: Anntoin Wilkinson <anntoin gmail com>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
# Maintainer: SanskritFritz (gmail)

pkgname=torus-trooper
pkgver=0.22
pkgrel=10
pkgdesc="An addictive game by Kenta Cho. An abstract shooter and tube race."
arch=('i686' 'x86_64')
url="http://www.asahi-net.or.jp/~cs8k-cyu/windows/tt_e.html"
license=('custom')
depends=('libbulletml' 'glu' 'sdl_mixer')
makedepends=('gdc1')
source=('http://abagames.sakura.ne.jp/windows/tt0_22.zip'
        'http://ftp.de.debian.org/debian/pool/main/t/torus-trooper/torus-trooper_0.22.dfsg1-8.debian.tar.gz')
md5sums=('1abb57950b96f1a7f7ac8364e9a42322'
         'ffa2cd8d25b1e44179c09701b22dde04')

prepare() {
  cd $srcdir/tt

  _patchdir="../debian/patches"
  cat $_patchdir/series | egrep -v '^#|^\ #' | sed "s:^:$_patchdir/:" | xargs -n1 patch -p1 -i

  sed -i 's:share\/games:share:' ./src/abagames/util/sdl/{sound,texture}.d \
                                 ./src/abagames/tt/barrage.d

  sed -i 's:gdmd-v1:gdmd1:' Makefile
  sed -i 's:gdc-v1:gdc1:' Makefile
}

build() {
  cd $srcdir/tt
  make
}

package() {
  cd $srcdir/tt

  # Install binaries
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname

  # Install other resources
  find {barrage,images,sounds} -type f -exec install -Dm644 {} $pkgdir/usr/share/$pkgname/{} \;

  # Install man page and debian copyright notice
  install -D -m644 ../debian/$pkgname.6 $pkgdir/usr/share/man/man6/$pkgname.6
  install -D -m644 ../debian/copyright $pkgdir/usr/share/licenses/$pkgname/copyright

  # Install desktop file and icon
  install -D -m644 ../debian/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m644 ../debian/$pkgname.xpm $pkgdir/usr/share/pixmaps/$pkgname.xpm
}
