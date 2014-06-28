# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=rockbot
pkgver=1.0.1
pkgrel=1
pkgdesc="Open Source Megaman/Rockman game engine with editor"
arch=('i686' 'x86_64')
url="http://rockbot.upperland.net/"
license=('GPL2')
depends=('sdl_mixer' 'sdl_image' 'sdl_ttf' 'qt4')
if [ "$CARCH" == "x86_64" ]; then
  depends=('lib32-sdl_mixer' 'lib32-sdl_image' 'lib32-sdl_ttf' 'lib32-qt4')
fi
source=(Rockbot_Source_1.0.1.tar.gz::"http://rockbot.upperland.net/?download=1.0.1%20Source%20Code"
        "rockbot-editor.sh")
sha256sums=('d532274c26a8bb793cdb14ff208de6429a18ff05a2e0c1b15389c3e2297f4a9f'
            '06efaebdd36ef2197385fb8bb62901d5f1fc8b4a1b2d0dc490511833aa9d59b8')

prepare() {
  cd source

  # cleanup leftover dreamcast object files
  find -name "*.o" -delete
  # cleanup windows generated editor gui files
  rm editor/moc_*.cpp

  # patch data directory
  sed 's|FILEPATH += "/";|FILEPATH = "/usr/share/rockbot/";|g' -i main.cpp

  # use correct libs
  [ "$CARCH" == "x86_64" ] && sed 's|sdl-config |sdl-config-32 |' -i cpp_rockbot.pro

  # build linux editor project
  sed 's|CONFIG += win32|CONFIG += linux|' -i editor/Rockbot_Editor.pro
}

build () {
  # engine
  cd source
  if [ "$CARCH" == "x86_64" ]; then
    qmake-qt4 QMAKE_CC="gcc -m32" QMAKE_CXX="g++ -m32" QMAKE_LINK="g++ -m32"
  else
    qmake-qt4
  fi
  make

  # editor
  cd editor
  if [ "$CARCH" == "x86_64" ]; then
    qmake-qt4 QMAKE_CC="gcc -m32" QMAKE_CXX="g++ -m32" QMAKE_LINK="g++ -m32" \
      QMAKE_LIBS="-L/usr/lib32"
  else
    qmake-qt4
  fi
  make
}

package () {
  cd source

  install -d "$pkgdir"/usr/share/rockbot

  # binaries
  install -Dm755 rockbot "$pkgdir"/usr/bin/rockbot
  install -m755 build/editor "$pkgdir"/usr/share/rockbot
  install -m755 ../rockbot-editor.sh "$pkgdir"/usr/bin/rockbot-editor

  # data
  cp -r build/data "$pkgdir"/usr/share/rockbot
}
