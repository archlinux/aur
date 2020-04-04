# Maintainer: Zanny <lordzanny@gmail.com>

pkgname=rbdoom3-bfg-git
pkgver=r888.b17445c5
pkgrel=1
pkgdesc="Doom 3 BFG Edition with soft shadows, cleaned up source, Linux and 64 bit Support"
arch=('i686' 'x86_64')
url="https://github.com/RobertBeckebans/RBDOOM-3-BFG"
license=('GPL3')
depends=('sdl2' 'ffmpeg' 'openal' 'glew')
makedepends=('git' 'cmake' 'zip')
optdepends=('doom3bfg-data: packaged game data files')
provides=('rbdoom3-bfg')
conflicts=('rbdoom-3-bfg')
install=rbdoom3-bfg-git.install
source=('rbdoom3-bfg-git::git+https://github.com/RobertBeckebans/RBDOOM-3-BFG.git'
        'rbdoom3-bfg-git.desktop' 
        'doom3bfg.png')
md5sums=('SKIP'
         'f5458e6cc915282aec2406dbdc824f9f'
         '86455bb86d4267b447bd882dbde35231')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    git revert 988420 --no-edit
}

build() {
  cd "$srcdir/$pkgname/neo"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_SYSTEM_ZLIB=1 \
        -DUSE_SYSTEM_LIBPNG=0 \
        -DUSE_SYSTEM_LIBJPEG=1 \
        -DUSE_SYSTEM_LIBGLEW=1 .
  make
}

package() {
  install -Dm755 "$srcdir/$pkgname/neo/RBDoom3BFG" "$pkgdir/usr/bin/rbdoom3bfg"
  install -Dm644 "$srcdir/doom3bfg.png" "$pkgdir/usr/share/pixmaps/doom3bfg.png"
  install -Dm644 "$srcdir/rbdoom3-bfg-git.desktop" "$pkgdir/usr/share/applications/rbdoom3-bfg-git.desktop"
}
