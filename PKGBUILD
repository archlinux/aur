# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=hedgewars-hg
pkgver=1
pkgrel=1
pkgdesc="Free Worms-like turn based strategy game (development version - mercurial)"
arch=('i686' 'x86_64')
url="http://hedgewars.org"
license=('GPL' 'custom')
depends=('qt' 'sdl_mixer' 'sdl_image' 'sdl_net' 'sdl_ttf' 'lua')
makedepends=('fpc' 'cmake' 'mercurial')
source=(hedgewars.desktop \
        hedgewars.png)
md5sums=('48c66a3204d4fa0a69e9aa46f7c31e0c'
         'eeb14d50df39063549ac5eca9dbc65d1')
conflicts=('hedgewars')

_hgtrunk="https://hedgewars.googlecode.com/hg/"
_hgmod="hedgewars"

build() {
        cd $srcdir

        # get the sources
        msg "Connecting to $_hgtrunk ..."
        if [ -d $_hgmod/.hg ]; then
                (cd $_hgmod && hg pull -u) || return 1
        else
                hg clone $_hgtrunk $_hgmod || return 1
        fi
        msg "Mercurial clone done or server timeout"

  install -D -m644 $srcdir/hedgewars.png $pkgdir/usr/share/pixmaps/hedgewars.png && \
  install -D -m644 $srcdir/hedgewars.desktop $pkgdir/usr/share/applications/hedgewars.desktop || return 1

  cd $srcdir/hedgewars
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DDATA_INSTALL_DIR=/usr/share -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake -DQT_MOC_EXECUTABLE=/usr/bin/moc || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  install -D -m644 Fonts_LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/Fonts_LICENSE.txt || return 1
}
