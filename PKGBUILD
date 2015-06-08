# Maintainer : Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: revel <revelΘmuub·net>
# Contributor: shild <sxp@bk.ru>

pkgname=bin32-edb-debugger
pkgver=0.9.20
pkgrel=1
pkgdesc="EDB (Evan's Debugger) is a QT4 based binary mode debugger with the goal of having usability on par with OllyDbg - 32 bit version (used to debug 32-bit applications on x86_64 architecture)."
arch=('x86_64')
url="http://www.codef00.com/projects.php#Debugger"
license=('GPL2')
depends=('lib32-qt4>=4.5')
makedepends=('boost>=1.35.0')
install=edb.install
source=(http://www.codef00.com/projects/debugger-${pkgver}.tgz
        edb32.desktop)
md5sums=(5916d415f598fae8632dd763f58e11d1
         4df05c4a3e3ee228510b46076f12e7d3)

# WARNING: this PKGBUILD contains few nasty hacks because of qmake's stubbornness
# and qtconfig.h "bug" in Arch Linux (https://bbs.archlinux.org/viewtopic.php?id=133403)

prepare() {
  cd ${srcdir}/debugger

  # add qmake flags in project files
  for file in src/src.pro plugins/{plugins.pri,plugins-x86_64.pri}
  do
    sed -i '1s/^/QMAKE_CXXFLAGS += -m32\n/' ${file}
    sed -i '1s/^/QMAKE_LFLAGS += -m32\n/' ${file}
    sed -i '1s/^/QT_ARCH = i386\n/' ${file}
    # needed in versions 0.9.20+
    sed -i 's#VPATH       += arch/x86_64 $$LEVEL/include/arch/x86_64#VPATH       += arch/x86 $$LEVEL/include/arch/x86#g' ${file}
    sed -i 's#INCLUDEPATH += arch/x86_64 $$LEVEL/include/arch/x86_64#INCLUDEPATH += arch/x86 $$LEVEL/include/arch/x86#g' ${file}
    sed -i 's#INCLUDEPATH += $$LEVEL/include/arch/x86_64#INCLUDEPATH += $$LEVEL/include/arch/x86#g' ${file}
  done

  # hardcode library path because it would intefere with 64-bit edb
  sed -i 's#load_plugins(edb::v1::config().plugin_path);#load_plugins("/usr/lib32/edb");#' src/main.cpp
}

build() {
  cd ${srcdir}/debugger

  # generate all Makefiles...
  qmake-qt4 -makefile
  make qmake

  for dir in src plugins
  do
    cd ${dir} && make qmake && cd ..
  done

  # ...and fix march in them
  for file in $(find src plugins -name Makefile)
  do
    sed -i 's/-march=x86-64/-march=i686/g' ${file}
  done

  make

  # that's rediculous, see https://bbs.archlinux.org/viewtopic.php?id=133403
  # yup, we're patchin binary files... but i think it's still more simple way
  # than patching system header or defining macro in all source code files
  for file in $(find -name \*.so)
  do
    sed -i 's/buildkey=x86_64 linux g++-4 full-config/buildkey=i386 linux g++-4 full-config\o00\o00/' ${file}
  done
}

package() {
  cd ${srcdir}/debugger
  
  make INSTALL_ROOT=${pkgdir}/usr install

  mv ${pkgdir}/usr/lib64 ${pkgdir}/usr/lib32
  mv ${pkgdir}/usr/bin/edb ${pkgdir}/usr/bin/edb32
  
  install -D -m 644 src/images/edb48-logo.png ${pkgdir}/usr/share/pixmaps/edb32.png
  install -D -m 644 src/images/edb48-logo.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/edb32.png
  
  cd ..
  install -D -m 644 edb32.desktop ${pkgdir}/usr/share/applications/edb32.desktop
}
