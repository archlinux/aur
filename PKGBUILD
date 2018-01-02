# $Id$
# Maintainer : Sergey Kostyaev <feo.me@ya.ru>

pkgname=uqm-hd
pkgver=0.2
pkgrel=1
pkgdesc="The Ur-Quan Masters HD, a port of Star Control 2 with High Res textures"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/urquanmastershd/"
license=('GPLv2')
depends=('libmikmod' 'libvorbis' 'sdl_image' 'libgl' 'glu' 'zlib' 'libogg')
makedepends=('imagemagick' 'mesa' 'namcap')
optdepends=('uqm-hd-sound: For extra music and conversation audio'
            'uqm-hd-rus: For russian localization')
source=(https://downloads.sourceforge.net/project/urquanmastershd/Beta%201/${pkgname}_${pkgver}.src.tar.gz
        config.state
        uqm-hd
        uqm-hd.desktop
        uqm-hd.png
        https://downloads.sourceforge.net/project/urquanmastershd/Beta%201/debs/${pkgname}-content_${pkgver}-${pkgrel}_all.deb
        https://downloads.sourceforge.net/project/urquanmastershd/Beta%201/debs/${pkgname}-hires2x_${pkgver}-${pkgrel}_all.deb
        https://downloads.sourceforge.net/project/urquanmastershd/Beta%201/debs/${pkgname}-hires4x_${pkgver}-${pkgrel}_all.deb
	https://gist.githubusercontent.com/MafiaInc/609aeaa13993d9c409e454e44ac9c326/raw/cb5b4163d82dc495efa5a256b2b3f0e092bbcf1a/0001-Fix-possible-naming-collision-for-_STRINGS_H.patch
       )
md5sums=('f6ae04927ac9726b20a6faa7e7b7bbf6'
         'ca497b754edf56aab8a5791f1d2c974a'
         '5e9316937ad2ebdfd1ce7ac84a626f75'
         '7a25bb0adfd5eafa18946f326575e543'
         '2c563cf8e4f006d849e80ba82ddbdadb'
         '568454cd3be188e826a2446a0615ac5e'
         'b73e4602312de491803722eef725fc86'
         'e41e3b39dcdaf3573a23e3ab3022b3fa'
         '10cacfe459f3be81098d57127495159e')
noextract=(${pkgname}-content_${pkgver}-${pkgrel}_all.deb
           ${pkgname}-hires2x_${pkgver}-${pkgrel}_all.deb
           ${pkgname}-hires4x_${pkgver}-${pkgrel}_all.deb)

package() {
  cd $srcdir/$pkgname-$pkgver
  
  cp $srcdir/config.state .
  sed -e "/INPUT_install_prefix/ s|replaceme|$pkgdir/usr|" \
      -i config.state
  patch -p1 < $srcdir/0001-Fix-possible-naming-collision-for-_STRINGS_H.patch

  ./build.sh uqm reprocess_config

  ./build.sh uqm
  
  ./build.sh uqm install

  ar p $srcdir/${pkgname}-content_${pkgver}-${pkgrel}_all.deb data.tar.gz | tar zx --one-top-level=$pkgdir
  ar p $srcdir/${pkgname}-hires2x_${pkgver}-${pkgrel}_all.deb data.tar.gz | tar zx --one-top-level=$pkgdir
  ar p $srcdir/${pkgname}-hires4x_${pkgver}-${pkgrel}_all.deb data.tar.gz | tar zx --one-top-level=$pkgdir

  install -Dm644 $srcdir/uqm-hd.desktop \
     $pkgdir/usr/share/applications/uqm-hd.desktop
  install -Dm644 $srcdir/uqm-hd.png \
     $pkgdir/usr/share/pixmaps/uqm-hd.png

  rm $pkgdir/usr/bin/uqm-hd
  install -Dm755 $srcdir/uqm-hd $pkgdir/usr/bin/uqm-hd
}
