# Maintainer: Dmitry Lyashuk <lyashuk.voxx at gmail dot com>
pkgname=doom2df-bin
pkgver=0.667
pkgrel=10
pkgdesc="Doom-themed platformer with network play (binaries-only)"
arch=(x86_64 i686)
url="https://doom2d.org/"
license=('GPL3')
group=(doom2df-full)
depends=(doom2df-res sdl2 sdl2_mixer enet libgl openal xmp libxmp libvorbis opus opusfile libgme miniupnpc)
makedepends=(git fpc)
optdepends=('doom2df-editor: map editor for game')
provides=(doom2df)
conflicts=(doom2df-git doom2df-bin-git)
source=(
  'git://repo.or.cz/d2df-sdl.git'
  'doom2df.desktop'
  'doom2df.png'
  'd2df.1.gz'
  'd2df.2.gz'
  'd2df.3.gz'
  'd2df.1.ru.gz'
  'd2df.2.ru.gz'
  'd2df.3.ru.gz'
)
noextract=(
  'd2df.1.gz'
  'd2df.2.gz'
  'd2df.3.gz'
  'd2df.1.ru.gz'
  'd2df.2.ru.gz'
  'd2df.3.ru.gz'
)
md5sums=(
  'SKIP'
  'a529aca738b79f2099fcef6e583fbed3'
  '191cd29a6994ab257abf6c0b1060b2fd'
  '9da12c0a777cd8a745b2436369776a02'
  '388ca9f19d43ff9b92194db07ddd6a1e'
  '5f37c2b20c47cff25305f845df60083b'
  '1e7fc56216ab37431ef6e132bc9af63a'
  'f8b3fc396d03a486a849463ebbba2db2'
  '6cfe33776879b82f042a9525fcd893cd'
)
options=(
  !strip
)
install=doom2df-bin.install


prepare(){
  cd "${srcdir}/d2df-sdl"
  
  # Create some environment for build
  mkdir tmp
}


build() {
  # Export environment variable before building
  cd "${srcdir}/d2df-sdl/"
    export D2DF_BUILD_HASH="$(git rev-parse HEAD)"
  git submodule update --init
  
  cd "src/game"
  
  # First - main graphical binary
  fpc -g -gl -FU../../tmp -dUSE_SDL2 -dUSE_OPENGL -dUSE_OPENAL -dUSE_SDL2 -dUSE_VORBIS -dUSE_MODPLUG -dUSE_XMP -dUSE_MPG123 -dUSE_OPUS -dUSE_GME -dUSE_MINIUPNPC Doom2DF.lpr
  
  # Clearing tmp
  rm -r ../../tmp && mkdir ../../tmp

  # Second - headless binary (for dedicated server)
  fpc -g -gl -FU../../tmp -dUSE_SYSSTUB -dUSE_OPENAL -dUSE_SDL2 -dUSE_VORBIS -dUSE_MODPLUG -dUSE_XMP -dUSE_MPG123 -dUSE_OPUS -dUSE_GME -dUSE_MINIUPNPC -dHEADLESS -oDoom2DF_H Doom2DF.lpr
  
  cp Doom2DF ../../../
  cp Doom2DF_H ../../../
}


package() {
  cd "${srcdir}"
  install -Dm755 Doom2DF "${pkgdir}"/usr/bin/Doom2DF
  install -Dm755 Doom2DF_H "${pkgdir}"/usr/bin/Doom2DF_H
  install -Dm644 doom2df.desktop "${pkgdir}"/usr/share/applications/doom2df.desktop
  install -Dm644 doom2df.png "${pkgdir}"/usr/share/pixmaps/doom2df.png
  install -Dm644 d2df.1.gz "${pkgdir}"/usr/share/man/man1/d2df.1.gz
  install -Dm644 d2df.2.gz "${pkgdir}"/usr/share/man/man2/d2df.2.gz
  install -Dm644 d2df.3.gz "${pkgdir}"/usr/share/man/man3/d2df.3.gz
  install -Dm644 d2df.1.ru.gz "${pkgdir}"/usr/share/man/ru/man1/d2df.1.gz
  install -Dm644 d2df.2.ru.gz "${pkgdir}"/usr/share/man/ru/man2/d2df.2.gz
  install -Dm644 d2df.3.ru.gz "${pkgdir}"/usr/share/man/ru/man3/d2df.3.gz
}
