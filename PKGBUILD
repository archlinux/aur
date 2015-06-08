# Maintainer: trya <tryagainprod@gmail.com>

pkgname=mamepgui-svn
pkgver=5175
pkgrel=1
pkgdesc="Frontend for SDLMAME/SDLMESS based on MAME Plus!"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mameplus"
license=('custom:WTFPL')
depends=('qt4' 'quazip')
makedepends=('subversion')
conflicts=('mamepgui')
provides=('mamepgui=1.6.0')
optdepends=('sdlmame: port of MAME using SDL'
            'sdlmess: port of MESS using SDL')
source=('COPYING')
md5sums=('389a9e29629d1f05e115f8f05c283df5')

_svntrunk="https://mameplus.svn.sourceforge.net/svnroot/mameplus/trunk/mamepgui"
_svnmod="mamepgui"

build() {
  cd "$srcdir"
  
  # SVN checkout
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co "$_svntrunk" --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

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
  install -Dm755 "$srcdir/mamepgui-build/bin/mamepgui" "$pkgdir/usr/bin/mamepgui"
}
