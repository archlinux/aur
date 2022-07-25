# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Paul Bredbury <brebs@sent.com>
# Contributor: Mikhail Burdin <xdshot9000@gmail.com>

pkgname=darkplaces-xonotic
pkgver=0.8.5
pkgrel=1
pkgdesc="An advanced Quake 1 game engine (Xonotic fork)"
arch=('i686' 'x86_64')
url="https://gitlab.com/xonotic/darkplaces"
license=('GPL2')
depends=('alsa-lib' 'curl' 'libjpeg-turbo' 'libmodplug' 'libvorbis' 'libxpm'
         'libxxf86vm' 'sdl2' 'libpng>=1.4.0' 'hicolor-icon-theme'
         'gtk-update-icon-cache' 'desktop-file-utils')
makedepends=('unzip' 'mesa' 'xorgproto')
conflicts=('darkplaces')
provides=('darkplaces')
install=$pkgname.install
source=(https://github.com/xonotic/darkplaces/archive/xonotic-v$pkgver.tar.gz
        $pkgname.desktop)
sha256sums=('c35dfc3e0c2500b6fe7f5cb651d9c9bb359f86ad9202f2877ed6d4eb761e3f18'
            '476f513f85da873ce93c89f2078bf9c2ea244e3e13a19c6ab02e818ddf221c37')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  # Compile
  make OPTIM_RELEASE="${CFLAGS}" DP_FS_BASEDIR=/usr/share/games/quake DP_LINK_TO_LIBJPEG=1 release
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  install -d $pkgdir/usr/{bin,share/games/quake}
  install -m755 darkplaces-{dedicated,glx,sdl} $pkgdir/usr/bin

  for i in 16 24 32 48 64 72; do
    install -Dm644 darkplaces${i}x${i}.png $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/darkplaces.png
  done

  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
