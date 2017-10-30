# Maintainer: Felix Schindler <aur at felixschindler dot net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt58
pkgver=5.8.0
pkgrel=1
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='A cross-platform application and UI framework (5.8.x)'
depends=('libjpeg-turbo' 'xcb-util-keysyms' 'xcb-util-renderutil' 'libgl' 'fontconfig'
         'xcb-util-wm' 'libxrender' 'libxi' 'sqlite' 'xcb-util-image' 'icu' 'assimp'
         'bluez-libs' 'sdl2' 'libpulse' 'openal' 'hicolor-icon-theme' 'double-conversion'
         'tslib' 'libinput' 'libsm' 'libxkbcommon-x11' 'libproxy' 'libcups' 'openssl-1.0')
makedepends=('libfbclient' 'libmariadbclient' 'sqlite' 'unixodbc' 'postgresql-libs' 'alsa-lib' 'gst-plugins-base-libs'
             'gtk3' 'cups' 'freetds' 'flite' 'speech-dispatcher')
optdepends=('postgresql-libs: PostgreSQL driver'
            'libmariadbclient: MariaDB driver'
            'unixodbc: ODBC driver'
            'libfbclient: Firebird/iBase driver'
            'freetds: MS SQL driver'
            'flite: flite TTS backend'
            'speech-dispatcher: speech-dispatcher TTS backend'
            'gst-plugins-bad: camera support'
            'gtk3: GTK platform plugin')
_pkgfqn="qt-everywhere-opensource-src-${pkgver}"
source=("http://download.qt.io/archive/qt/5.8/${pkgver}/single/qt-everywhere-opensource-src-${pkgver}.tar.xz"
        qtbug-53375.patch
        qt5-base-journald.patch::"https://github.com/qt/qtbase/commit/0c8f3229.patch"
        plasma-crash-1.patch::https://github.com/qt/qtbase/commit/3bd0fd8f.patch
        plasma-crash-2.patch::https://github.com/qt/qtbase/commit/0874861b.patch
        plasma-crash-3.patch::https://github.com/qt/qtbase/commit/baad82d2.patch
        qt58.PATH
        revert-5b807802.patch
        qt5-webengine-nss.patch
        qtwebengine-5.7.0-icu58.patch
        qtbug-58488.patch::"https://github.com/qt/qtwebengine/commit/7e7dd262.patch"
        qtbug-58381.patch::"https://github.com/qt/qtwebengine/commit/8e147ed3.patch"
        qtbug-58515.patch::"https://github.com/qt/qtwebengine/commit/a6c6665d.patch"
        qtbug-58673.patch::"https://github.com/qt/qtwebengine/commit/90501711.patch"
        qtbug-58362.patch::"https://github.com/qt/qtwebengine/commit/31374ba9.patch"
        qtbug-57778.patch::"https://github.com/qt/qtwebengine/commit/5c2cbfcc.patch"
        qt5-webkit-icu59.patch
        qtbug-58811.patch::"https://github.com/qt/qtdeclarative/commit/b078939.patch")
md5sums=('66660cd3d9e1a6fed36e88adcb72e9fe'
         '126477f84a61f3852b7d392f9eb31949'
         'e9ab6de042b599638f506d2974598164'
         '438f85a8ecc0f8c066dc0deb5961b6fa'
         '763a796776f3f8bf46cd4a0ed13d4028'
         'ffacccebfc17dc5a87724d13cefe38e5'
         '86f9c05e82c1554685561962ae62263b'
         '95e986e9c0ab5ebe03c85efb69ee751a'
         '2a1610b34204102938a24154a52e5571'
         '9d225d1bf83ea45dbf6556d30d35fcb8'
         '0219eab606c732b2d5c0badec65bc5aa'
         '9cdb9bfec2dee46b09969a6e9a018e7f'
         '8898bbae4c4059963d5c31a6cabe93dd'
         '700db01ba526a4b08f9e355ed9951165'
         '8762d933ea50b0147c8b10e241a24330'
         '2c04883620761476fa4e2985988e11a4'
         'f6c74b0196a698cc1c5a34c695b22715'
         '3092d9d96c23b5827970efa431d73aeb')

