# Maintainer: evorster <evorster@gmail.com>
# Contributor: osch <oliver@luced.de>
# Contributor: Serhii Starovoitov <drommer.94@gmail.com>

pkgname=audacity-3.1-wxgtk2
pkgver=3.1.3
pkgrel=3
pkgdesc="Free, open source multi-track audio editor and recorder (installed to /opt)"
arch=('x86_64')
url="https://audacityteam.org"
license=('GPL-3.0-or-later')
groups=('pro-audio')
depends=('libmad' 'libid3tag' 'gtk2' 'glib2' 'soundtouch' 'ffmpeg' 'vamp-plugin-sdk'
'portsmf' 'portmidi' 'twolame' 'suil' 'lilv' 'lv2' 'serd' 'sord' 'sratom' 'python'
'flac' 'libvorbis' 'libogg' 'vamp-plugin-sdk' 'portaudio' 'libsoxr' 'libsndfile' 'lame'
'expat' 'alsa-lib' 'jack' 'util-linux' 'util-linux-libs' 'curl' 'zlib')
makedepends=('cmake' 'gcc12' 'gcc12-libs' 'autoconf' 'automake' 'libtool' 'conan1')
source=("https://github.com/audacity/audacity/archive/Audacity-${pkgver}.tar.gz")
sha256sums=('07aed333a20b8df381d5c0a167840883fff8ef65f5e5f71e654c0925d6c60de8')

prepare() {
  cd "audacity-Audacity-${pkgver}"

  sed -i -e '/#include <iterator>/i #include <limits>' libraries/lib-utility/MemoryX.h
  sed -i 's/#THEME_PREFS/THEME_PREFS/g' src/Experimental.cmake
  sed -i 's/%hs/%s/g' locale/*.po

  mkdir -p build
  cd build
  depsDir=$(readlink -f ./.offline)
  export CONAN_USER_HOME="$depsDir/conan"
  conan config home
  conan config init
  conan config set storage.download_cache="$CONAN_USER_HOME/download_cache"
  conan remove "*" --src --builds --force
}

build() {
  cd "audacity-Audacity-${pkgver}"/build

  export CC=/usr/bin/gcc-12
  export CXX=/usr/bin/g++-12
  export CFLAGS+=" -DNDEBUG"
  export CXXFLAGS+=" -DNDEBUG"
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  cmake -G "Unix Makefiles" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/audacity-wxgtk2 \
        -DAUDACITY_BUILD_LEVEL=2 \
        -Daudacity_has_networking=off \
        -Daudacity_lib_preference=system \
        -Daudacity_use_expat=system \
        -Daudacity_use_ffmpeg=loaded \
        -Daudacity_use_zlib=system \
        -Daudacity_use_curl=system \
        -Daudacity_use_wxwidgets=local \
        ..

  make
  conan remove "*" --src --builds --force
}

package() {
  cd "audacity-Audacity-${pkgver}"/build
  make DESTDIR="${pkgdir}" install

  mv -f ${pkgdir}/opt/audacity-wxgtk2/lib/audacity/* -t ${pkgdir}/opt/audacity-wxgtk2/lib
  mv -f ${pkgdir}/opt/audacity-wxgtk2/share/audacity/* -t ${pkgdir}/opt/audacity-wxgtk2/share

  install -Dm755 ${pkgdir}/opt/audacity-wxgtk2/audacity ${pkgdir}/usr/bin/audacity-wxgtk2
  install -Dm644 ${pkgdir}/opt/audacity-wxgtk2/share/applications/audacity.desktop ${pkgdir}/usr/share/applications/audacity-wxgtk2.desktop
  install -Dm644 ${pkgdir}/opt/audacity-wxgtk2/share/doc/audacity/* -t ${pkgdir}/usr/share/doc/audacity-wxgtk2
  install -Dm644 ${pkgdir}/opt/audacity-wxgtk2/share/icons/hicolor/scalable/apps/audacity.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/audacity-wxgtk2.svg
  install -Dm644 ${pkgdir}/opt/audacity-wxgtk2/share/man/man1/audacity.1 ${pkgdir}/usr/share/man/man1/audacity-wxgtk2.1

  for res in 16 22 24 32 48; do
    install -Dm644 ${pkgdir}/opt/audacity-wxgtk2/share/icons/hicolor/${res}x${res}/audacity.png ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/audacity-wxgtk2.png
  done

  sed -i -e 's|\${0%/\*}|/opt/audacity-wxgtk2|g' \
         -e 's|lib/audacity|lib|' \
         -e 's|share/audacity|share|' ${pkgdir}/usr/bin/audacity-wxgtk2
  sed -i 's|audacity|audacity-wxgtk2|g' ${pkgdir}/usr/share/applications/audacity-wxgtk2.desktop

  rm -rf ${pkgdir}/opt/audacity-wxgtk2/{audacity,lib/audacity,share/{applications,audacity,doc,icons,man,metainfo,mime,pixmaps}}

  # Uncomment next line if you want to use two different versions of Audacity simultaneously with separate settings (unsafe)
  #mkdir -p -m 777 "${pkgdir}/opt/audacity-wxgtk2/bin/Portable Settings"
}
