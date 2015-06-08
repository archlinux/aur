# Maintainer: trya <tryagainprod@gmail.com>

pkgname=mamepgui
pkgver=1.6.0
pkgrel=2
pkgdesc="Frontend for SDLMAME/SDLMESS based on MAME Plus!"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mameplus"
license=('custom:WTFPL')
depends=('qt4' 'quazip')
optdepends=('sdlmame: port of MAME using SDL'
            'sdlmess: port of MESS using SDL')
source=("http://et6.free.fr/temp/mamepgui-1.6.0.tar.gz"
        'COPYING')
md5sums=('df681ca55de544a726ea3019e069ed98'
         '389a9e29629d1f05e115f8f05c283df5')

prepare() {
  cd "$srcdir/$pkgname"

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
  cd "$srcdir/$pkgname"

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
  cd "$srcdir/$pkgname"

  # install license
  install -Dm644 "$srcdir/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  # copy documentation
  install -d "$pkgdir/usr/share/doc/mamepgui"
  cp docs/* "$pkgdir/usr/share/doc/mamepgui"

  # install executable
  install -Dm755 bin/mamepgui "$pkgdir/usr/bin/mamepgui"
}
