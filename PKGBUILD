# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=avidemux-git
pkgname=(
  'avidemux-core-git'
  'avidemux-qt5-git'
  'avidemux-qt6-git'
  'avidemux-cli-git'
)
pkgver=2.8.2.240125.cdbfa6956
pkgrel=1
pkgdesc="A graphical/cli tool to edit video (filter/re-encode/split). (GIT version)"
arch=('x86_64')
url='http://www.avidemux.org'
license=('GPL2')
makedepends=(
  'git'
  'cmake'
  'yasm'
  'nasm'
  'aom'
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
  'libmp4v2'
  'libdca'
  'libpulse'
  'libva'
  'libvdpau'
  'libvpx'
  'libvorbis'
  'opencore-amr'
  'twolame'
  'xvidcore'
  'x264'
  'x265'
  'sqlite'
  'glu'
  'qt5-script'
  'qt5-tools'
  'qt6-base'
  'qt6-tools'
  'libxv'
  'vapoursynth'
  'hicolor-icon-theme'
  'setconf'
)
source=(
  'avidemux::git+https://github.com/mean00/avidemux2.git'
  'git+https://github.com/mean00/avidemux2_i18n.git'
  'fix_verbose.patch'
  'add_settings_pluginui_message_error.patch'
  'opus_check.patch'
  'fix_mpeg-ts_typo.patch'
  'fix_ugly_slider.patch'
)
sha256sums=(
  'SKIP'
  'SKIP'
  '4f751cbb3a65f904f7c0ad68473880e2a9edcda332a293e20ad238280ec52884'
  'c5b5d3d7bcdf4c588a780c12fdac7791ddb0527db438c85b4c1c078507da2f0b'
  'ae6d2c93163b7b760591688c7811dfdd4a952ed9074d8cbdf4953b701f0fa7db'
  'a11452a93c993bdf71f0c29d686badec1c50231bc9d3c6f02f280e06cd8add7a'
  '3c91ddefadfad5f43d514941ddfa1942ea2c618525aaae36bde5a5d18f8e2067'
)

options=('debug')

pkgver() {
  cd avidemux
  _ver="$(cat cmake/avidemuxVersion.cmake | grep -m3 -e CPACK_PACKAGE_VERSION_MAJOR -e CPACK_PACKAGE_VERSION_MINOR -e CPACK_PACKAGE_VERSION_P | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo -e "${_ver}.$(date -u +%g%m%d).$(git rev-parse --short HEAD | head -c 11)"
}

prepare() {
  cd avidemux

  git config submodule.i18n.url "${srcdir}/avidemux2_i18n"
  git -c protocol.file.allow=always submodule update --init \
    avidemux/qt4/i18n

  # http://avidemux.org/smif/index.php/topic,16301.0.html
  patch -p1 -i "${srcdir}/fix_verbose.patch"

  # add SETTINGS to MESSAGE(FATAL_ERROR in avidemux_plugins/CMakeLists.txt
  patch -p1 -i "${srcdir}/add_settings_pluginui_message_error.patch"

  # Fix Typo 'Mpeg TS' -> 'Mpeg-TS'
  patch -p1 -i "${srcdir}/fix_mpeg-ts_typo.patch"

  # fix ugly slider(?)
  patch -p1 -i "${srcdir}/fix_ugly_slider.patch"

  # Cosmetic opus check thing
  patch --binary -p1 -i "${srcdir}/opus_check.patch"
}

