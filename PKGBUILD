# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>
# Credit: Arkham <arkham at archlinux dot us>

pkgname=darkplaces-git
_gitname=darkplaces
pkgver=r10455.1777de7a
pkgrel=1
pkgdesc="An advanced Quake 1 game engine (git-latest)"
arch=('i686' 'x86_64')
url="https://github.com/xonotic/darkplaces.git"
license=('GPL2')
depends=( 'hicolor-icon-theme' 'libjpeg-turbo' 'sdl2')
makedepends=('xorgproto')
conflicts=('darkplaces')
provides=('darkplaces')
install=$pkgname.install
source=('git+https://github.com/xonotic/darkplaces.git'
        'darkplaces.desktop')
sha256sums=('SKIP'
            '476f513f85da873ce93c89f2078bf9c2ea244e3e13a19c6ab02e818ddf221c37')

pkgver() {

  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

  cd $srcdir/$_gitname

  # Make sure Darkplaces is not compiled with -j > 1.
  MAKEFLAGS="${MAKEFLAGS} -j$(nproc)"
  make OPTIM_RELEASE="${CFLAGS}" DP_FS_BASEDIR=/usr/share/games/quake release

}

package() {

  cd $srcdir/$_gitname
  install -d $pkgdir/usr/bin
  install -m755 darkplaces-{dedicated,sdl} $pkgdir/usr/bin

  for i in 16 24 32 48 64 72; do
    install -Dm644 darkplaces${i}x${i}.png $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/darkplaces.png
  done

  install -Dm644 $srcdir/darkplaces.desktop $pkgdir/usr/share/applications/$pkgname.desktop

}
