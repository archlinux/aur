# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=qt4-x11, repo=utopic
# vercheck-archlinux: name=qt4, repo=extra, arch=x86_64

pkgname=qt4-ubuntu
_ubuntu_rel='1ubuntu2'
_ubuntu_ver='4.8.6+dfsg'
pkgver=4.8.6
pkgrel=1
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL' 'FDL' 'custom')
pkgdesc='A cross-platform application and UI framework'
depends=('libtiff' 'libpng' 'sqlite' 'ca-certificates' 'dbus'
        'fontconfig' 'libgl' 'libxrandr' 'libxv' 'libxi' 'alsa-lib'
        'xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils' 'libmng' 'mesa')
makedepends=('postgresql-libs' 'mariadb' 'unixodbc' 'cups' 'gtk2' 'libfbclient'
             'mesa')
optdepends=('qtchooser: set the default Qt toolkit'
            'postgresql-libs: PostgreSQL driver'
            'libmariadbclient: MariaDB driver'
            'unixodbc: ODBC driver'
            'libfbclient: Firebird/iBase driver'
            'libxinerama: Xinerama support'
            'libxcursor: Xcursor support'
            'libxfixes: Xfixes support'
            'icu: Unicode support')
install="qt4.install"
provides=("qt4=${pkgver}")
replaces=('qt<=4.8.4' 'qt-ubuntu<=4.8.4')
conflicts=('qt' 'qt4' 'qt-ubuntu')
options=('staticlibs') # libQtUiTools builds as static only
_pkgfqn="qt-everywhere-opensource-src-${pkgver}"
source=("http://download.qt-project.org/official_releases/qt/4.8/${pkgver}/${_pkgfqn}.tar.gz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/qt4-x11_${_ubuntu_ver}-${_ubuntu_rel}.debian.tar.gz"
        'qtconfig-qt4.desktop' 'assistant-qt4.desktop' 'designer-qt4.desktop'
        'linguist-qt4.desktop' 'qdbusviewer-qt4.desktop'
        'improve-cups-support.patch'
        'CVE-2014-0190.patch'
        'kubuntu_14_systemtrayicon.diff'
        'kubuntu_93_disable_overlay_scrollbars.diff')
sha512sums=('c2d07c3cf9d687cb9b93e337c89df3f0055bd02bc8aa5ecd55d3ffb238b31a4308aeabc3c51a4f94ac76a1b00796f047513d02e427ed93ae8dd99f836fff7692'
            '7f403a580462f32b002d43d9b9c6e9d365c0f98c131a70806e32e865d9a7bfd97064234258299a99c2675d50fba8efb78e4066429b6faefae820e307ad5f42a6'
            'fbcc1ec9ca04b93941c37d02326f33f3a84cb7630ca83f234845eebdb1875676aa8b27553981d8d42b2d5fcf227c7423228f704efc74a5df25a9ae05c5385fda'
            'c08b74d70e557d968672ad3251c70e23d0447f30f5d62bc63f6165cbb8c372e63b96b1e61e8888e48bc4f589705c95951f9e05723cf998963ddb7585b0f2e246'
            '29b3f2b05e27b2c8db3967bb426dfd2ee96e0715e284fc524d58c33fff55756bbb327ba166af943ce5e3fe825b2a3fc44f85c96d5117d25036b3606d7a49047d'
            'fbe3e343678b6cf7f94c97d5fb151028afdfa2fd27a19cbd583da999782f5a71c61a9282fb6284271290b3f5370e6b214b2edd1c05ee1e09d6345389b98be961'
            '5700f5f2187b8c2fee11798463a2dd1f88fb1f90ab02a787fb7cb869f073f69c8380126013094864eae203fc246397a1bb7e354715f5873bd170166afdf33c27'
            '4a8f828c79bde81ab1e39c9eaba4ef553582d85b62d6d182dda02820c4c8e046de6a25cc77d228955ed37fbc5b55f697a0a464af0bb3e171849851639e9ef4ee'
            '4bbb356b46027d6ba01ba25d11b5e445916c0d1102b3d9c56afb03a74636ef06c3f07bad2c84b9175663d8807a03cb2c6332fdf735ccfbf96870210510a9cef2'
            'c987f478e6da84e26ef5085c2a354cf085227e75af84d24b1497cfb046cfed89858bfed21850cf9dc0f5df2b66f9eed3ca8955a8c9df81cdddc9b98257231319'
            '822312858826fa4195233d6acb140c51e91fefb07fd51fd4bb21e404c67a628c3b61ca5a41f1199ac55190b85fc58a2b584b29b32d30662db3b9df8e3f3be133')

