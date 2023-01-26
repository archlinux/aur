# Maintainer: Clemmitt Sigler <cmsigler.online@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Cristian Maureira <saint@archlinux.cl>
# Contributor: Dr.Egg <rwhite@archlinux.us>

pkgname=musescore3
pkgver=3.6.2
pkgrel=2
pkgdesc='Create, play and print beautiful sheet music -- Version 3; End-of-life'
arch=(x86_64)
url=https://musescore.org/
license=(GPL)
groups=(pro-audio)
depends=(
  alsa-lib
  freetype2
  libpulse
  libsndfile
  libvorbisfile.so
  libportaudio.so
  libportmidi.so
  qt5-base
  qt5-declarative
  qt5-graphicaleffects
  qt5-quickcontrols
  qt5-quickcontrols2
  qt5-svg
  qt5-tools
  qt5-xmlpatterns
  zlib
)
makedepends=(
  cmake
  doxygen
  git
  lame
  texlive-core
)
optdepends=('lame: MP3 export')
provides=('musescore=3.6.2')
_tag=3224f342d12f4af8ea782e929c49f5ce85f97da6
source=("git+https://github.com/musescore/MuseScore.git#tag=${_tag}"
        'icons-cpp.patch'
        'logindialog-ui.patch'
        'musescore-cpp.patch'
        'newwizard-cpp.patch'
        'mscore3-desktop.patch'
        'org-musescore-MuseScore3-appdata-xml.patch')
sha256sums=(SKIP
            '4dbd0a685b2efc76ff9ec62dc08744ef706aeddeb3202e8a3ef1c10ef6745bbb'
            '4e2b0a0cf88b96403e1403bb3c03eb679aaa9bd8af898d48da911dbb38237e64'
            '032070fcd9725bc10fb056bbe6bf4cd88aeedc1a30fadaadf67a0e137cbefff1'
            '614f0be56acbc1039b9ce1b37922ebf476b953c632538de7dd94e28fbce95cd2'
            '699f1ad0eb8dcc4979e1b88101ed9c4c7cea38a61a2a1b3ca21681b40db82a0b'
            '1d4f34815968e8efd28bef961a72871c617348c256b07be050a1d7f1b91b8307')

prepare() {
  cd MuseScore
  git cherry-pick -n 63d8b7ee90e9ec6604e334a3ebb12fced7fab36d
  # Adapt mscore/musescore to eliminate conflicts with ver. 4
  patch -Np1 -i "${srcdir}/icons-cpp.patch"
  patch -Np1 -i "${srcdir}/logindialog-ui.patch"
  patch -Np1 -i "${srcdir}/musescore-cpp.patch"
  patch -Np1 -i "${srcdir}/newwizard-cpp.patch"
}

pkgver() {
  cd MuseScore
  git describe --tags | sed 's/^v//'
}

build() {
  cmake -S MuseScore -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS_RELEASE="$CFLAGS" \
    -DCMAKE_CXX_FLAGS_RELEASE="$CXXFLAGS" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_CRASH_REPORTER=OFF \
    -DBUILD_TELEMETRY_MODULE=OFF \
    -DBUILD_WEBENGINE=OFF \
    -DDOWNLOAD_SOUNDFONT=OFF \
    -DMUSESCORE_BUILD_CONFIG=release \
    -DMUSESCORE_REVISION=$(git rev-parse --short=7 HEAD) \
    -DPACKAGE_FILE_ASSOCIATION=ON \
    -DUSE_SYSTEM_FREETYPE=ON \
    -Wno-dev
  make -j1 lrelease manpages -C build;
  make -C build;
}

package() {
  # Adapt mscore/musescore to eliminate conflicts with ver. 4
  patch -Np0 -i "${srcdir}/mscore3-desktop.patch"
  patch -Np0 -i "${srcdir}/org-musescore-MuseScore3-appdata-xml.patch"
  #
  make DESTDIR="${pkgdir}" install -C build
  #
  mv -f "${pkgdir}/usr/bin/mscore" "${pkgdir}/usr/bin/mscore3"
  rm -f "${pkgdir}/usr/bin/musescore"
  ln -s mscore3 "${pkgdir}/usr/bin/musescore3"
  #
  mv -f "${pkgdir}/usr/share/applications/mscore.desktop" "${pkgdir}/usr/share/applications/mscore3.desktop"
  #
  mv -f "${pkgdir}/usr/share/man/man1/mscore.1.gz" "${pkgdir}/usr/share/man/man1/mscore3.1.gz"
  rm -f "${pkgdir}/usr/share/man/man1/musescore.1.gz"
  ln -s mscore3.1.gz "${pkgdir}/usr/share/man/man1/musescore3.1.gz"
  #
  for icondir in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 512x512; do
    mv -f "${pkgdir}/usr/share/icons/hicolor/${icondir}/apps/mscore.png" \
          "${pkgdir}/usr/share/icons/hicolor/${icondir}/apps/mscore3.png"
  done
  mv -f "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mscore.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mscore3.svg"
  #
  mv -f "${pkgdir}/usr/share/metainfo/org.musescore.MuseScore.appdata.xml" \
        "${pkgdir}/usr/share/metainfo/org.musescore.MuseScore3.appdata.xml"
  mv -f "${pkgdir}/usr/share/mime/packages/musescore.xml" \
        "${pkgdir}/usr/share/mime/packages/musescore3.xml"
}

# vim: ts=2 sw=2 et:
