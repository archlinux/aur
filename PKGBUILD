# Maintainer: Sam S. <smls75@gmail.com>
# Contributor: Claudio Kozicky <claudiokozicky@gmail.com>

pkgname=tinyandbig-hib
pkgver=1.4.1_20130612
_hibver=1.4.1_1370968538
pkgrel=1
pkgdesc="Tiny & Big: Grandpa's Leftovers - a 3D jump-and-slice platformer (Humble Bundle version)"
url='http://www.tinyandbig.com/'
arch=('i686' 'x86_64')
license=('custom:commercial')
depends=('sdl' 'libgl' 'nvidia-cg-toolkit' 'openal' 'hicolor-icon-theme' 'xdg-utils')
install="$pkgname.install"
options=('!strip' '!upx')
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("hib://tinyandbig_grandpasleftovers-retail-$_hibver.deb"
        "$pkgname.desktop")
md5sums=('47de47b0b22e75f885e1acfe508cf5c5'
         '2442ac327eaced6a1db2dce1e202490d')

build() {
  cd "$srcdir"
  msg2 "Extracting data.tar.lzma"
  bsdtar xf data.tar.lzma
}

package() {
  cd "$pkgdir"
  [ $CARCH == "i686" ] && { _arch=32 && _other=64 ;} \
                       || { _arch=64 && _other=32 ;}

  # Install game files
  mkdir -p opt usr/share
  cp -Rl "$srcdir"/usr/local/games/tinyandbig-episode1 opt/
  cp -Rl "$srcdir"/usr/share/icons usr/share/

  # Install license
  install -Dm644 opt/tinyandbig-episode1/license.txt \
                 usr/share/licenses/$pkgname/LICENSE

  # Remove files that are not needed
  rm opt/tinyandbig-episode1/{tinyandbig-launcher,license.txt}
  rm opt/tinyandbig-episode1/bin$_arch/{libCg.so,libCgGL.so}
  rm -r opt/tinyandbig-episode1/bin$_other

  # Install launch script
  echo -e "#!/bin/sh\ncd /opt/tinyandbig-episode1/ && ./bin$_arch/tinyandbig" \
        > "$srcdir"/launcher
  install -Dm755 "$srcdir"/launcher usr/bin/tinyandbig-episode1

  # Install desktop entry
  install -Dm644 "$srcdir"/$pkgname.desktop \
                 usr/share/applications/$pkgname.desktop
}
