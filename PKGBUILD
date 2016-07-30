# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=avidemux-git
pkgname=('avidemux-core-git'
         'avidemux-qt-git'
         'avidemux-cli-git'
         )
pkgver=2.6.12.160730.680adad
pkgrel=1
pkgdesc="A graphical/cli tool to edit video (filter/re-encode/split). (GIT version)"
arch=('i686' 'x86_64')
url='http://www.avidemux.org'
license=('GPL2')
makedepends=('git'
             'cmake'
             'subversion'
             'yasm'
             'aften'
             'dcaenc'
             'faac'
             'faad2'
             'fribidi'
             'jack2'
             'lame'
             'libdca'
             'libpulse'
             'libva'
             'libvpx'
             'libx264'
             'opencore-amr'
             'twolame'
             'xvidcore'
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
        'fix_nvenc_check.patch'
        'add_settings_pluginui_message_error.patch'
        'fix_vf_hflip_plugin_name.patch'
        )
sha1sums=('SKIP'
          '4b61f11627278578a180d4bdc3b6100544107f32'
          '19bcbe1c3aa6df8fdee2d10ecb9626b46de00175'
          '4162d53297ec9d77633723ae911c605d8fdca3f1'
          '54ffd680b4a18a945f8a03c650abbccb48952d70'
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

  cd avidemux
  # http://avidemux.org/smuf/index.php/topic,16302.msg71463.html#msg71463
  patch -p1 -i "${srcdir}/fix_vf_hflip_plugin_name.patch"

  # http://avidemux.org/smif/index.php/topic,16301.0.html
  patch -p1 -i "${srcdir}/fix_verbose.patch"

  # http://avidemux.org/smif/index.php/topic,16451.0.html
  #patch --binary -p1 -i "${srcdir}/fix_nvenc_check.patch"

  # add SETTINGS to MESSAGE(FATAL_ERROR in avidemux_plugins/CMakeLists.txt
  patch -p1 -i "${srcdir}/add_settings_pluginui_message_error.patch"
}

build() {
  msg2 "Build Core Libs"
  cd "${srcdir}/build_core"
  cmake ../avidemux/avidemux_core \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFAKEROOT="${srcdir}/fakeroot" \
    -DAVIDEMUX_SOURCE_DIR="${srcdir}/avidemux"
  make -j1
  make DESTDIR="${srcdir}/fakeroot" install

  msg2 "Build Common Plugins"
  cd "${srcdir}/build_core_plugins"
  cmake ../avidemux/avidemux_plugins \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPLUGIN_UI=COMMON \
    -DQTSCRIPT=OFF \
    -DFAKEROOT="${srcdir}/fakeroot" \
    -DAVIDEMUX_SOURCE_DIR="${srcdir}/avidemux"
  make
  make DESTDIR="${srcdir}/fakeroot" install

  msg2 "Build Qt GUI"
  cd "${srcdir}/build_qt"
  cmake ../avidemux/avidemux/qt4 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_QT5=ON \
    -DFAKEROOT="${srcdir}/fakeroot" \
    -DAVIDEMUX_SOURCE_DIR="${srcdir}/avidemux"
  make
  make DESTDIR="${srcdir}/fakeroot" install

  msg2 "Build Qt GUI Plugins"
  cd ${srcdir}/build_qt_plugins
  cmake ../avidemux/avidemux_plugins \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_QT5=ON \
    -DPLUGIN_UI=QT4 \
    -DFAKEROOT="${srcdir}/fakeroot" \
    -DAVIDEMUX_SOURCE_DIR="${srcdir}/avidemux"
  make
  make DESTDIR="${srcdir}/fakeroot" install

  msg2 "Build CLI frontend"
  cd "${srcdir}/build_cli"
  cmake ../avidemux/avidemux/cli \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFAKEROOT="${srcdir}/fakeroot" \
    -DAVIDEMUX_SOURCE_DIR="${srcdir}/avidemux"
  make
  make DESTDIR="${srcdir}/fakeroot" install

  msg2 "Build CLI plugins"
  cd "${srcdir}/build_cli_plugins"
  cmake ../avidemux/avidemux_plugins \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPLUGIN_UI=CLI \
    -DFAKEROOT="${srcdir}/fakeroot" \
    -DAVIDEMUX_SOURCE_DIR="${srcdir}/avidemux"
  make
  make DESTDIR="${srcdir}/fakeroot" install

  msg2 "Build Settings"
  cd "${srcdir}/build_core_plugins_settings"
  cmake ../avidemux/avidemux_plugins \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr  \
    -DPLUGIN_UI=SETTINGS \
    -DFAKEROOT="${srcdir}/fakeroot" \
    -DAVIDEMUX_SOURCE_DIR="${srcdir}/avidemux"
  make
  make DESTDIR="${srcdir}/fakeroot" install
}

