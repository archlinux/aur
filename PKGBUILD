# $Id: PKGBUILD 356 2008-04-18 22:56:27Z aaron $
# Maintainer: Marcin Skory <armitage at q84fh dot net>
# Contributor: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=maelstrom
pkgver=3.0.6
pkgrel=3
pkgdesc="Asteroids-type game with sound and 3D objects"
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl_net' 'gcc-libs')
backup=('var/games/Maelstrom.scores')
install=maelstrom.install
source=(http://www.libsdl.org/projects/Maelstrom/src/Maelstrom-${pkgver}.tar.gz
	maelstrom-3.0.6-64bits.patch
	maelstrom-scores.patch
	Maelstrom.desktop)
url="http://www.libsdl.org/projects/Maelstrom/index.html"
md5sums=('96aa6359538a6bd60b4198a792de578b'
         '471ef416576d1ba7dabfa12a4825e271'
         '131dc95ec8d23f510cdec2bb10dbb9b4'
	 '4e9009d8c1b7afd68f54084565135d6c')
sha1sums=('2036fb814db2263ca44ebe3397dbed66720249b7'
	 '3156c1607727b2dcf9b946b60db3053f650dddef'
	 'b2c49116069f33fefceb56bebe18ded3f31e8e6a'
	 '8190cc973ea82ba2b629132931b7164e27643205')

build() {
  cd $srcdir/Maelstrom-${pkgver}
  if [ "${CARCH}" = "x86_64" ]; then
    patch -Np0 -i ../maelstrom-3.0.6-64bits.patch || return 1
  fi
  patch -Np0 -i $srcdir/maelstrom-scores.patch || return 1
  sed -i -e 's/games\/\$PACKAGE/share\/\$PACKAGE/g' configure
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd $srcdir/Maelstrom-${pkgver}
  
  make -j1 prefix=$pkgdir/usr install || return 1
  mkdir -p $pkgdir/usr/share/applications
  install -m644 $srcdir/Maelstrom.desktop $pkgdir/usr/share/applications/Maelstrom.desktop || return 1

  chown root:games $pkgdir/usr/bin/Maelstrom || return 1
  chmod 2555 $pkgdir/usr/bin/Maelstrom || return 1

  mkdir -p $pkgdir/var/games
  mv $pkgdir/usr/share/Maelstrom/Maelstrom-Scores $pkgdir/var/games/Maelstrom.scores || return 1
  chown root:games $pkgdir/var/games/Maelstrom.scores || return 1
  chmod 664 $pkgdir/var/games/Maelstrom.scores || return 1
}
