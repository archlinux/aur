# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=avidemux-git
pkgname=('avidemux-core-git'
         'avidemux-qt-git'
         'avidemux-cli-git'
         )
pkgver=2.7.1.190210.ef2af6011
pkgrel=1
pkgdesc="A graphical/cli tool to edit video (filter/re-encode/split). (GIT version)"
arch=('x86_64')
url='http://www.avidemux.org'
license=('GPL2')
makedepends=('git'
             'cmake'
             'subversion'
             'yasm'
             'nasm'
             'a52dec'
             'aften'
             'dcaenc'
             'faac'
             'faad2'
             'fribidi'
             'jack'
             'lame'
             'libass'
             'libfdk-aac'
             'libmad'
             'libdca'
             'libpulse'
             'libva'
             'libvdpau'
             'libvpx'
             'opencore-amr'
             'twolame'
             'xvidcore'
             'x264'
             'x265'
             'sqlite'
             'glu'
             'qt5-script'
             'qt5-tools'
             'libxv'
             'vapoursynth'
             )
source=('avidemux::git+https://github.com/mean00/avidemux2.git'
        'fix_verbose.patch'
        'add_settings_pluginui_message_error.patch'
        'opus_check.patch'
        )
sha256sums=('SKIP'
            '4f751cbb3a65f904f7c0ad68473880e2a9edcda332a293e20ad238280ec52884'
            'c5b5d3d7bcdf4c588a780c12fdac7791ddb0527db438c85b4c1c078507da2f0b'
            'ae6d2c93163b7b760591688c7811dfdd4a952ed9074d8cbdf4953b701f0fa7db'
            )

pkgver() {
  cd avidemux
  _ver="$(cat cmake/avidemuxVersion.cmake | grep -m3 -e CPACK_PACKAGE_VERSION_MAJOR -e CPACK_PACKAGE_VERSION_MINOR -e CPACK_PACKAGE_VERSION_P | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo -e "${_ver}.$(date -u +%g%m%d).$(git rev-parse --short HEAD | head -c 11)"
}

prepare() {
  mkdir -p build_core{,_plugins,_plugins_settings}
  mkdir -p build_qt{,_plugins}
  mkdir -p build_cli{,_plugins}

  #exit
  cd avidemux

  # http://avidemux.org/smif/index.php/topic,16301.0.html
  patch -p1 -i "${srcdir}/fix_verbose.patch"

  # add SETTINGS to MESSAGE(FATAL_ERROR in avidemux_plugins/CMakeLists.txt
  patch -p1 -i "${srcdir}/add_settings_pluginui_message_error.patch"

  patch --binary -p1 -i "${srcdir}/opus_check.patch"
}

