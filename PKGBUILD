# Maintainer: Felix Schindler
# Contributor: Andrea Scarpino <andrea@archlinux.org>
#
# This package is maintained at https://github.com/ftalbrecht/aur/
# in the qt51 branch

pkgbase=qt51
pkgname=('qt51-base'
         'qt51-declarative'
         'qt51-doc'
         'qt51-graphicaleffects'
         'qt51-imageformats'
         'qt51-jsbackend'
         'qt51-multimedia'
         'qt51-quick1'
         'qt51-quickcontrols'
         'qt51-script'
         'qt51-sensors'
         'qt51-serialport'
         'qt51-svg'
         'qt51-tools'
         'qt51-translations'
         'qt51-webkit'
         'qt51-x11extras'
         'qt51-xmlpatterns')
pkgver=5.1.1
pkgrel=7
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL' 'FDL' 'custom')
makedepends=('libxcb' 'xcb-proto' 'xcb-util' 'xcb-util-image' 'xcb-util-wm' 'xcb-util-keysyms'
            'mesa' 'at-spi2-core' 'alsa-lib' 'gstreamer0.10-base-plugins' 'libmng'
            'libjpeg-turbo' 'cups' 'libpulse' 'hicolor-icon-theme' 'desktop-file-utils'
            'postgresql-libs' 'libmariadbclient' 'sqlite' 'unixodbc' 'libfbclient'
            'python2' 'ruby' 'gperf' 'libxslt' 'libxcomposite' 'fontconfig'
            'openal' 'gtk2' 'libxkbcommon')
groups=('qt51')
_pkgfqn="qt-everywhere-opensource-src-${pkgver}"
source=("https://download.qt.io/archive/qt/5.1/${pkgver}/single/${_pkgfqn}.tar.xz"
        'assistant-qt51.desktop'
        'designer-qt51.desktop'
        'linguist-qt51.desktop'
        'qdbusviewer-qt51.desktop'
        'use-python2.patch'
        'bison3.patch'
        'CVE-2013-4549.patch'
        'libmng2.patch'
        '0001-Fix-g-5-build-see-qtwebkit-Source-JavaScriptCore-run.patch'
        '0002-disable-v8snapshot.patch'
        '0003-drop-tr1-usage.patch'
        '0004-fix-3rdparty-javascriptcore.patch'
        '0005-fix-bind-in-webkit2.patch'
        '0006-fix-javascriptcore.patch'
        'qt51.PATH')
md5sums=('697b7b8768ef8895e168366ab6b44760'
         'd6fd35a4858c2519385d13c04985a947'
         'bc63cf356e5cbe40ca542ffc1c5fe4ab'
         '4ce959cbe138df8589e81537ac40f37f'
         '9019f5c97c91c9b29a50b55f3e33c40a'
         '92831f79144d5cb8121915423ba47575'
         '6b162cd2bc104f0ae83ca039401be7bf'
         'e59ba552e12408dcc9486cdbb1f233e3'
         '478647fa057d190a7d789cf78995167b'
         '27b294a3b24eae2c001f85961133eadb'
         'cfbc1ecacf9851d51d5a44493fc54cd4'
         'aef7d21241f547cae1579f0e874eaa04'
         'a1c74da7e50e864ca7027416793d683b'
         '73ffdcd08c03a81176b989e6de39ae62'
         'b2fe290a446fa4d41becbf4720cfe318'
         '28f4755e54ba1df5a89d60a73f6d1a9e')

prepare() {
  cd ${_pkgfqn}

  sed -i "s|-O2|${CXXFLAGS}|" qtbase/mkspecs/common/{g++,gcc}-base.conf
  sed -i "/^QMAKE_LFLAGS_RPATH/s| -Wl,-rpath,||g" qtbase/mkspecs/common/gcc-base-unix.conf
  sed -i "/^QMAKE_LFLAGS\s/s|+=|+= ${LDFLAGS}|g" qtbase/mkspecs/common/gcc-base.conf
  sed -i 's/QMAKE_CFLAGS_RELEASE       +=/QMAKE_CFLAGS_RELEASE       += -fpermissive/g' qtbase/mkspecs/common/gcc-base.conf

  # Use python2 for Python 2.x
  patch -p1 -i "${srcdir}"/use-python2.patch
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find . -name '*.py')

  # Fix build with bison 3.x
  cd qtwebkit
  patch -p1 -i "${srcdir}"/bison3.patch

  cd ../qtbase
  patch -p1 -i "${srcdir}"/CVE-2013-4549.patch

  cd ../qtimageformats
  patch -p1 -i "${srcdir}"/libmng2.patch

  cd ..
  patch -p1 -i "${srcdir}"/0001-Fix-g-5-build-see-qtwebkit-Source-JavaScriptCore-run.patch
  patch -p1 -i "${srcdir}"/0002-disable-v8snapshot.patch
  patch -p1 -i "${srcdir}"/0003-drop-tr1-usage.patch
  patch -p1 -i "${srcdir}"/0004-fix-3rdparty-javascriptcore.patch
  patch -p1 -i "${srcdir}"/0005-fix-bind-in-webkit2.patch
  patch -p1 -i "${srcdir}"/0006-fix-javascriptcore.patch
}

