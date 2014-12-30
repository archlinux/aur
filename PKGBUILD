# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

makedepends=('git' 'cmake' 'subversion' 'yasm' 'aften' 'dcaenc' 'faac' 'faad2' 'fribidi' 'jack2' 'lame' 'libdca' 'libpulse' 'libva'
             'libvpx' 'libx264' 'opencore-amr' 'twolame' 'xvidcore' 'x265' 'sqlite'
             'qt4' 'glu'
             'qt5-script' 'qt5-tools' 'libxv') #'gtk3'
pkgbase=avidemux-git
pkgname=('avidemux-core-git' 'avidemux-qt4-git' 'avidemux-qt5-git' 'avidemux-cli-git') #avidemux-gtk-git
pkgver=2.6.10.150607.4c23a42c229
pkgrel=1
pkgdesc="A graphical/cli tool to edit video (filter/re-encode/split). (GIT version)"
url="http://www.avidemux.org/"
license=('GPL2')
arch=('i686' 'x86_64')
source=('avidemux::git+https://github.com/mean00/avidemux2.git')
sha1sums=('SKIP')

pkgver() {
  cd avidemux
  _ver="$(cat cmake/avidemuxVersion.cmake | grep -e CPACK_PACKAGE_VERSION_MAJOR -e CPACK_PACKAGE_VERSION_MINOR -e CPACK_PACKAGE_VERSION_P| head -n3 | cut -d '"' -f2)"
  echo "$(echo ${_ver} | tr ' ' .).$(date -u +%g%m%d).$(git log --format=oneline -1 | head -c 11)"
}

prepare() {
  mkdir -p build_core{,_plugins,_plugins_settings}
  mkdir -p build_qt4{,_plugins}
  mkdir -p build_qt5{,_plugins}
#   mkdir -p build_gtk{,_plugins}
  mkdir -p build_cli{,_plugins}

  # http://avidemux.org/smuf/index.php/topic,16302.msg71463.html#msg71463
  sed 's|hf_hflip|vf_hflip|g' -i avidemux/avidemux_plugins/ADM_videoFilters6/horizontalFlip/CMakeLists.txt
}

