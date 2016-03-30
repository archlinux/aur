# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Paul Bredbury <brebs@sent.com>
# Contributor: Mikhail Burdin <xdshot9000@gmail.com>

pkgname=darkplaces-xonotic
pkgver=0.8.1
pkgrel=1
pkgdesc="An advanced Quake 1 game engine (Xonotic branch)"
arch=('i686' 'x86_64')
url="http://icculus.org/twilight/darkplaces/"
license=('GPL2')
depends=('alsa-lib' 'hicolor-icon-theme' 'libjpeg-turbo' 'libxpm' 'libxxf86vm' 'sdl2')
makedepends=('xextproto' 'xf86dgaproto' 'xf86vidmodeproto' 'xproto')
conflicts=('darkplaces')
provides=('darkplaces')
install=$pkgname.install
source=(https://github.com/xonotic/darkplaces/archive/xonotic-v$pkgver.tar.gz
        $pkgname.desktop)
sha256sums=('61c2225e7a740af3111e4ebb260d7aceddd7e1f3e632b39f6dae22150097c431'
            '476f513f85da873ce93c89f2078bf9c2ea244e3e13a19c6ab02e818ddf221c37')

build() {
  # Extract the package
  cd "${srcdir}/${pkgname}-v${pkgver}"

  # Make sure Darkplaces is not compiled with -j > 1.
  MAKEFLAGS="${MAKEFLAGS} -j1"

  # Compile
  sed -i -e '1i DP_LINK_TO_LIBJPEG=1' makefile
  #make OPTIM_RELEASE="${CFLAGS}" DP_FS_BASEDIR=/usr/share/quake release || return 1
  make OPTIM_RELEASE="${CFLAGS}" DP_FS_BASEDIR=/usr/share/quake cl-release
  make OPTIM_RELEASE="${CFLAGS}" DP_FS_BASEDIR=/usr/share/quake sdl2-release
  make OPTIM_RELEASE="${CFLAGS}" DP_FS_BASEDIR=/usr/share/quake sv-release
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  install -d $pkgdir/usr/{bin,share/quake}
  install -m755 darkplaces-{dedicated,glx,sdl} $pkgdir/usr/bin

  for i in 16 24 32 48 64 72; do
    install -Dm644 darkplaces${i}x${i}.png $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/darkplaces.png
  done

  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
