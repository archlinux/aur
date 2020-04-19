# Maintainer: Zanny <lordzanny@gmail.com>

pkgname=rbdoom3-bfg-git
pkgver=r887.163a31f9
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
source=("$pkgname::git+https://github.com/RobertBeckebans/RBDOOM-3-BFG.git"
        'rbdoom3-bfg-git.desktop' 
        'doom3bfg.png'
        'sdl2-cmake.patch')
sha256sums=('SKIP'
            'a651aa2e71a8a525e66173a8f76b907712b73c950c88f5468ccab79f7533361f'
            '0fb6a3bb9b47cad65d5012ba20dc9de3b1487f4ac1908ee847e6087511b7f09e'
            '438993ae976453143d1055fd851e3fd0d48c5309818d485b276e1cfcd6701ce9')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    patch -p1 -i "$srcdir/sdl2-cmake.patch"
}

build() {
  cd "$pkgname/neo"
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