prepare() {
  cd ${_pkgfqn}

  # Apply Ubuntu patches
  patch -p1 -i "${srcdir}"/kubuntu_14_systemtrayicon.diff
  patch -p1 -i "${srcdir}"/kubuntu_93_disable_overlay_scrollbars.diff

  # (FS#28381) (KDEBUG#180051)
  patch -p1 -i "${srcdir}"/improve-cups-support.patch

  # QTBUG#38367
  patch -p1 -i "${srcdir}"/CVE-2014-0190.patch

  sed -i "s|-O2|${CXXFLAGS}|" mkspecs/common/{g++,gcc}-base.conf
  sed -i "/^QMAKE_LFLAGS_RPATH/s| -Wl,-rpath,||g" mkspecs/common/gcc-base-unix.conf
  sed -i "/^QMAKE_LFLAGS\s/s|+=|+= ${LDFLAGS}|g" mkspecs/common/gcc-base.conf

  cp mkspecs/common/linux{,32}.conf
  sed -i "/^QMAKE_LIBDIR\s/s|=|= /usr/lib32|g" mkspecs/common/linux32.conf
  sed -i "s|common/linux.conf|common/linux32.conf|" mkspecs/linux-g++-32/qmake.conf
}

build() {
  export QT4DIR="${srcdir}"/${_pkgfqn}
  export LD_LIBRARY_PATH=${QT4DIR}/lib:${LD_LIBRARY_PATH}

  cd ${_pkgfqn}

  ./configure -confirm-license -opensource \
    -prefix /usr \
    -bindir /usr/lib/qt4/bin \
    -headerdir /usr/include/qt4 \
    -docdir /usr/share/doc/qt4 \
    -plugindir /usr/lib/qt4/plugins \
    -importdir /usr/lib/qt4/imports \
    -datadir /usr/share/qt4 \
    -translationdir /usr/share/qt4/translations \
    -sysconfdir /etc/xdg \
    -examplesdir /usr/share/doc/qt4/examples \
    -demosdir /usr/share/doc/qt4/demos \
    -plugin-sql-{psql,mysql,sqlite,odbc,ibase} \
    -system-sqlite \
    -no-phonon \
    -no-phonon-backend \
    -no-webkit \
    -graphicssystem raster \
    -openssl-linked \
    -nomake demos \
    -nomake examples \
    -nomake docs \
    -silent \
    -no-rpath \
    -optimized-qmake \
    -reduce-relocations \
    -dbus-linked \
    -no-openvg
  make
}

package() {
    cd ${_pkgfqn}
    make INSTALL_ROOT="${pkgdir}" install

    # install missing icons and desktop files
    install -D -m644 src/gui/dialogs/images/qtlogo-64.png \
      "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/qt4logo.png
    install -D -m644 tools/assistant/tools/assistant/images/assistant.png \
      "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/assistant-qt4.png
    install -D -m644 tools/assistant/tools/assistant/images/assistant-128.png \
      "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/assistant-qt4.png
    install -D -m644 tools/designer/src/designer/images/designer.png \
      "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/designer-qt4.png
    for icon in tools/linguist/linguist/images/icons/linguist-*-32.png ; do
      size=$(echo $(basename ${icon}) | cut -d- -f2)
      install -D -m644 ${icon} \
          "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps/linguist-qt4.png
    done
    install -D -m644 tools/qdbus/qdbusviewer/images/qdbusviewer.png \
      "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/qdbusviewer-qt4.png
    install -D -m644 tools/qdbus/qdbusviewer/images/qdbusviewer-128.png \
      "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/qdbusviewer-qt4.png

    install -d "${pkgdir}"/usr/share/applications
    install -m644 "${srcdir}"/{assistant,designer,linguist,qtconfig,qdbusviewer}-qt4.desktop \
      "${pkgdir}"/usr/share/applications/

    # Useful symlinks for cmake and configure scripts
    install -d "${pkgdir}"/usr/bin
    for b in "${pkgdir}"/usr/lib/qt4/bin/*; do
      ln -s /usr/lib/qt4/bin/$(basename $b) "${pkgdir}"/usr/bin/$(basename $b)-qt4
    done

    # install license addition
    install -D -m644 LGPL_EXCEPTION.txt \
      ${pkgdir}/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt

    # Fix wrong libs path in pkgconfig files
    find "${pkgdir}/usr/lib/pkgconfig" -type f -name '*.pc' \
      -exec perl -pi -e "s, -L${srcdir}/?\S+,,g" {} \;

    # Fix wrong bins path in pkgconfig files
    find "${pkgdir}/usr/lib/pkgconfig" -type f -name '*.pc' \
      -exec sed -i 's|/usr/bin/|/usr/lib/qt4/bin/|g' {} \;

    # Fix wrong path in prl files
    find "${pkgdir}/usr/lib" -type f -name '*.prl' \
      -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

    # The TGA plugin is broken (FS#33568)
    rm "${pkgdir}"/usr/lib/qt4/plugins/imageformats/libqtga.so
}
