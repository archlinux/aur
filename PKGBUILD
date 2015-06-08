# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=qmc2-svn
pkgname=('qmc2-common-svn' 'qmc2-sdlmame-svn' 'qmc2-arcade-svn')
pkgver=0.53.6683
pkgrel=1
pkgdesc="Qt 4 based UNIX MAME frontend supporting SDLMAME (SVN version) (SPLIT PKGBUILD)"
url="http://qmc2.arcadehits.net/wordpress/"
license=("GPL")
arch=('i686' 'x86_64')
makedepends=('subversion' 'rsync' 'mesa' 'qtwebkit' 'phonon-qt4' 'sdl' 'java-environment')
source=("qmc2::svn://svn.code.sf.net/p/qmc2/code/trunk")
sha1sums=('SKIP')

_buildopts="CTIME=0 PREFIX=/usr DATADIR=/usr/share SYSCONFDIR=/etc QTDIR=/usr QMAKE=qmake-qt4 LRELEASE=lrelease-qt4 LUPDATE=lupdate-qt4"

pkgver() {
  cd qmc2
  _ver="$(cat Makefile | grep -e "VERSION_MAJOR" -e VERSION_MINOR | head -n2 | cut -d " " -f3)"
  echo "$(echo ${_ver} | tr ' ' .).$(svnversion)"
}

build() {
  msg2 "Build QMC2"
  make -C qmc2 ${_buildopts}
  msg2 "build Arcade Front End"
  make -C qmc2 arcade ${_buildopts}
  msg2 "build CHDman Qt GUI"
  make -C qmc2 qchdman ${_buildopts}
  msg2 "build Template_Sync"
  pushd "qmc2/tools/template_sync" &> /dev/null
  qmake-qt4
  make
  popd &> /dev/null
  msg2 "build QMC2 Options Editor"
  pushd qmc2/tools/qmc2_options_editor_java &> /dev/null
  sh build.sh
  popd &> /dev/null
  msg2 "build manuals"
  make -C qmc2 man ${_buildopts}
}

package_qmc2-common-svn() {
  pkgdesc='Qt 4 based UNIX MAME frontend. Core files, included qCHDman GUI. (SVN version)'
  arch=('i686' 'x86_64')
  depends=('qt4' 'java-environment')
  conflicts=('qmc2')
  provides=("qmc2-common-svn=${pkgver}")
  optdepends=('qmc2-sdlmame-svn: Frontend for SDLMAME'
              'qmc2-arcade-svn: Arcade frontend for SDLMAME')

  pushd qmc2/data/ &> /dev/null
  find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/qmc2/{}" \;
  ln -s /usr/share/qmc2/img/classic/* "${pkgdir}/usr/share/qmc2/img/"
  popd &> /dev/null

  install -Dm644 qmc2/inst/qmc2.ini.template "${pkgdir}/etc/qmc2/qmc2.ini"
  sed 's|DATADIR|/usr/share|' -i "${pkgdir}/etc/qmc2/qmc2.ini"

  install -Dm755 qmc2/tools/template_sync/template_sync "${pkgdir}/usr/bin/template_sync"

  pushd qmc2/tools/qmc2_options_editor_java &> /dev/null
  find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/qmc2/qmc2_options_editor_java/{}" \;
  popd &> /dev/null
  ln -s /usr/share/qmc2/qmc2_options_editor_java/run.sh "${pkgdir}/usr/bin/qmc2_options_editor"
  rm -fr "${pkgdir}/usr/share/qmc2/qmc2_options_editor_java/build.sh"
  chmod +x "${pkgdir}/usr/share/qmc2/qmc2_options_editor_java/run.sh"
  sed '2icd "/usr/share/qmc2/qmc2_options_editor_java"' -i "${pkgdir}/usr/share/qmc2/qmc2_options_editor_java/run.sh"

  make -C qmc2 ${_buildopts} DESTDIR="${pkgdir}" MAN_DIR="${pkgdir}/usr/share/man" qchdman-install man-install

  find "${pkgdir}/usr/share/man/man6" ! -type d ! -name "qchdman.6.gz" -a ! -name "qmc2-main-gui.6.gz" -a ! -name "qmc2.6.gz" -delete
}

package_qmc2-sdlmame-svn() {
  pkgdesc='Qt 4 based UNIX MAME frontend for SDLMAME. (SVN version)'
  depends=("qmc2-common-svn=${pkgver}" 'qtwebkit' 'phonon-qt4')
  optdepends=('sdlmame: A port of the popular Multiple Arcade Machine Emulator using SDL with OpenGL support')
  arch=('i686' 'x86_64')

  make -C qmc2 ${_buildopts} DESTDIR="${pkgdir}" MAN_DIR="${pkgdir}/usr/share/man" install man-install

  # Cleanup
  rm -fr "${pkgdir}/usr/bin/"{qmc2,runonce}
  rm -fr "${pkgdir}/etc"
  rm -fr "${pkgdir}/usr/share/qmc2"

  find "${pkgdir}/usr/share/man/man6" ! -type d ! -name "qmc2-sdlmame.6.gz" -delete
}

package_qmc2-arcade-svn() {
  pkgdesc='Qt 4 based UNIX MAME Arcade frontend for SDLMAME/SDLMESS/SDLUME. (SVN version)'
  depends=("qmc2-common-svn=${pkgver}" 'sdl' 'qt4')
  optdepends=('sdlmame: A port of the popular Multiple Arcade Machine Emulator using SDL with OpenGL support')
  arch=('i686' 'x86_64')

  make -C qmc2 ${_buildopts} DESTDIR="${pkgdir}" MAN_DIR="${pkgdir}/usr/share/man" arcade-install man-install

  # Cleanup
  rm -fr "${pkgdir}/usr/bin/"{qmc2,runonce}
  rm -fr "${pkgdir}/etc"
  rm -fr "${pkgdir}/usr/share/qmc2"

  find "${pkgdir}/usr/share/man/man6" ! -type d ! -name "qmc2-arcade.6.gz" -delete
}