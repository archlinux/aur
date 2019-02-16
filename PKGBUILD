# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Paul Bredbury <brebs@sent.com>

pkgname=darkplaces-2017
pkgver=20170829beta1
pkgrel=2
pkgdesc="An advanced Quake 1 game engine (August 29th 2017 build)"
arch=('i686' 'x86_64')
url="http://icculus.org/twilight/darkplaces/"
license=('GPL2')
depends=('alsa-lib' 'hicolor-icon-theme' 'libjpeg-turbo' 'libxpm' 'libxxf86vm' 'sdl')
conflicts=('darkplaces' 'darkplaces-git')
provides=('darkplaces')
makedepends=('xextproto' 'xf86dgaproto' 'xf86vidmodeproto' 'xproto')
install=$pkgname.install
source=(http://icculus.org/twilight/darkplaces/files/darkplacesengine$pkgver.zip
        darkplaces.desktop)
sha256sums=('029a781467c2a5537f897f7b63c5eb502bbcfbd777d45bd34713593f69645e3e'
            '476f513f85da873ce93c89f2078bf9c2ea244e3e13a19c6ab02e818ddf221c37')
noextract=(darkplacesengine$pkgver.zip)

prepare() {
  cd "$srcdir"
  bsdtar -xf darkplacesengine$pkgver.zip darkplacesenginesource$pkgver.zip
  bsdtar -xf darkplacesenginesource$pkgver.zip
  cd "darkplaces"

  # Fix a couple options in the Makefile.
  sed -i '1i DP_LINK_TO_LIBJPEG=1' makefile
  sed -i '/(STRIP)/d' makefile.inc
}

build() {
  cd "$srcdir/darkplaces"

  # Make sure Darkplaces is not compiled with -j > 1.
  MAKEFLAGS="${MAKEFLAGS} -j1"
  make OPTIM_RELEASE="${CFLAGS}" DP_FS_BASEDIR=/usr/share/games/quake release
}

package() {
  cd $srcdir/darkplaces
  install -d $pkgdir/usr/bin
  install -m755 darkplaces-{dedicated,glx,sdl} $pkgdir/usr/bin

  for i in 16 24 32 48 64 72; do
    install -Dm644 darkplaces${i}x${i}.png $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/darkplaces.png
  done

  install -Dm644 $srcdir/darkplaces.desktop $pkgdir/usr/share/applications/darkplaces.desktop
}