prepare() {
  # Fix gcc bug: https://bugreports.qt.io/browse/QTBUG-53375
  cd ${srcdir}/${_pkgfqn}
  patch -p1 -i ${srcdir}/qtbug-53375.patch

  # base
  ######
  cd ${srcdir}/${_pkgfqn}/qtbase

  # Build qmake using Arch {C,LD}FLAGS
  # This also sets default {C,CXX,LD}FLAGS for projects built using qmake
  sed -i -e "s|^\(QMAKE_CFLAGS_RELEASE.*\)|\1 ${CFLAGS}|" \
    mkspecs/common/gcc-base.conf
  sed -i -e "s|^\(QMAKE_LFLAGS_RELEASE.*\)|\1 ${LDFLAGS}|" \
    mkspecs/common/g++-unix.conf

  # Use python2 for Python 2.x
  find . -name '*.py' -exec sed -i \
    's|#![ ]*/usr/bin/python$|&2|;s|#![ ]*/usr/bin/env python$|&2|' {} +

  find -name '*.pro' -o -name '*.pri' -o -name '*.prf' | xargs sed -i -e 's|python -c|python2 -c|g' -e 's|python \$|python2 \$|g'

  # Fix logging to systemd journal
  patch -p1 -i ${srcdir}/qt5-base-journald.patch

  # Fix some Plasma taskbar crashes https://bugs.kde.org/show_bug.cgi?id=342763
  patch -p1 -i ${srcdir}/plasma-crash-1.patch
  patch -p1 -i ${srcdir}/plasma-crash-2.patch
  patch -p1 -i ${srcdir}/plasma-crash-3.patch

  # declarative
  #############
  cd ${srcdir}/${_pkgfqn}/qtdeclarative

  # Fix crash on Plasma toolbox https://bugreports.qt.io/browse/QTBUG-58811
  patch -p1 -i ${srcdir}/qtbug-58811.patch

  # doc
  #####
  cd ${srcdir}/${_pkgfqn}

  ln -s /usr/bin/{rcc,uic,moc} qtbase/bin/

  # workaround c++11 detection with GCC6
  sed -e '/requires(c++11)/d' -i qtserialbus/qtserialbus.pro

  # # Hack to force using python2
  # cd "$srcdir"
  # mkdir -p bin
  # ln -s /usr/bin/python2 bin/python

  # wayland
  #########
  cd ${srcdir}/${_pkgfqn}/qtwayland

  # Revert commit that breaks Plasma Wayland
  patch -Rp1 -i ${srcdir}/revert-5b807802.patch

  # webengine
  ###########
  cd ${srcdir}/${_pkgfqn}/qtwebengine

  # Prevent drop-down popups form stealing focus https://bugreports.qt.io/browse/QTBUG-58488
  patch -p1 -i ${srcdir}/qtbug-58488.patch

  # Backport some focus fixes
  patch -p1 -i ${srcdir}/qtbug-58381.patch
  patch -p1 -i ${srcdir}/qtbug-58515.patch
  patch -p1 -i ${srcdir}/qtbug-58673.patch 

  # Fix IME support
  patch -p1 -i ${srcdir}/qtbug-58362.patch

  # Fix incorrectly overriding new and delete
  patch -p1 -i ${srcdir}/qtbug-57778.patch
}

build() {
  cd ${srcdir}/${_pkgfqn}

  # FS#38796
  [[ "${CARCH}" = "i686" ]] && SSE2="-no-sse2"

  echo "INCLUDEPATH += /usr/include/openssl-1.0" >> qtbase/src/network/network.pro
  export OPENSSL_LIBS='-L/usr/lib/openssl-1.0 -lssl -lcrypto'

  PYTHON=/usr/bin/python2 ./configure -confirm-license -opensource -v \
    -prefix /opt/$pkgname \
    -plugin-sql-{psql,mysql,sqlite,odbc,ibase} \
    -system-sqlite \
    -openssl-linked \
    -nomake examples \
    -nomake tests \
    -no-rpath \
    -optimized-qmake \
    -dbus-linked \
    -system-harfbuzz \
    -journald \
    -no-use-gold-linker \
    -reduce-relocations ${SSE2}

  make
  # make docs
}

package() {
  # base
  # ####
  cd ${srcdir}/${_pkgfqn}

  make INSTALL_ROOT="${pkgdir}" install

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "${pkgdir}/opt/$pkgname/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  # Fix wrong qmake path in pri file
  sed -i "s|${srcdir}/${_pkgfqn}|/opt/${pkgname}|" \
    "${pkgdir}"/opt/$pkgname/mkspecs/modules/qt_lib_bootstrap_private.pri

  # Symlinks for backwards compatibility
  for b in "${pkgdir}"/opt/$pkgname/bin/*; do
    ln -s /opt/$pkgname/bin/$(basename $b) "${pkgdir}"/opt/$pkgname/bin/$(basename $b)-qt5
  done

  # install PATH file
  install -m644 "${srcdir}/${pkgname}.PATH" "${pkgdir}/opt/${pkgname}.PATH"

  # xcb-private-headers
  # ###################
  install -d -m755 "$pkgdir"/opt/$pkgname/include/qtxcb-private

  # examples
  ##########
  # The various example dirs have conflicting .pro files, but
  # QtCreator requires them to be in the same top-level directory.
  # Matching the Qt5 installer, only the qtbase project is kept.
  _base="$pkgdir"/opt/share/doc/qt/examples
  mkdir -p $_base
  cp ${srcdir}/${_pkgfqn}/qtbase/examples/examples.pro $_base

  _fdirs=$(find "${srcdir}/${_pkgfqn}" -maxdepth 2 -type d -name examples)
  for _dir in $_fdirs; do
      _mod=$(basename ${_dir%/examples})

      if [ -e "$_dir/README" ]; then
        cp $_dir/README $_dir/README.$_mod
      fi

      cp -rn $_dir/* $_base
  done
}