build() {
  msg2 "Build Core Libs"
  cmake -B build_core -S avidemux/avidemux_core \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFAKEROOT="${srcdir}/fakeroot" \
    -DAVIDEMUX_SOURCE_DIR="${srcdir}/avidemux"

  cmake --build build_core
  DESTDIR="${srcdir}/fakeroot" cmake --install build_core

  msg2 "Build Core Plugins"
  cmake -B build_core_plugins -S avidemux/avidemux_plugins \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPLUGIN_UI=COMMON \
    -DUSE_EXTERNAL_LIBA52=ON \
    -DUSE_EXTERNAL_LIBASS=ON \
    -DUSE_EXTERNAL_LIBMAD=ON \
    -DUSE_EXTERNAL_MP4V2=ON \
    -DFAKEROOT="${srcdir}/fakeroot"

  cmake --build build_core_plugins
  DESTDIR="${srcdir}/fakeroot" cmake --install build_core_plugins

  msg2 "Build Qt5 GUI"
  cmake -B build_qt5 -S avidemux/avidemux/qt4 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DENABLE_QT5=ON \
    -DFAKEROOT="${srcdir}/fakeroot"

  cmake --build build_qt5
  DESTDIR="${srcdir}/fakeroot" cmake --install build_qt5

  msg2 "Build Qt5 GUI Plugins"
  cmake -B build_qt5_plugins -S avidemux/avidemux_plugins \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DENABLE_QT5=ON \
    -DPLUGIN_UI=QT4 \
    -DUSE_EXTERNAL_LIBA52=ON \
    -DUSE_EXTERNAL_LIBASS=ON \
    -DUSE_EXTERNAL_LIBMAD=ON \
    -DUSE_EXTERNAL_MP4V2=ON \
    -DFAKEROOT="${srcdir}/fakeroot"

  cmake --build build_qt5_plugins
  DESTDIR="${srcdir}/fakeroot" cmake --install build_qt5_plugins

  msg2 "Build Qt6 GUI"
  CXXFLAGS+=" -fPIC" \
  cmake -B build_qt6 -S avidemux/avidemux/qt4 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DENABLE_QT6=ON \
    -DFAKEROOT="${srcdir}/fakeroot"

  cmake --build build_qt6
  DESTDIR="${srcdir}/fakeroot" cmake --install build_qt6

  msg2 "Build Qt6 GUI Plugins"
  CXXFLAGS+=" -fPIC" \
  cmake -B build_qt6_plugins -S avidemux/avidemux_plugins \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DENABLE_QT6=ON \
    -DPLUGIN_UI=QT4 \
    -DUSE_EXTERNAL_LIBA52=ON \
    -DUSE_EXTERNAL_LIBASS=ON \
    -DUSE_EXTERNAL_LIBMAD=ON \
    -DUSE_EXTERNAL_MP4V2=ON \
    -DFAKEROOT="${srcdir}/fakeroot"

  cmake --build build_qt6_plugins
  DESTDIR="${srcdir}/fakeroot" cmake --install build_qt6_plugins

  msg2 "Build CLI frontend"
  cmake -B build_cli -S avidemux/avidemux/cli \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFAKEROOT="${srcdir}/fakeroot"

  cmake --build build_cli
  DESTDIR="${srcdir}/fakeroot" cmake --install build_cli

  msg2 "Build CLI plugins"
  cmake -B build_cli_plugins -S avidemux/avidemux_plugins \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPLUGIN_UI=CLI \
    -DUSE_EXTERNAL_LIBA52=ON \
    -DUSE_EXTERNAL_LIBASS=ON \
    -DUSE_EXTERNAL_LIBMAD=ON \
    -DUSE_EXTERNAL_MP4V2=ON \
    -DFAKEROOT="${srcdir}/fakeroot"

  cmake --build build_cli_plugins
  DESTDIR="${srcdir}/fakeroot" cmake --install build_cli_plugins

  msg2 "Build Settings"
  cmake -B build_core_plugins_settings -S avidemux/avidemux_plugins \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr  \
    -DPLUGIN_UI=SETTINGS \
    -DUSE_EXTERNAL_LIBA52=ON \
    -DUSE_EXTERNAL_LIBASS=ON \
    -DUSE_EXTERNAL_LIBMAD=ON \
    -DUSE_EXTERNAL_MP4V2=ON \
    -DFAKEROOT="${srcdir}/fakeroot"

  cmake --build build_core_plugins_settings
  DESTDIR="${srcdir}/fakeroot" cmake --install build_core_plugins_settings
}

