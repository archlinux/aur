pkgname=game_music_emu-kode54-git
pkgver=r193.be0a069
pkgrel=2
pkgdesc="Multi-purpose console music emulator and player library (a.k.a. libgme) (kode54's fork)"
arch=(i686 x86_64)
url='https://bitbucket.org/losnoco/game_music_emu'
license=('LGPL2.1')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'qt5-base')
conflicts=(libgme game_music_emu game_music_emu-kode54)
provides=(libgme game_music_emu game_music_emu-kode54)
source=("${pkgname}::git+https://bitbucket.org/losnoco/game_music_emu.git"
        'File_Extractor::git+https://bitbucket.org/losnoco/file_extractor.git')
sha256sums=('SKIP' 'SKIP')

pkgver() {
   cd "$srcdir/$pkgname"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
   cd "$srcdir/$pkgname"/prj/Game_Music_Emu

   # Call it libgme instead of libGame_Music_Emu.
   sed -i '/^TARGET /s/Game_Music_Emu/gme/' Game_Music_Emu.pro

   # gme/gme.txt identifies this as "0.6.0 Pre-release", generate
   # libgme.so.0.6.0 instead of libgme.so.1.0.0. Especially since libgme.so.0
   # is needed for compatibility with gstreamer0.10-bad-plugins.
   echo 'VERSION=0.6.0' >> Game_Music_Emu.pro

   # The header is already in INCLUDEPATH but the code needs adding to SOURCES.
   echo 'SOURCES += ../../../File_Extractor/fex/Data_Reader.cpp' >> Game_Music_Emu.pro

   # Don't request a static lib, it prevents a dynamic one from being built.
   sed -i '/^CONFIG /s/staticlib //' Game_Music_Emu.pro

   # Install the header file too.
   cat >> Game_Music_Emu.pro <<EOF
headers.path = /usr/include/gme
headers.files += ../../gme/gme.h
INSTALLS += headers
QMAKE_LFLAGS += -Wl,--allow-multiple-definition
EOF
}

build() {
   cd "$srcdir/$pkgname"/prj/Game_Music_Emu
   qmake Game_Music_Emu.pro
   make
}

package() {
   cd "$srcdir/$pkgname"/prj/Game_Music_Emu
   make INSTALL_ROOT="$pkgdir" install
}