package_avidemux-core-git() {
  pkgdesc="Core libs for Avidemux. (GIT version)"
  depends=('aften'
           'dcaenc'
           'faac'
           'faad2'
           'fribidi'
           'jack2'
           'lame'
           'libdca'
           'libpulse'
           'libva'
           'libvpx'
           'opencore-amr'
           'twolame'
           'xvidcore'
           'sqlite'
           'libx264'
           'x265'
           )
  optdepends=('avidemux-qt-git: a Qt GUI for Avidemux'
              'avidemux-cli-git: a CLI frontend for Avidemux'
              'wine: AVSload (Load Avisynth scripts on Avidemux)'
              'vapoursynth: vsProxy (Load Vapoursynth scripts on Avidemux')
  provides=("avidemux-core-git=${pkgver}" 'avidemux-core')
  conflicts=('avidemux-core')

  make -C build_core DESTDIR="${pkgdir}" install
  make -C build_core_plugins DESTDIR="${pkgdir}" install
  make -C build_core_plugins_settings DESTDIR="${pkgdir}" install

  install -Dm755 fakeroot/usr/lib/ADM_plugins6/videoEncoders/libADM_ve_x264_other.so "${pkgdir}/usr/lib/ADM_plugins6/videoEncoders/libADM_ve_x264_other.so"
  install -Dm755 fakeroot/usr/lib/ADM_plugins6/videoEncoders/libADM_ve_x265_other.so "${pkgdir}/usr/lib/ADM_plugins6/videoEncoders/libADM_ve_x265_other.so"
}

package_avidemux-qt-git() {
  pkgdesc="Qt GUI for Avidemux. (GIT version)"
  depends=("avidemux-core-git=${pkgver}"
           'qt5-script'
           'libxv'
           'glu'
           'desktop-file-utils'
           )
  provides=('avidemux-qt')
  conflicts=('avidemux-qt4' 'avidemux-qt5' 'avidemux-qt')

  make -C build_qt DESTDIR="${pkgdir}" install
  make -C build_qt_plugins DESTDIR="${pkgdir}" install

  install -Dm644 avidemux/avidemux2.desktop "${pkgdir}/usr/share/applications/avidemux-qt.desktop"
  sed -e 's|Icon=avidemux|Icon=avidemux-qt|g' \
      -e 's|Exec=avidemux2_gtk|Exec=avidemux3_qt5|g' \
      -e 's|Name=avidemux2|Name=Avidemux Qt|' \
      -i "${pkgdir}/usr/share/applications/avidemux-qt.desktop"
  install -Dm644 avidemux/avidemux_icon.png "${pkgdir}/usr/share/pixmaps/avidemux-qt.png"
}

package_avidemux-cli-git() {
  pkgdesc="CLI frontend for Avidemux. (GIT version)"
  depends=("avidemux-core-git=${pkgver}")
  provides=('avidemux-cli')
  conflicts=('avidemux-cli')

  make -C build_cli DESTDIR="${pkgdir}" install
  make -C build_cli_plugins DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/lib/ADM_plugins6/videoEncoders/"
}