build() {
  msg2 "Build Core Libs"
  cd "${srcdir}/build_core"
  cmake ../avidemux/avidemux_core \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFAKEROOT="${srcdir}/fakeroot" \
    -DVERBOSE=
  make VERBOSE= -j1
  make VERBOSE= DESTDIR="${srcdir}/fakeroot" install

  msg2 "Build Common Plugins"
  cd "${srcdir}/build_core_plugins"
  cmake ../avidemux/avidemux_plugins \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPLUGIN_UI=COMMON \
    -DQTSCRIPT=OFF \
    -DFAKEROOT="${srcdir}/fakeroot" \
    -DAVIDEMUX_SOURCE_DIR="${srcdir}/avidemux" \
    -DVERBOSE=
  make VERBOSE=
  make VERBOSE= DESTDIR="${srcdir}/fakeroot" install

  msg2 "Build Qt4 GUI"
  cd "${srcdir}/build_qt4"
  cmake ../avidemux/avidemux/qt4 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFAKEROOT="${srcdir}/fakeroot" \
    -DVERBOSE=
  make VERBOSE=
  make VERBOSE= DESTDIR="${srcdir}/fakeroot" install

  msg2 "Build Qt4 GUI Plugins"
  cd "${srcdir}/build_qt4_plugins"
  cmake ../avidemux/avidemux_plugins \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPLUGIN_UI=QT4 \
    -DFAKEROOT="${srcdir}/fakeroot" \
    -DAVIDEMUX_SOURCE_DIR="${srcdir}/avidemux" \
    -DVERBOSE=
  make VERBOSE=
  make VERBOSE= DESTDIR="${srcdir}/fakeroot" install

  msg2 "Build Qt5 GUI"
  cd "${srcdir}/build_qt5"
  cmake ../avidemux/avidemux/qt4 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_QT5=ON \
    -DFAKEROOT="${srcdir}/fakeroot" \
    -DVERBOSE=
  make VERBOSE=
  make VERBOSE= DESTDIR="${srcdir}/fakeroot" install

  msg2 "Build Qt5 GUI Plugins"
  cd ${srcdir}/build_qt5_plugins
  cmake "../avidemux/avidemux_plugins" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_QT5=ON \
    -DPLUGIN_UI=QT4 \
    -DQT_LRELEASE_EXECUTABLE=/usr/bin/lrelease-qt5 \
    -DFAKEROOT="${srcdir}/fakeroot" \
    -DAVIDEMUX_SOURCE_DIR="${srcdir}/avidemux" \
    -DVERBOSE=
  make VERBOSE=
  make VERBOSE= DESTDIR="${srcdir}/fakeroot" install

#
#   msg2 "Build Gtk GUI"
#   cd "${srcdir}/build_gtk"
#   cmake ../avidemux/avidemux/gtk \
#     -DCMAKE_BUILD_TYPE=Release \
#     -DCMAKE_INSTALL_PREFIX=/usr \
#     -DFAKEROOT="${srcdir}/fakeroot" \
#     -DVERBOSE=
#   make VERBOSE=
#   make VERBOSE= DESTDIR="${srcdir}/fakeroot" install
#
#   msg2 "Build Gtk GUI plugins"
#   cd ${srcdir}/build_gtk_plugins
#   cmake "../avidemux/avidemux_plugins" \
#     -DCMAKE_BUILD_TYPE=Release \
#     -DCMAKE_INSTALL_PREFIX=/usr \
#     -DPLUGIN_UI=GTK \
#     -DFAKEROOT="${srcdir}/fakeroot" \
#     -DAVIDEMUX_SOURCE_DIR="${srcdir}/avidemux" \
#     -DVERBOSE=
#   make VERBOSE=
#   make VERBOSE= DESTDIR="${srcdir}/fakeroot" install

  msg2 "Build CLI frontend"
  cd "${srcdir}/build_cli"
  cmake ../avidemux/avidemux/cli \
    -DFAKEROOT="${srcdir}/fakeroot" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DVERBOSE=
  make VERBOSE=
  make VERBOSE= DESTDIR="${srcdir}/fakeroot" install

  msg2 "Build CLI plugins"
  cd "${srcdir}/build_cli_plugins"
  cmake ../avidemux/avidemux_plugins \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPLUGIN_UI=CLI \
    -DFAKEROOT="${srcdir}/fakeroot" \
    -DAVIDEMUX_SOURCE_DIR="${srcdir}/avidemux" \
    -DVERBOSE=
  make VERBOSE=
  make VERBOSE= DESTDIR="${srcdir}/fakeroot" install

  msg2 "Build Settings"
  cd "${srcdir}/build_core_plugins_settings"
  cmake ../avidemux/avidemux_plugins \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr  \
    -DFAKEROOT="${srcdir}/fakeroot" \
    -DAVIDEMUX_SOURCE_DIR="${srcdir}/avidemux" \
    -DPLUGIN_UI=SETTINGS \
    -DVERBOSE=
  make VERBOSE=
  make VERBOSE= DESTDIR="${srcdir}/fakeroot" install
}

package_avidemux-core-git() {
  depends=('aften' 'dcaenc' 'faac' 'faad2' 'fribidi' 'jack2' 'lame' 'libdca' 'libpulse' 'libva' 'libvpx'  'opencore-amr' 'twolame' 'xvidcore' 'sqlite' 'libx264' 'x265')
  pkgdesc="Core libs for Avidemux. (GIT version)"
  provides=("avidemux-core-git=${pkgver}" 'avidemux-core')
  optdepends=('avidemux-qt4-git: a Qt4 GUI for Avidemux. (GIT Version) (install from "avidemux-git" package)'
              'avidemux-qt5-git: a Qt5 GUI for Avidemux. (GIT Version) (install from "avidemux-git" package)'
              'avidemux-gtk-git: a Gtk3 GUI for Avidemux. (GIT Version) (install from "avidemux-git" package)'
              'avidemux-cli-git: a CLI frontend for Avidemux. (GIT Version) (install from "avidemux-git" package)'
              'wine: AVSload')

  make VERBOSE= -C build_core DESTDIR="${pkgdir}" install
  make VERBOSE= -C build_core_plugins DESTDIR="${pkgdir}" install
  make VERBOSE= -C build_core_plugins_settings DESTDIR="${pkgdir}" install

  for i in 4 5; do
    if [ -f fakeroot/usr/lib/ADM_plugins6/videoEncoders/libADM_ve_x26${i}_other.so ]; then
      install -Dm755 fakeroot/usr/lib/ADM_plugins6/videoEncoders/libADM_ve_x26${i}_other.so "${pkgdir}/usr/lib/ADM_plugins6/videoEncoders/libADM_ve_x26${i}_other.so"
    fi
  done
}

