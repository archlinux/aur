# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: thorsten w. <p@thorsten-wissmann.de>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=herbstluftwm-git
_pkgname=herbstluftwm
pkgver=0.9.4.r10.g5a627d55
pkgrel=1
epoch=1
pkgdesc="Manual tiling window manager for X"
arch=('x86_64' 'i686')
url="https://herbstluftwm.org"
license=('BSD')
depends=('bash' 'libxinerama' 'libxrandr' 'libxft' 'libxext' 'libxfixes' 'libxrender' 'freetype2')
makedepends=('git' 'cmake' 'asciidoc')
optdepends=('xorg-xsetroot: to set wallpaper color in default autostart'
            'xterm: used as the terminal in default autostart'
            'dzen2: used in the default panel.sh'
            'dmenu: used in some example scripts')
source=("$pkgname::git+https://github.com/herbstluftwm/$_pkgname")
sha256sums=('SKIP')
validpgpkeys=('72B6C05CDFF309C6396167D464EF02821CAFF810') # Thorsten Wißmann <edu@thorsten-wissmann.de>

provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd ${pkgname}
  git describe --tags --long | sed -r 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

build() {
  cd $pkgname

  mkdir -p build; cd build

  cmake \
    -DBASHCOMPLETIONDIR=/usr/share/bash-completion/completions \
    -DZSHCOMPLETIONDIR=/usr/share/zsh/functions/Completion/X \
    -DCMAKE_INSTALL_PREFIX="/usr" ..

  make
}

package() {
  cd $pkgname/build

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir"/usr/share/licenses/$pkgname/

  ln -s /usr/share/doc/$_pkgname/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
