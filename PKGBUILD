pkgname=raddebugger-git
_appname="${pkgname%-git}"
pkgver=0.9.29.alpha.r37.g62b715a3
pkgrel=1
pkgdesc='A native, user-mode, multi-process, graphical debugger.'
arch=('x86_64')
url='https://github.com/EpicGames/raddebugger'
license=('MIT')
provides=('raddebugger')
conflicts=('raddebugger')
depends=('freetype2' 'libx11' 'libxext' 'libxfixes' 'libxrandr' 'libglvnd' 'libatomic' 'hicolor-icon-theme')
makedepends=('git' 'clang' 'llvm' 'pkgconf')
optdepends=('zenity: graphical dialogs and file selection')
source=('git+https://github.com/EpicGames/raddebugger.git' 'raddbg.desktop')
sha256sums=('SKIP'
            '5647eb98bc1b5cf606ed676e95ddf0f03fbcbc1bcf7cb2ba0e0fccfb6a1e5c7c')

pkgver() {
  cd raddebugger
  git describe --long --tags --match 'v[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd raddebugger
  ./build.sh clang release meta raddbg raddbg_non_graphical radbin radlink
}

package() {
  install -Dm644 raddbg.desktop "$pkgdir/usr/share/applications/raddbg.desktop"
  cd raddebugger
  install -Dm755 build/raddbg "$pkgdir/usr/bin/raddbg"
  install -Dm755 build/raddbg_non_graphical "$pkgdir/usr/bin/raddbg_non_graphical"
  install -Dm755 build/radbin "$pkgdir/usr/bin/radbin"
  install -Dm755 build/radlink "$pkgdir/usr/bin/radlink"
  install -Dm644 build/raddbg_readme.md "$pkgdir/usr/share/doc/$_appname/README.md"
  install -Dm644 src/lib_raddbg_markup/raddbg_markup.h "$pkgdir/usr/include/raddbg_markup.h"
  install -Dm644 data/logo.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/raddbg.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_appname/LICENSE"
}
