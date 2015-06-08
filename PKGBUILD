# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=qtspeech-git
pkgver=5.5.0.r72.fdfd49f
pkgrel=1
pkgdesc="A Qt5 Speech Module. (GIT Version)"
arch=('i686' 'x86_64')
url="http://qt-project.org/wiki/QtSpeech"
license=('GPL3' 'LGPL' 'FDL')
depends=('qt5-base' 'speech-dispatcher-git')
conflicts=('qtspeech')
provides=('qtspeech')
source=('git+https://codereview.qt-project.org/qt/qtspeech')
sha1sums=('SKIP')

pkgver() {
  cd qtspeech
  _ver="$(cat .qmake.conf | grep MODULE_VERSION | head -1 | cut -d ' ' -f3)"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd qtspeech
  qmake-qt5
  make
}

package() {
  make -C qtspeech INSTALL_ROOT="${pkgdir}" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "${pkgdir}/usr/lib" -type f -name '*.prl' -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
}

