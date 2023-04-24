# Maintainer: drommer <drommer.94@yahoo.com>
# Contributor: evorster <evorster@gmail.com>
# Contributor: osch <oliver@luced.de>

pkgname=audacity-3.1-wxgtk2
pkgver=3.1.3
pkgrel=1
pkgdesc="Free, open source multi-track audio editor and recorder (installed to /opt)"
arch=('x86_64')
url="https://audacityteam.org"
license=('GPL2' 'CCPL')
groups=('pro-audio')
depends=('libmad' 'libid3tag' 'gtk2' 'glib2' 'soundtouch' 'ffmpeg' 'vamp-plugin-sdk'
'portsmf' 'portmidi' 'twolame' 'suil' 'lilv' 'lv2' 'serd' 'sord' 'sratom' 'python'
'flac' 'libvorbis' 'libogg' 'vamp-plugin-sdk' 'portaudio' 'libsoxr' 'libsndfile' 'lame'
'expat' 'alsa-lib' 'jack' 'util-linux' 'util-linux-libs' 'curl' 'zlib')
makedepends=('cmake' 'autoconf' 'automake' 'libtool' 'git' 'conan1')
source=("https://github.com/audacity/audacity/archive/Audacity-${pkgver}.tar.gz")
sha256sums=('07aed333a20b8df381d5c0a167840883fff8ef65f5e5f71e654c0925d6c60de8')

prepare() {
  cd "audacity-Audacity-${pkgver}"
  sed -i -e '/#include <iterator>/i #include <limits>' libraries/lib-utility/MemoryX.h
  sed -i 's/#THEME_PREFS/THEME_PREFS/g' src/Experimental.cmake
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

  export CFLAGS+=" -DNDEBUG"
  export CXXFLAGS+=" -DNDEBUG"

  cmake -G "Unix Makefiles" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/audacity-3.1 \
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

  mv -f ${pkgdir}/opt/audacity-3.1/lib/audacity/* -t ${pkgdir}/opt/audacity-3.1/lib
  mv -f ${pkgdir}/opt/audacity-3.1/share/audacity/* -t ${pkgdir}/opt/audacity-3.1/share

  install -Dm755 ${pkgdir}/opt/audacity-3.1/audacity ${pkgdir}/usr/bin/audacity-3.1
  install -Dm644 ${pkgdir}/opt/audacity-3.1/share/applications/audacity.desktop ${pkgdir}/usr/share/applications/audacity-3.1.desktop
  install -Dm644 ${pkgdir}/opt/audacity-3.1/share/doc/audacity/* -t ${pkgdir}/usr/share/doc/audacity-3.1
  install -Dm644 ${pkgdir}/opt/audacity-3.1/share/icons/hicolor/scalable/apps/audacity.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/audacity-3.1.svg
  install -Dm644 ${pkgdir}/opt/audacity-3.1/share/man/man1/audacity.1 ${pkgdir}/usr/share/man/man1/audacity-3.1.1

  for res in 16 22 24 32 48; do
    install -Dm644 ${pkgdir}/opt/audacity-3.1/share/icons/hicolor/${res}x${res}/audacity.png ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/audacity-3.1.png
  done

  sed -i 's|\${0%/\*}|/opt/audacity-3.1|g' ${pkgdir}/usr/bin/audacity-3.1
  sed -i 's|lib/audacity|lib|' ${pkgdir}/usr/bin/audacity-3.1
  sed -i 's|share/audacity|share|' ${pkgdir}/usr/bin/audacity-3.1
  sed -i 's|audacity|audacity-3.1|g' ${pkgdir}/usr/share/applications/audacity-3.1.desktop

  rm -rf ${pkgdir}/opt/audacity-3.1/{audacity,lib/audacity,share/{applications,audacity,doc,icons,man,metainfo,mime,pixmaps}}

  # Uncomment next line if you want to use two different versions of Audacity simultaneously with separate settings
  #mkdir -p -m 777 "${pkgdir}/opt/audacity-3.1/bin/Portable Settings"
}
