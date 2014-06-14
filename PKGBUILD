# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Paul Bredbury <brebs@sent.com>

pkgname=darkplaces
pkgver=20140513
pkgrel=1
pkgdesc="An advanced Quake 1 game engine"
arch=('i686' 'x86_64')
url="http://icculus.org/twilight/darkplaces/"
license=('GPL2')
depends=('alsa-lib' 'hicolor-icon-theme' 'libjpeg-turbo' 'libxpm' 'libxxf86vm' 'sdl')
makedepends=('xextproto' 'xf86dgaproto' 'xf86vidmodeproto' 'xproto')
install=$pkgname.install
source=(http://icculus.org/twilight/$pkgname/files/darkplacesengine$pkgver.zip
        $pkgname.desktop)
sha256sums=('69e5a50991884196e403bd6aab4a33bba553a934a167be366672ab4e223b06c9'
            '476f513f85da873ce93c89f2078bf9c2ea244e3e13a19c6ab02e818ddf221c37')

build() {
  # Extract the package
  cd $srcdir
  bsdtar -xf darkplacesenginesource$pkgver.zip || return 1

  # Make sure Darkplaces is not compiled with -j > 1.
  MAKEFLAGS="${MAKEFLAGS} -j1"

  # Compile
  cd $pkgname
  sed -i -e '1i DP_LINK_TO_LIBJPEG=1' makefile
  make OPTIM_RELEASE="${CFLAGS}" DP_FS_BASEDIR=/usr/share/quake release || return 1
}

package() {
  cd $srcdir/$pkgname
  install -d $pkgdir/usr/{bin,share/quake}
  install -m755 darkplaces-{dedicated,glx,sdl} $pkgdir/usr/bin

  for i in 16 24 32 48 64 72; do
    install -Dm644 darkplaces${i}x${i}.png $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/darkplaces.png
  done

  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