build() {
  cd ${_pkgfqn}

  export QTDIR="${srcdir}"/${_pkgfqn}
  export LD_LIBRARY_PATH="${QTDIR}"/qtbase/lib:"${QTDIR}"/qttools/lib:"${LD_LIBRARY_PATH}"
  export QT_PLUGIN_PATH="${QTDIR}"/qtbase/plugins

  PYTHON=/usr/bin/python2 ./configure -confirm-license -opensource \
    -prefix /opt/$pkgbase \
    -plugin-sql-{psql,mysql,sqlite,odbc,ibase} \
    -system-sqlite \
    --no-openssl \
    -nomake examples \
    -no-rpath \
    -optimized-qmake \
    -dbus-linked \
    -reduce-relocations

  make

  # Fix paths
  find "${QTDIR}" -name Makefile -exec sed -i "s|${pkgdir}/opt/$pkgbase/bin/qdoc|${QTDIR}/qtbase/bin/qdoc|g" {} +
  find "${QTDIR}" -name Makefile.qmake-docs -exec sed -i "s|${pkgdir}/opt/$pkgbase/bin/qdoc|${QTDIR}/qtbase/bin/qdoc|g" {} +
  find "${QTDIR}" -name Makefile -exec sed -i "s|${pkgdir}/opt/$pkgbase/bin/qhelpgenerator|${QTDIR}/qttools/bin/qhelpgenerator|g" {} +
  find "${QTDIR}" -name Makefile.qmake-docs -exec sed -i "s|${pkgdir}/opt/$pkgbase/bin/qhelpgenerator|${QTDIR}/qttools/bin/qhelpgenerator|g" {} +
  find "${QTDIR}" -name Makefile -exec sed -i "s|/opt/$pkgbase/bin/qdoc|${QTDIR}/qtbase/bin/qdoc|g" {} +
  find "${QTDIR}" -name Makefile.qmake-docs -exec sed -i "s|/opt/$pkgbase/bin/qdoc|${QTDIR}/qtbase/bin/qdoc|g" {} +
  find "${QTDIR}" -name Makefile -exec sed -i "s|/opt/$pkgbase/bin/qhelpgenerator|${QTDIR}/qttools/bin/qhelpgenerator|g" {} +
  find "${QTDIR}" -name Makefile.qmake-docs -exec sed -i "s|/opt/$pkgbase/bin/qhelpgenerator|${QTDIR}/qttools/bin/qhelpgenerator|g" {} +
  sed -i "s|${pkgdir}/opt/$pkgbase/bin/qhelpgenerator|${QTDIR}/qttools/bin/qhelpgenerator|g" qtwebkit/Source/Makefile.api
  sed -i "s|/opt/$pkgbase/bin/qhelpgenerator|${QTDIR}/qttools/bin/qhelpgenerator|g" qtwebkit/Source/Makefile.api

  make docs
}

