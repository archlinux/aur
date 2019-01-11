# Maintainer: trya <tryagainprod@gmail.com>

pkgname=mamepgui-git
pkgver=r37.2efd8b7
pkgrel=1
pkgdesc="Frontend for SDLMAME/SDLMESS based on MAME Plus!"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mameplus"
license=('custom:WTFPL')
depends=('qt4' 'quazip-qt4')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=1.6.0")
replaces=("${pkgname%-git}-svn")
optdepends=('sdlmame: port of MAME/MESS using SDL')
source=('mamepgui::git+https://github.com/svn2github/mamepgui.git'
        'COPYING')
md5sums=('SKIP'
         '389a9e29629d1f05e115f8f05c283df5')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  # disable static compilation and SDL 1.3 linking
  sed -e 's|CONFIG += build_static|#CONFIG += build_static|' \
      -e 's|CONFIG += build_sdl|#CONFIG += build_sdl|'       \
      -i common_settings.pri

  # use included libraries instead of installed ones
  sed -e 's|LIBS += -L./lib/$${OSDIR}|QMAKE_LIBDIR += ./lib/$${OSDIR}|' \
      -e 's|LIBS += -lquazip -llzma|LIBS += -lquazip -llzma -lz|'       \
      -e 's|TARGETDEPS +=|#TARGETDEPS +=|'                              \
      -e 's|./lib/$${OSDIR}/libquazip.a|#./lib/$${OSDIR}/libquazip.a|'  \
      -e 's|./lib/$${OSDIR}/liblzma.a|#./lib/$${OSDIR}/liblzma.a|'      \
      -i mamepgui.pro
}

build() {
  cd "$srcdir/${pkgname%-git}"
  
  # build included liblzma.a (system one is not compatible)
  cd lzma
  qmake-qt4
  make

  # build mamepgui
  cd ..
  lrelease-qt4 mamepgui.pro
  qmake-qt4
  make
}

package() {
  # install license
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  # install executable
  install -Dm755 "$srcdir/${pkgname%-git}/bin/mamepgui" "$pkgdir/usr/bin/mamepgui"
}