package_avidemux-core-git() {
  pkgdesc="Core libs for Avidemux. (GIT version)"
  depends=(
    'a52dec' # 'liba52.so'
    'alsa-lib' 'libasound.so'
    'aom' 'libaom.so'
    'aften' # 'libaften.so'
    'dcaenc' # 'libdcaenc.so'
    'faac' 'libfaac.so'
    'faad2' 'libfaad.so'
    'gcc-libs' # 'libgcc_s.so' 'libstdc++.so'
    'glibc' # 'libc.so' 'libm.so'
    'fribidi'
    'jack2' 'libjack.so'
    'lame' 'libmp3lame.so'
    'libass' 'libass.so'
    'libfdk-aac' 'libfdk-aac.so'
    'libmad' # 'libmad.so'
    'libmp4v2' # 'libmp4v2.so'
    'libdca' # 'libdca.so'
    'libpulse' 'libpulse.so'
    'libva' 'libva.so' 'libva-drm.so' 'libva-x11.so'
    'libvdpau' 'libvdpau.so'
    'libvpx' 'libvpx.so'
    'libvorbis' 'libvorbis.so' 'libvorbisenc.so'
    'libx11' # 'libX11.so'
    'opencore-amr' 'libopencore-amrnb.so' 'libopencore-amrwb.so'
    'opus' 'libopus.so'
    'sqlite' 'libsqlite3.so'
    'twolame' 'libtwolame.so'
    'xvidcore' 'libxvidcore.so'
    'x264' 'libx264.so'
    'x265' 'libx265.so'
    'zlib' 'libz.so'
  )
  optdepends=(
    'avidemux-qt5-git: a Qt5 GUI for Avidemux'
    'avidemux-qt6-git: a Qt6 GUI for Avidemux'
    'avidemux-cli-git: a CLI frontend for Avidemux'
    'wine: AVSload (Load Avisynth scripts on Avidemux)'
    'vapoursynth: vsProxy (Load Vapoursynth scripts on Avidemux)'
    'cuda: Nvidia hw encoder'
    'libva-intel-driver: Intel hw encoder'
    'libva-mesa-driver: Mesa hw encoder'
  )
  provides=('avidemux-core')
  conflicts=('avidemux-core')

  DESTDIR="${pkgdir}" cmake --install build_core
  DESTDIR="${pkgdir}" cmake --install build_core_plugins
  DESTDIR="${pkgdir}" cmake --install build_core_plugins_settings

  install -Dm755 fakeroot/usr/lib/ADM_plugins6/videoEncoders/libADM_ve_x264_other.so "${pkgdir}/usr/lib/ADM_plugins6/videoEncoders/libADM_ve_x264_other.so"
  install -Dm755 fakeroot/usr/lib/ADM_plugins6/videoEncoders/libADM_ve_x265_other.so "${pkgdir}/usr/lib/ADM_plugins6/videoEncoders/libADM_ve_x265_other.so"
  install -Dm755 fakeroot/usr/lib/ADM_plugins6/shaderDemo/1/zigzag.shader "${pkgdir}/usr/lib/ADM_plugins6/shaderDemo/1/zigzag.shader"
  install -Dm755 fakeroot/usr/lib/ADM_plugins6/shaderDemo/1/ripple.shader "${pkgdir}/usr/lib/ADM_plugins6/shaderDemo/1/ripple.shader"
  install -Dm755 fakeroot/usr/lib/ADM_plugins6/shaderDemo/1/lightning.shader "${pkgdir}/usr/lib/ADM_plugins6/shaderDemo/1/lightning.shader"
  install -Dm755 fakeroot/usr/lib/ADM_plugins6/shaderDemo/1/bump.shader "${pkgdir}/usr/lib/ADM_plugins6/shaderDemo/1/bump.shader"

}

package_avidemux-qt5-git() {
  pkgdesc="Qt5 GUI for Avidemux. (GIT version)"
  depends=(
    "avidemux-core-git=${pkgver}"
    'gcc-libs' # 'libgcc_s.so' 'libstdc++.so'
    'glibc' # 'libc.so' 'libm.so'
    'glu' # 'libGLU.so'
    'libglvnd' 'libOpenGL.so'
    'libx11' # 'libX11.so'
    'libxext' # 'libXext.so'
    'libxv' # 'libXv.so'
    'qt5-base' # 'libQt5Core.so' 'libQt5Gui.so' 'libQt5Network.so' 'libQt5Widgets.so'
    'x264' 'libx264.so'
    'x265' 'libx265.so'
    'hicolor-icon-theme'
  )
  provides=('avidemux-qt5')
  conflicts=(
    'avidemux-qt5'
    'avidemux-qt'
  )
  replaces=('avidemux-qt-git')

  DESTDIR="${pkgdir}" cmake --install build_qt5
  DESTDIR="${pkgdir}" cmake --install build_qt5_plugins

  rm -fr "${pkgdir}/usr/lib/ADM_plugins6/shaderDemo"

  mv "${pkgdir}/usr/share/applications/org.avidemux.Avidemux.desktop" "${pkgdir}/usr/share/applications/org.avidemux.Avidemux_qt5.desktop"
  mv "${pkgdir}/usr/share/icons/hicolor/128x128/apps/org.avidemux.Avidemux.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/org.avidemux.Avidemux_qt5.png"
  mv "${pkgdir}/usr/share/metainfo/org.avidemux.Avidemux.appdata.xml" "${pkgdir}/usr/share/metainfo/org.avidemux.Avidemux_qt5.appdata.xml"

  setconf "${pkgdir}/usr/share/applications/org.avidemux.Avidemux_qt5.desktop" Name="Avidemux Qt5"
  setconf "${pkgdir}/usr/share/applications/org.avidemux.Avidemux_qt5.desktop" Icon=org.avidemux.Avidemux_qt5

  sed -e 's|org.avidemux.Avidemux|&_qt5|g' \
      -e 's|<name>Avidemux|& Qt5|g' \
      -i "${pkgdir}/usr/share/metainfo/org.avidemux.Avidemux_qt5.appdata.xml"
}