package_qt51-base() {
  pkgdesc='A cross-platform application and UI framework (5.1.x)'
  depends=('libjpeg-turbo' 'xcb-util-keysyms' 'libgl' 'dbus' 'fontconfig' 'systemd'
           'xcb-util-wm' 'libxrender' 'libxi' 'sqlite' 'libpng' 'xcb-util-image'
           'icu' 'qt5-base' 'libxkbcommon')
  optdepends=('postgresql-libs: PostgreSQL driver'
              'libmariadbclient: MariaDB driver'
              'unixodbc: ODBC driver'
              'libfbclient: Firebird/iBase driver')
  # conflicts=('qt')
  options=('staticlibs') #libQt5PlatformSupport builds static only

  cd ${_pkgfqn}/qtbase
  make INSTALL_ROOT="${pkgdir}" install

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt

  # Fix wrong path in prl files
  find "${pkgdir}/opt/$pkgbase/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  # Fix wrong qmake path in pri file
  sed -i "s|${srcdir}/${_pkgfqn}/qtbase|/usr|" \
    "${pkgdir}"/opt/$pkgbase/mkspecs/modules/qt_lib_bootstrap.pri

  # Useful symlinks
  install -d "${pkgdir}"/opt/$pkgbase/bin
  for b in "${pkgdir}"/opt/$pkgbase/bin/*; do
    ln -s /opt/$pkgbase/bin/$(basename $b) "${pkgdir}"/opt/$pkgbase/bin/$(basename $b)-qt5
  done

  # install PATH file
  install -m644 "${srcdir}/$pkgbase.PATH" "${pkgdir}/opt/$pkgbase.PATH"
}

package_qt51-declarative() {
  pkgdesc='A cross-platform application and UI framework (QtQml, QtQuick) (5.1.x)'
  depends=('qt51-jsbackend' 'qt51-xmlpatterns')
  # conflicts=('qt')

  cd ${_pkgfqn}/qtdeclarative
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/opt/$pkgbase/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  # Useful symlinks
  install -d "${pkgdir}"/opt/$pkgbase/bin
  for b in "${pkgdir}"/opt/$pkgbase/bin/*; do
    ln -s "${pkgdir}"/opt/$pkgbase/bin/$(basename $b) "${pkgdir}"/opt/$pkgbase/bin/$(basename $b)-qt5
  done

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_qt51-doc() {
  pkgdesc='A cross-platform application and UI framework (Documentation) (5.1.x)'
  depends=('qt51-base')
  # arch=('any')
  # conflicts=('qt-doc')
  # replaces=('qt-doc')
  # provides=('qt-doc')
  options=('docs' '!emptydirs')
  groups=()

  cd ${_pkgfqn}
  make INSTALL_ROOT="${pkgdir}" install_docs

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_qt51-jsbackend() {
  pkgdesc='A cross-platform application and UI framework (QtV8) (5.1.x)'
  depends=('qt51-base')

  cd ${_pkgfqn}/qtjsbackend
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/opt/$pkgbase/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_qt51-xmlpatterns() {
  pkgdesc='A cross-platform application and UI framework (QtXmlPatterns) (5.1.x)'
  depends=('qt51-base')
  # conflicts=('qt')

  cd ${_pkgfqn}/qtxmlpatterns
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/opt/$pkgbase/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  # Useful symlinks
  install -d "${pkgdir}"/opt/$pkgbase/bin
  for b in "${pkgdir}"/opt/$pkgbase/bin/*; do
    ln -s "${pkgdir}"/opt/$pkgbase/bin/$(basename $b) "${pkgdir}"/opt/$pkgbase/bin/$(basename $b)-qt5
  done

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_qt51-translations() {
  pkgdesc='A cross-platform application and UI framework (Translations) (5.1.x)'
  depends=('qt51-base')
  # conflicts=('qt')

  cd ${_pkgfqn}/qttranslations
  make INSTALL_ROOT="${pkgdir}" install

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_qt51-multimedia() {
  pkgdesc='A cross-platform application and UI framework (QtMultimedia) (5.1.x)'
  depends=('qt51-declarative' 'libpulse' 'gstreamer0.10-base' 'openal')
  # conflicts=('qt')

  cd ${_pkgfqn}/qtmultimedia
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/opt/$pkgbase/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_qt51-graphicaleffects() {
  pkgdesc='A cross-platform application and UI framework (QtGraphicalEffects) (5.1.x)'
  depends=('qt51-declarative')

  cd ${_pkgfqn}/qtgraphicaleffects
  make INSTALL_ROOT="${pkgdir}" install

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_qt51-imageformats() {
  pkgdesc='A cross-platform application and UI framework (Images plugins) (5.1.x)'
  depends=('qt51-base' 'libtiff' 'libmng')
  # conflicts=('qt')

  cd ${_pkgfqn}/qtimageformats
  make INSTALL_ROOT="${pkgdir}" install

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_qt51-quick1() {
  pkgdesc='A cross-platform application and UI framework (QtDeclarative) (5.1.x)'
  depends=('qt51-webkit' 'qt51-script')
  # conflicts=('qt')

  cd ${_pkgfqn}/qtquick1
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}"/opt/$pkgbase/lib -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  # Useful symlinks
  install -d "${pkgdir}"/opt/$pkgbase/bin
  for b in "${pkgdir}"/opt/$pkgbase/bin/*; do
    ln -s "${pkgdir}"/opt/$pkgbase/bin/$(basename $b) "${pkgdir}"/opt/$pkgbase/bin/$(basename $b)-qt5
  done

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_qt51-quickcontrols() {
  pkgdesc='A cross-platform application and UI framework (QtQuick) (5.1.x)'
  depends=('qt51-declarative')

  cd ${_pkgfqn}/qtquickcontrols
  make INSTALL_ROOT="${pkgdir}" install

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_qt51-script() {
  pkgdesc='A cross-platform application and UI framework (QtScript) (5.1.x)'
  depends=('qt51-base')
  # conflicts=('qt')

  cd ${_pkgfqn}/qtscript
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}"/opt/$pkgbase/lib -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_qt51-sensors() {
  pkgdesc='A cross-platform application and UI framework (QtSensors) (5.1.x)'
  depends=('qt51-declarative')

  cd ${_pkgfqn}/qtsensors
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}"/opt/$pkgbase/lib -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_qt51-serialport() {
  pkgdesc='A cross-platform application and UI framework (QtSerialPort) (5.1.x)'
  depends=('qt51-base')

  cd ${_pkgfqn}/qtserialport
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}"/opt/$pkgbase/lib -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_qt51-svg() {
  pkgdesc='A cross-platform application and UI framework (QtSvg) (5.1.x)'
  depends=('qt51-base')
  # conflicts=('qt')

  cd ${_pkgfqn}/qtsvg
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}"/opt/$pkgbase/lib -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_qt51-tools() {
  pkgdesc='A cross-platform application and UI framework (Development Tools, QtHelp) (5.1.x)'
  depends=('qt51-webkit' 'desktop-file-utils' 'qt51-translations' 'hicolor-icon-theme'
           'xdg-utils')
  optdepends=('qt51-doc: documentation')
  install='qt5-tools.install'
  # conflicts=('qt')
  options=('staticlibs') # libQt5UiTools builds as static only$

  cd ${_pkgfqn}/qttools
  make INSTALL_ROOT="${pkgdir}" install

  # install missing icons and desktop files
  for icon in src/linguist/linguist/images/icons/linguist-*-32.png ; do
    size=$(echo $(basename ${icon}) | cut -d- -f2)
    install -p -D -m644 ${icon} \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/linguist-${pkgbase}.png"
  done

  install -D -m644 src/assistant/assistant/images/assistant.png \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/assistant-${pkgbase}.png"
  install -D -m644 src/assistant/assistant/images/assistant-128.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/assistant-${pkgbase}.png"
  install -D -m644 src/designer/src/designer/images/designer.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/designer-${pkgbase}.png"
  install -D -m644 src/qdbus/qdbusviewer/images/qdbusviewer.png \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/qdbusviewer-${pkgbase}.png"
  install -D -m644 src/qdbus/qdbusviewer/images/qdbusviewer-128.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/qdbusviewer-${pkgbase}.png"
  install -d "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}"/{linguist,designer,assistant,qdbusviewer}-${pkgbase}.desktop \
    "${pkgdir}/usr/share/applications/"

  # Fix wrong path in prl files
  find "${pkgdir}/opt/$pkgbase/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  # Useful symlinks
  install -d "${pkgdir}"/opt/$pkgbase/bin
  for b in "${pkgdir}"/opt/$pkgbase/bin/*; do
    ln -s "${pkgdir}"/opt/$pkgbase/bin/$(basename $b) "${pkgdir}"/opt/$pkgbase/bin/$(basename $b)-qt5
  done

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_qt51-webkit() {
  pkgdesc='A cross-platform application and UI framework (QtWebKit) (5.1.x)'
  depends=('qt51-declarative' 'gstreamer0.10-base' 'libxslt' 'libxcomposite' 'qt51-sensors')
  license=('GPL3' 'LGPL' 'FDL')

  cd ${_pkgfqn}/qtwebkit
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}"/opt/$pkgbase/lib -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  # Fix wrong path in pc file
  perl -pi -e "s, -L${srcdir}/?\S+,,g" "${pkgdir}"/opt/$pkgbase/lib/pkgconfig/Qt5WebKit.pc
}

package_qt51-x11extras() {
  pkgdesc='A cross-platform application and UI framework (QtX11Extras) (5.1.x)'
  depends=('qt51-base')

  cd ${_pkgfqn}/qtx11extras
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}"/opt/$pkgbase/lib -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}