build() {
  msg2 "Build Core Libs"
  cd "${srcdir}/build_core"
  cmake ../avidemux/avidemux_core \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFAKEROOT="${srcdir}/fakeroot" \
    -DAVIDEMUX_SOURCE_DIR="${srcdir}/avidemux"

  make DESTDIR="${srcdir}/fakeroot" install

  msg2 "Build Core Plugins"
  cd "${srcdir}/build_core_plugins"
  cmake ../avidemux/avidemux_plugins \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPLUGIN_UI=COMMON \
    -DUSE_EXTERNAL_LIBA52=ON \
    -DUSE_EXTERNAL_LIBASS=ON \
    -DUSE_EXTERNAL_LIBMAD=ON \
    -DUSE_EXTERNAL_MP4V2=ON \
    -DFAKEROOT="${srcdir}/fakeroot"

  make DESTDIR="${srcdir}/fakeroot" install

  msg2 "Build Qt GUI"
  cd "${srcdir}/build_qt"
  cmake ../avidemux/avidemux/qt4 \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_QT5=ON \
    -DFAKEROOT="${srcdir}/fakeroot"

  make -j1 DESTDIR="${srcdir}/fakeroot" install

  msg2 "Build Qt GUI Plugins"
  cd ${srcdir}/build_qt_plugins
  cmake ../avidemux/avidemux_plugins \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_QT5=ON \
    -DPLUGIN_UI=QT4 \
    -DUSE_EXTERNAL_LIBA52=ON \
    -DUSE_EXTERNAL_LIBASS=ON \
    -DUSE_EXTERNAL_LIBMAD=ON \
    -DUSE_EXTERNAL_MP4V2=ON \
    -DFAKEROOT="${srcdir}/fakeroot"

  make DESTDIR="${srcdir}/fakeroot" install

  msg2 "Build CLI frontend"
  cd "${srcdir}/build_cli"
  cmake ../avidemux/avidemux/cli \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFAKEROOT="${srcdir}/fakeroot"

  make DESTDIR="${srcdir}/fakeroot" install

  msg2 "Build CLI plugins"
  cd "${srcdir}/build_cli_plugins"
  cmake ../avidemux/avidemux_plugins \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPLUGIN_UI=CLI \
    -DUSE_EXTERNAL_LIBA52=ON \
    -DUSE_EXTERNAL_LIBASS=ON \
    -DUSE_EXTERNAL_LIBMAD=ON \
    -DUSE_EXTERNAL_MP4V2=ON \
    -DFAKEROOT="${srcdir}/fakeroot"

  make DESTDIR="${srcdir}/fakeroot" install

  msg2 "Build Settings"
  cd "${srcdir}/build_core_plugins_settings"
  cmake ../avidemux/avidemux_plugins \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr  \
    -DPLUGIN_UI=SETTINGS \
    -DUSE_EXTERNAL_LIBA52=ON \
    -DUSE_EXTERNAL_LIBASS=ON \
    -DUSE_EXTERNAL_LIBMAD=ON \
    -DUSE_EXTERNAL_MP4V2=ON \
    -DFAKEROOT="${srcdir}/fakeroot"

  make DESTDIR="${srcdir}/fakeroot" install
}

package_avidemux-core-git() {
  pkgdesc="Core libs for Avidemux. (GIT version)"
  depends=('a52dec'
           'aften'
           'dcaenc'
           'faac'
           'faad2'
           'fribidi'
           'jack'
           'lame'
           'libass.so'
           'libfdk-aac.so'
           'libmad'
           'libdca'
           'libpulse'
           'libva'
           'libvdpau'
           'libvpx.so'
           'opencore-amr'
           'twolame'
           'libxvidcore.so'
           'sqlite'
           'x264'
           'x265'
           )
  optdepends=('avidemux-qt-git: a Qt GUI for Avidemux'
              'avidemux-cli-git: a CLI frontend for Avidemux'
              'wine: AVSload (Load Avisynth scripts on Avidemux)'
              'vapoursynth: vsProxy (Load Vapoursynth scripts on Avidemux'
              )
  provides=('avidemux-core')
  conflicts=('avidemux-core')

  make -C build_core DESTDIR="${pkgdir}" install
  make -C build_core_plugins DESTDIR="${pkgdir}" install
  make -C build_core_plugins_settings DESTDIR="${pkgdir}" install

  install -Dm755 fakeroot/usr/lib/ADM_plugins6/videoEncoders/libADM_ve_x264_other.so "${pkgdir}/usr/lib/ADM_plugins6/videoEncoders/libADM_ve_x264_other.so"
  install -Dm755 fakeroot/usr/lib/ADM_plugins6/videoEncoders/libADM_ve_x265_other.so "${pkgdir}/usr/lib/ADM_plugins6/videoEncoders/libADM_ve_x265_other.so"
}

package_avidemux-qt-git() {
  pkgdesc="Qt GUI for Avidemux. (GIT version)"
  depends=("avidemux-core-git>=${pkgver}"
           'qt5-script'
           'libxv'
           'glu'
           'desktop-file-utils'
           )
  provides=('avidemux-qt')
  conflicts=('avidemux-qt4'
             'avidemux-qt5'
             'avidemux-qt'
             )

  make -C build_qt DESTDIR="${pkgdir}" install
  make -C build_qt_plugins DESTDIR="${pkgdir}" install
}

package_avidemux-cli-git() {
  pkgdesc="CLI frontend for Avidemux. (GIT version)"
  depends=("avidemux-core-git>=${pkgver}"
           'gcc-libs'
           )
  provides=('avidemux-cli')
  conflicts=('avidemux-cli')

  make -C build_cli DESTDIR="${pkgdir}" install
  make -C build_cli_plugins DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/lib/ADM_plugins6/videoEncoders"
}
