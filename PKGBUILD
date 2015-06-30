# Maintainer: Vladislav Tyulbashev <vladislav.tyulbashev@yandex.ru>

pkgname=labyrus-git
pkgver=20130424
pkgrel=1
pkgdesc="Network game written with OpenGL and Qt. 3D Maze. Beta."
arch=('i686' 'x86_64')
url="https://gitorious.org/labyrus/labyrus"
license=('GPL')
depends=('qt5-base')
optdepends=('qt5-imageformats: for supporting more image formats')
makedepends=('git' 'qt5-tools' 'icu')

_gitroot="https://git.gitorious.org/labyrus/labyrus.git"
_gitname="labyrus"

build() {
  cd $srcdir
  msg "Conencting to the GIT server..."
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done"
  msg "Starting make"
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning previous build directory..."
    rm -rf ${srcdir}/build
  fi

  cp -r $srcdir/$_gitname ${srcdir}/build
  cd ${srcdir}/build

  cd Client

  echo "Disabling portable version"
  
  cat Client.pro | grep -v PORTABLE > Client1.pro
  mv Client1.pro Client.pro

  cd ..

  cd ServerGui

  cat ServerGui.pro | grep -v PORTABLE > ServerGui1.pro
  mv ServerGui1.pro ServerGui.pro
  
  cd ../SwitchLanguage
  
  cat SwitchLanguage.pro | grep -v PORTABLE > SwitchLanguage1.pro
  mv SwitchLanguage1.pro SwitchLanguage.pro

  cd ..

  echo "disabled"

  echo "Generating translations"
  lrelease -compress ru_RU.ts
  echo "Generated"

  cd Client
  qmake-qt5 -makefile
  make
  cd ../Server
  qmake-qt5 -makefile
  make
  cd ../ServerGui
  qmake-qt5 -makefile
  make
  cd ../SwitchLanguage
  qmake-qt5 -makefile
  make
}

package() {
  cd ${srcdir}/build
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/labyrus
  mkdir -p $pkgdir/usr/share/labyrus/translations
  cp -f Server/Server $pkgdir/usr/bin/labyrus-server
  cp -f Client/Client $pkgdir/usr/bin/labyrus-client
  cp -f SwitchLanguage/SwitchLanguage $pkgdir/usr/bin/labyrus-switchlanguage
  cp -f ru_RU.qm $pkgdir/usr/share/labyrus/translations/labyrus-ru_RU.qm
  cp -f ServerGui/ServerGui $pkgdir/usr/bin/labyrus-server-gui
  cp -rf skins $pkgdir/usr/share/labyrus/
}