package_avidemux-qt6-git() {
  pkgdesc="Qt6 GUI for Avidemux. (GIT version)"
  depends=(
    "avidemux-core-git=${pkgver}"
    'gcc-libs' # 'libgcc_s.so' 'libstdc++.so'
    'glibc' # 'libc.so' 'libm.so'
    'glu' # 'libGLU.so'
    'libglvnd' 'libOpenGL.so'
    'libx11' # 'libX11.so'
    'libxext' # 'libXext.so'
    'libxv' # 'libXv.so'
    'qt6-base' # 'libQt6Core.so' 'libQt6Gui.so' 'libQt6Network.so' 'libQt6OpenGL.so' 'libQt6OpenGLWidgets.so' 'libQt6Widgets.so'
    'x264' 'libx264.so'
    'x265' 'libx265.so'
    'hicolor-icon-theme'
  )
  provides=('avidemux-qt6')
  conflicts=(
    'avidemux-qt6'
    'avidemux-qt'
  )

  DESTDIR="${pkgdir}" cmake --install build_qt6
  DESTDIR="${pkgdir}" cmake --install build_qt6_plugins

  rm -fr "${pkgdir}/usr/lib/ADM_plugins6/shaderDemo"

  mv "${pkgdir}/usr/share/applications/org.avidemux.Avidemux.desktop" "${pkgdir}/usr/share/applications/org.avidemux.Avidemux_qt6.desktop"
  mv "${pkgdir}/usr/share/icons/hicolor/128x128/apps/org.avidemux.Avidemux.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/org.avidemux.Avidemux_qt6.png"
  mv "${pkgdir}/usr/share/metainfo/org.avidemux.Avidemux.appdata.xml" "${pkgdir}/usr/share/metainfo/org.avidemux.Avidemux_qt6.appdata.xml"

  setconf "${pkgdir}/usr/share/applications/org.avidemux.Avidemux_qt6.desktop" Name="Avidemux Qt6"
  setconf "${pkgdir}/usr/share/applications/org.avidemux.Avidemux_qt6.desktop" Icon=org.avidemux.Avidemux_qt6

  sed -e 's|org.avidemux.Avidemux|&_qt6|g' \
      -e 's|<name>Avidemux|& Qt6|g' \
      -i "${pkgdir}/usr/share/metainfo/org.avidemux.Avidemux_qt6.appdata.xml"
  sed 's|qt5|qt6|g' \
    -i "${pkgdir}/usr/share/applications/org.avidemux.Avidemux_qt6.desktop" \
    -i "${pkgdir}/usr/share/metainfo/org.avidemux.Avidemux_qt6.appdata.xml"
}

package_avidemux-cli-git() {
  pkgdesc="CLI frontend for Avidemux. (GIT version)"
  depends=(
    "avidemux-core-git=${pkgver}"
    'gcc-libs' # 'libgcc_s.so' 'libstdc++.so'
    'glibc' # 'libc.so' 'libm.so'
    )
  provides=('avidemux-cli')
  conflicts=('avidemux-cli')

  DESTDIR="${pkgdir}" cmake --install build_cli
  DESTDIR="${pkgdir}" cmake --install build_cli_plugins

  rm -fr "${pkgdir}/usr/lib/ADM_plugins6/videoEncoders"
}
