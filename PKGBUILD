# Maintainer: Jonathan Liu <net147@gmail.com>
# Contributer: N30N <archlinux@alunamation.com>
pkgname=djv
pkgver=1.2.5
pkgrel=4
pkgdesc="Movie playback and image processing software for the film and computer animation industries"
url="http://djv.sourceforge.net/"
license=('BSD')
arch=('i686' 'x86_64')
depends=("desktop-file-utils" "ffmpeg" "glew" "libjpeg" "libpng" "libquicktime" "libtiff" "openexr" "qt5-base" "qt5-svg")
makedepends=("cmake" "glm" "portaudio" "qt5-tools")
source=("git://git.code.sf.net/p/djv/git#tag=1.2.5"
        "${pkgname}_view.desktop")
md5sums=('SKIP'
         '2668ad2635036f33ba615b5dc538b1cf')

prepare() {
    cd git
    sed -i '/enable_testing()/d' CMakeLists.txt
    sed -i '/add_subdirectory(tests)/d' CMakeLists.txt
    sed -i 's/set(djvPackageThirdParty true)/set(djvPackageThirdParty false)/' CMakeLists.txt
}

build() {
    [[ -d build ]] && rm -r build
    mkdir build && cd build
    cmake -DCMAKE_INSTALL_PREFIX:PATH="/opt/${pkgname}" \
          -DOpenGL_GL_PREFERENCE=LEGACY \
          -DILMBASE_SHARED_LIBS=ON \
          -DOPENEXR_SHARED_LIBS=ON \
          -DQT_INCLUDE_DIR=/usr/include/qt \
          -DQT_CORE_INCLUDE_DIR=/usr/include/qt/QtCore \
          -DQT_DBUS_INCLUDE_DIR=/usr/include/qt/QtDBus \
          -DQT_GUI_INCLUDE_DIR=/usr/include/qt/QtGui \
          -DQT_NETWORK_INCLUDE_DIR=/usr/include/qt/QtNetwork \
          -DQT_OPENGL_INCLUDE_DIR=/usr/include/qt/QtOpenGL \
          -DQT_PRINT_SUPPORT_INCLUDE_DIR=/usr/include/qt/QtPrintSupport \
          -DQT_SQL_INCLUDE_DIR=/usr/include/qt/QtSql \
          -DQT_SVG_INCLUDE_DIR=/usr/include/qt/QtSvg \
          -DQT_WIDGETS_INCLUDE_DIR=/usr/include/qt/QtWidgets \
          -DQT_XML_INCLUDE_DIR=/usr/include/qt/QtXml \
          ../git
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
    install -d "${pkgdir}/usr/bin"
    for x in djv_convert djv_info djv_ls djv_view; do
      ln -s "/opt/${pkgname}/bin/$x" "${pkgdir}/usr/bin/$x"
    done
    install -D -m644 {"${srcdir}","${pkgdir}/usr/share/applications"}/"${pkgname}_view.desktop"
    install -D -m644 "${srcdir}/git/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install -D -m644 "${srcdir}/git/etc/Windows/djv_view_512x512.png" "${pkgdir}/usr/share/pixmaps/djv_view.png"
    rm "${pkgdir}/opt/${pkgname}/bin/djv_view.sh"
}

# vim:set ts=2 sw=2 et:
