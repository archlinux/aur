# Maintainer: Dmitry Lyashuk <lyashuk.voxx at gmail dot com>
pkgname=doom2df-bin
pkgver=0.667
pkgrel=1
pkgdesc="Doom-themed platformer with network play (binaries-only)"
arch=(x86_64 i686)
url="https://doom2d.org/"
license=('GPL3')
group=(doom2df-full)
depends=(doom2df-res sdl2_mixer sdl2 enet libgl)
makedepends=(git fpc)
optdepends=('doom2df-editor: map editor for game')
provides=(doom2df)
conflicts=(doom2df-git doom2df-bin-git)
source=(
  'git://repo.or.cz/d2df-sdl.git'
  'doom2df.desktop'
  'doom2df.png'
  'd2df.1.gz'
)
noextract=(
  'd2df.1.gz'
)
md5sums=(
  'SKIP'
  'a529aca738b79f2099fcef6e583fbed3'
  '191cd29a6994ab257abf6c0b1060b2fd'
  '5542f6420d4a17f3c5059989dfcc65f3'
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
  
  cd "src/game"
  
  # First - main graphical binary
  fpc -g -gl -FU../../tmp -dUSE_SDL2 -dUSE_OPENGL -dUSE_SDLMIXER Doom2DF.lpr
  
  # Clearing tmp
  rm -r ../../tmp && mkdir ../../tmp

  # Second - headless binary (for dedicated server)
  fpc -g -gl -FU../../tmp -dUSE_SYSSTUB -dUSE_SDLMIXER -dHEADLESS -oDoom2DF_H Doom2DF.lpr
  
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
}
