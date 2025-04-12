# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Zulu
# Contributor: AudioLinux <audiolinux AT fastmail DOT fm>
# Contributor: almack

_name="quick1"
pkgname="qt5-${_name}"
_commit_rel="92c847e56d94c9032f3fa83922742e455233e4f3" # 5.8.0
_commit="fa02271a18837f20e82006de23c2af1899294aa1" # r31
pkgver="5.8.0+r31+g${_commit::7}"
pkgrel=3
pkgdesc="Deprecated Qt Quick Controls module for creating legacy Qt Quick user interfaces"
arch=('i686' 'x86_64')
url="https://www.qt.io"
_url="https://github.com/qt/qt${_name}"
license=('LGPL-2.1-only AND LGPL-3.0-only AND GPL-3.0-only AND custom:Qt-GPL-exception-1.1')
depends=('gcc-libs' 'glibc' 'qt5-base' 'qt5-script' 'qt5-xmlpatterns')
optdepends=('qt5-declarative'
            'qt5-webkit')
provides=('libQt5Declarative.so')
# groups=('qt5')
_pkgsrc="qt${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz")
b2sums=('1e6e13d1f069f1ef6d23e0023efbc0c8f10b6a02b266159604ae9bd1e6ee1090fb64f1e54ae637a05c25223982b362fd8e8c20b751da473d07bbb6ce0209d30b')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build"
  
  # https://github.com/qt/qtquick1/pull/2
  find . -type f \( -name '*.h' -o -name '*.cpp' \) -exec \
    sed -i 's|<QtDeclarative/private/\([^_]*\)\.h>|<QtDeclarative/\1.h>|g' {} +

  syncqt.pl-qt5 -version "${pkgver%%+*}" 'sync.profile'

  cd "src"
  # build docs
  # sed -i '/^# SUBDIRS += doc/s/^# //' 'src.pro'
  # fix 'qt5-tools' naming changes
  find . -type f \( -name '*.pro' -o -name '*.pri' \) -exec \
    sed -i 's/qml1_plugin/qml_plugin/g' "{}" +

  cd "imports"
  # owned by 'qt5-declarative' and 'qt5-webkit'
  sed -e 's/folderlistmodel//g' \
      -e '/webview/d' \
      -i 'imports.pro'
}

build() {
  cd "${srcdir}/${_pkgsrc}/build"
  qmake-qt5 ..
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  find . -maxdepth 1 -type f \( -name 'LICENSE*' -o -name 'LGPL*' \) -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/licenses/${pkgname}/{}" \;

  cd "build"
  make INSTALL_ROOT="${pkgdir}" install

  cd "${pkgdir}/usr"
  # Drop QMAKE_PRL_BUILD_DIR because it references the build dir
  find "lib" -type f -name '*.prl' -exec \
    sed -i '/^QMAKE_PRL_BUILD_DIR/d' "{}" +
  # -e 's/\(QMAKE_PRL_LIBS =\).*/\1/' \

  # Create some symlinks in /usr/bin/, postfixed with '-qt5'
  find "bin" -type f -execdir \
    ln -vsf "/usr/bin/{}" "{}-qt5" \;
}
