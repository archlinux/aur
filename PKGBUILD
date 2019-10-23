# Maintainer: Jonathan Liu <net147@gmail.com>
# Contributer: N30N <archlinux@alunamation.com>
pkgname=djv
pkgver=1.3.0
pkgrel=5
pkgdesc="Movie playback and image processing software for the film and computer animation industries"
url="http://djv.sourceforge.net/"
license=('BSD')
arch=('i686' 'x86_64')
depends=("desktop-file-utils" "ffmpeg" "glew" "libjpeg" "libpng" "libquicktime" "libtiff" "openal" "openexr" "qt5-base" "qt5-svg")
makedepends=("cmake" "git" "glm" "picojson-git" "portaudio" "qt5-tools")
source=("${pkgname}::git+https://github.com/darbyjohnston/DJV#tag=${pkgver}"
        "${pkgname}_view.desktop")
md5sums=('SKIP'
         'bf03a9488996f357497e044e66df3b97')

prepare() {
    cd "${pkgname}"
    sed -i '/enable_testing()/d' CMakeLists.txt
    sed -i '/add_subdirectory(tests)/d' CMakeLists.txt
    sed -i 's/set(djvPackageThirdParty true)/set(djvPackageThirdParty false)/' CMakeLists.txt
    sed -i 's#picojson/picojson.h#picojson.h#' lib/djvCore/PicoJSON.h
    find . -not -wholename './.git*' -type f -exec sed -i 's#OPENEXR_VERSION_HEX#((OPENEXR_VERSION_MAJOR << 24) | (OPENEXR_VERSION_MINOR << 16) | (OPENEXR_VERSION_PATCH << 8))#g' {} \+
}

build() {
    [[ -d build ]] && rm -r build
    mkdir build && cd build
    cmake -DCMAKE_INSTALL_PREFIX:PATH="/opt/${pkgname}" \
          -DOpenGL_GL_PREFERENCE=LEGACY \
          -DILMBASE_SHARED_LIBS=ON \
          -DOPENEXR_SHARED_LIBS=ON \
          -DPicoJSON_INCLUDE_DIR=/usr/include \
          -DQT_INCLUDE_DIR=/usr/include/qt \
          -DQT_CORE_INCLUDE_DIR=/usr/include/qt/QtCore \
          -DQT_DBUS_INCLUDE_DIR=/usr/include/qt/QtDBus \
          -DQT_GUI_INCLUDE_DIR=/usr/include/qt/QtGui \
          -DQT_NETWORK_INCLUDE_DIR=/usr/include/qt/QtNetwork \
          -DQT_OPENGL_INCLUDE_DIR=/usr/include/qt/QtOpenGL \
          -DQT_PLATFORM_HEADERS_INCLUDE_DIR=/usr/include/qt/QtPlatformHeaders \
          -DQT_PRINT_SUPPORT_INCLUDE_DIR=/usr/include/qt/QtPrintSupport \
          -DQT_SQL_INCLUDE_DIR=/usr/include/qt/QtSql \
          -DQT_WIDGETS_INCLUDE_DIR=/usr/include/qt/QtWidgets \
          -DQT_XML_INCLUDE_DIR=/usr/include/qt/QtXml \
          "../${pkgname}"
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
    install -D -m644 "${srcdir}/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install -D -m644 "${srcdir}/${pkgname}/etc/Windows/djv_view_512x512.png" "${pkgdir}/usr/share/pixmaps/djv_view.png"
    rm "${pkgdir}/opt/${pkgname}/bin/djv_view.sh"
}

# vim:set ts=2 sw=2 et:
