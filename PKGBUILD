# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=qmc2-svn
pkgname=('qmc2-common-svn' 'qmc2-sdlmame-svn' 'qmc2-arcade-svn')
pkgver=0.54.6820
pkgrel=1
pkgdesc="Qt based UNIX MAME frontend supporting SDLMAME. (SVN version)"
url="http://qmc2.arcadehits.net/wordpress/"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('subversion' 'rsync' 'mesa' 'qtwebkit' 'phonon' 'qt5-declarative' 'qt5-webkit' 'qt5-multimedia' 'qt5-script' 'sdl' 'java-environment')
source=("qmc2::svn://svn.code.sf.net/p/qmc2/code/trunk")
sha1sums=('SKIP')

_buildopts="CTIME=0 OPENGL=1 PREFIX=/usr MAN_DIR=/usr/share/man QMAKE=/usr/bin/qmake-qt5 LRELEASE=/usr/bin/lrelease-qt5 LUPDATE=/usr/bin/lupdate-qt5"

pkgver() {
  cd qmc2
  _ver="$(cat Makefile | grep -m2 -e VERSION_MAJOR -e VERSION_MINOR | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.$(svnversion)"
}

build() {
  msg2 "Build QMC2"
  make -C qmc2 ${_buildopts} all arcade tools man
  msg2 "build Template_Sync"
  (cd qmc2/tools/template_sync; qmake-qt5; make)
  msg2 "build QMC2 Options Editor"
  (cd qmc2/tools/qmc2_options_editor_java; sh build.sh)
}

package_qmc2-common-svn() {
  pkgdesc='Qt based UNIX MAME frontend. Core files, included qCHDman GUI. (SVN version)'
  arch=('i686' 'x86_64')
  depends=('qt5-script' 'java-environment')
  conflicts=('qmc2')
  provides=("qmc2-common-svn=${pkgver}")
  optdepends=('qmc2-sdlmame-svn: Frontend for SDLMAME'
              'qmc2-arcade-svn: Arcade frontend for SDLMAME')

  make -C qmc2 ${_buildopts} DESTDIR="${pkgdir}" install tools-install arcade-install man-install

  # Cleanup
  rm -fr "${pkgdir}/usr/bin/"qmc2-{arcade,sdlmame}
  rm -fr "${pkgdir}/usr/share/applications/"qmc2-{arcade,sdlmame}.desktop

  install -Dm755 qmc2/tools/template_sync/template_sync "${pkgdir}/usr/bin/template_sync"

  pushd qmc2/tools/qmc2_options_editor_java &> /dev/null
  find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/qmc2/qmc2_options_editor_java/{}" \;
  cd "${pkgdir}/usr/share/qmc2/qmc2_options_editor_java"
  rm -fr {build.sh,src}
  sed -e '2icd "/usr/share/qmc2/qmc2_options_editor_java"' \
      -e '9d' -e '15d' \
      -i run.sh
  chmod +x run.sh
  popd &> /dev/null
  ln -s /usr/share/qmc2/qmc2_options_editor_java/run.sh "${pkgdir}/usr/bin/qmc2_options_editor"

  find "${pkgdir}/usr/share/man/man6" ! -type d ! -name "qchdman.6.gz" -a ! -name "qmc2-main-gui.6.gz" -a ! -name "qmc2.6.gz" -delete
}

package_qmc2-sdlmame-svn() {
  pkgdesc='Qt based UNIX MAME frontend for SDLMAME. (SVN version)'
  depends=("qmc2-common-svn=${pkgver}" 'sdl' 'qt5-webkit' 'qt5-multimedia')
  optdepends=('sdlmame: A port of the popular Multiple Arcade Machine Emulator using SDL with OpenGL support')
  arch=('i686' 'x86_64')

  make -C qmc2 ${_buildopts} DESTDIR="${pkgdir}" install man-install

  # Cleanup
  rm -fr "${pkgdir}/usr/bin/"{qmc2,runonce}
  rm -fr "${pkgdir}/etc"
  rm -fr "${pkgdir}/usr/share/qmc2"

  find "${pkgdir}/usr/share/man/man6" ! -type d ! -name "qmc2-sdlmame.6.gz" -delete
}

package_qmc2-arcade-svn() {
  pkgdesc='Qt based UNIX MAME Arcade frontend for SDLMAME. (SVN version)'
  depends=("qmc2-common-svn=${pkgver}" 'sdl' 'qt5-declarative')
  optdepends=('sdlmame: A port of the popular Multiple Arcade Machine Emulator using SDL with OpenGL support')
  arch=('i686' 'x86_64')

  make -C qmc2 ${_buildopts} DESTDIR="${pkgdir}" arcade-install man-install

  # Cleanup
  rm -fr "${pkgdir}/usr/bin/"{qmc2,runonce}
  rm -fr "${pkgdir}/etc"
  rm -fr "${pkgdir}/usr/share/qmc2"

  find "${pkgdir}/usr/share/man/man6" ! -type d ! -name "qmc2-arcade.6.gz" -delete
}
