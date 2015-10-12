# Maintainer: maz_1 <ohmygod19993 at gmail dot com>

pkgname=bin32-edb-debugger-git
pkgver=r908.d6e060b
pkgrel=1
pkgdesc="EDB (Evan's Debugger) is a binary mode debugger with the goal of having usability on par with OllyDbg - 32 bit version (used to debug 32-bit applications on x86_64 architecture)."
arch=('x86_64')
url="http://www.codef00.com/projects.php#Debugger"
license=('GPL2')
depends=('lib32-qt5-base' 'lib32-qt5-xmlpatterns' 'lib32-capstone')
makedepends=('boost>=1.35.0')
install=edb.install
source=("git+https://github.com/eteran/edb-debugger.git"
        "git+https://github.com/eteran/qhexview.git"
        edb32.desktop)
md5sums=('SKIP' 
        'SKIP' 
         4df05c4a3e3ee228510b46076f12e7d3)

# WARNING: this PKGBUILD contains few nasty hacks because of qmake's stubbornness
# and qtconfig.h "bug" in Arch Linux (https://bbs.archlinux.org/viewtopic.php?id=133403)
pkgver() {
	cd edb-debugger

	if git_version=$( git describe --long --tags 2>/dev/null ); then
		IFS='-' read last_tag tag_rev commit <<< "$git_version"
		printf '%s.r%s.%s' "$last_tag" "$tag_rev" "$commit"
	else
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

prepare() {
  cd ${srcdir}/edb-debugger
    
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
  
  cd "${srcdir}/edb-debugger/src"
  git submodule init qhexview
  git config submodule.qhexview.url ../../qhexview
  git submodule update qhexview
  
}

build() {
  cd ${srcdir}/edb-debugger
  sed -i "s:/usr/local:/usr:g" common.pri
  # generate all Makefiles...
  qmake-qt5 -makefile DEFAULT_PLUGIN_PATH="/usr/lib32/edb/"
  make qmake

  for dir in src plugins
  do
    cd ${dir} && qmake-qt5 && cd ..
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
  cd ${srcdir}/edb-debugger
  
  make INSTALL_ROOT=${pkgdir} install

  mv ${pkgdir}/usr/lib64 ${pkgdir}/usr/lib32
  mv ${pkgdir}/usr/bin/edb ${pkgdir}/usr/bin/edb32.bin
  echo '#!/bin/sh
export QT_PLUGIN_PATH=/usr/lib32/qt5/plugins/
export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib32/qt5/plugins/platforms
export QT_QPA_PLATFORM=xcb
exec /usr/bin/edb32.bin "$@"' > ${pkgdir}/usr/bin/edb32
  chmod +x ${pkgdir}/usr/bin/edb32
  
  install -D -m 644 src/images/edb48-logo.png ${pkgdir}/usr/share/pixmaps/edb32.png
  install -D -m 644 src/images/edb48-logo.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/edb32.png
  
  cd ..
  install -D -m 644 edb32.desktop ${pkgdir}/usr/share/applications/edb32.desktop
}