package_avidemux-qt4-git() {
  depends=("avidemux-core-git=${pkgver}" 'qt4' 'glu' 'libx264' 'x265')
  pkgdesc="Qt4 GUI for Avidemux. (GIT version)"
  provides=("avidemux-qt4-git=${pkgver}")
  conflicts=('avidemux-qt4')
  install=avidemux.install

  make VERBOSE= -C build_qt4 DESTDIR="${pkgdir}" install
  make VERBOSE= -C build_qt4_plugins DESTDIR="${pkgdir}" install

  install -Dm644 avidemux/avidemux2.desktop "${pkgdir}/usr/share/applications/avidemux-qt4.desktop"
  sed -e 's|Icon=avidemux|Icon=avidemux-qt4|g' \
      -e 's|Exec=avidemux2_gtk|Exec=avidemux3_qt4|g' \
      -e 's|Name=avidemux2|Name=Avidemux Qt4|' \
      -i "${pkgdir}/usr/share/applications/avidemux-qt4.desktop"
  install -Dm644 avidemux/avidemux_icon.png "${pkgdir}/usr/share/pixmaps/avidemux-qt4.png"
}

package_avidemux-qt5-git() {
  depends=("avidemux-core-git=${pkgver}" 'qt5-script' 'libxv' 'desktop-file-utils' 'libx264' 'x265')
  pkgdesc="Qt5 GUI for Avidemux. (GIT version)"
  provides=("avidemux-qt5-git=${pkgver}")
  conflicts=('avidemux-qt5')
  install=avidemux.install

  make VERBOSE= -C build_qt5 DESTDIR="${pkgdir}" install
  make VERBOSE= -C build_qt5_plugins DESTDIR="${pkgdir}" install

  install -Dm644 avidemux/avidemux2.desktop "${pkgdir}/usr/share/applications/avidemux-qt5.desktop"
  sed -e 's|Icon=avidemux|Icon=avidemux-qt5|g' \
      -e 's|Exec=avidemux2_gtk|Exec=avidemux3_qt5|g' \
      -e 's|Name=avidemux2|Name=Avidemux Qt5|' \
      -i "${pkgdir}/usr/share/applications/avidemux-qt5.desktop"
  install -Dm644 avidemux/avidemux_icon.png "${pkgdir}/usr/share/pixmaps/avidemux-qt5.png"
}

# package_avidemux-gtk-git() {
#   depends=("avidemux-core-git=${pkgver}" 'gtk3' 'libxv' 'sdl' 'desktop-file-utils')
#   pkgdesc="Gtk3 GUI for Avidemux. (GIT version)"
#   provides=("avidemux-gtk-git=${pkgver}" 'avidemux-gtk')
#   conflicts=('avidemux-gtk')
#   install=avidemux.install
#
#   make VERBOSE= -C build_gtk DESTDIR="${pkgdir}" install
#   make VERBOSE= -C build_gtk_plugins DESTDIR="${pkgdir}" install
#
#   install -Dm644 avidemux/avidemux2.desktop "${pkgdir}/usr/share/applications/avidemux-gtk.desktop"
#   sed -e 's|Icon=avidemux|Icon=avidemux-gtk|g' \
#       -e 's|Exec=avidemux2_gtk|Exec=avidemux3_gtk|g' \
#       -e 's|Name=avidemux2|Name=Avidemux Gtk|' \
#       -i "${pkgdir}/usr/share/applications/avidemux-gtk.desktop"
#   install -Dm644 avidemux/avidemux_icon.png "${pkgdir}/usr/share/pixmaps/avidemux-gtk.png"
#
#   rm -fr "${pkgdir}/usr/lib/ADM_plugins6/videoEncoders/"
# }

package_avidemux-cli-git() {
  depends=("avidemux-core-git=${pkgver}")
  pkgdesc="CLI frontend for Avidemux. (GIT version)"
  provides=("avidemux-cli-git=${pkgver}" 'avidemux-cli')
  conflicts=('avidemux-cli')

  make VERBOSE= -C build_cli DESTDIR="${pkgdir}" install
  make VERBOSE= -C build_cli_plugins DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/lib/ADM_plugins6/videoEncoders/"
}
