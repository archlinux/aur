# Maintainer: Matthias Lamers <aussieevil@hotmail.com>
# Contributor: Michał Wojdyła <micwoj9292@gmail.com>
pkgname=ohrrpgce
pkgver=lexiphanic.r14257
pkgrel=1
epoch=1
pkgdesc="A role playing game creation engine"
arch=('i686' 'x86_64')
license=('GPL')
url="http://rpg.hamsterrepublic.com/ohrrpgce/Main_Page"
depends=('sdl2_mixer' 'openeuphoria' 'libxpm' 'libxrandr' 'ncurses' 'xterm' 'libxinerama')
makedepends=('subversion' 'freebasic' 'scons')
provides=('ohrrpgce')
conflicts=('ohrrpgce-svn')
source=('ohrrpgce::svn+https://rpg.hamsterrepublic.com/source/rel/lexiphanic/')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/ohrrpgce"
  local ver="$(svn info --show-item revision)"
  printf "lexiphanic.r%s" "$ver"
}

prepare() {
  cd "$srcdir/ohrrpgce"
  # Remove hspeak from SCons default targets to avoid compilation loops
  sed 's/, HSPEAK\||//' -i SConscript
}

build() {
  cd "$srcdir/ohrrpgce"

  # The Ultimate Hammer:
  # Create a gcc/g++ wrapper to forcefully inject flag
  # This bypasses SCons and FBC entirely
  # to avoid the GCC 15 late_combine ICE
  # Otherwise the build segfaults on cachyos
  mkdir -p gcc-wrap
  cat << 'EOF' > gcc-wrap/gcc
#!/bin/bash
exec /usr/bin/gcc -fno-late-combine-instructions "$@"
EOF
  cat << 'EOF' > gcc-wrap/g++
#!/bin/bash
exec /usr/bin/g++ -fno-late-combine-instructions "$@"
EOF
  chmod +x gcc-wrap/gcc gcc-wrap/g++

  # Put our fake compilers at the very front of the system PATH
  export PATH="$PWD/gcc-wrap:$PATH"

  # Create hspeak wrapper script
  cat << EOF > hspeak
#!/bin/bash
/usr/share/openeuphoria/bin/eui /usr/share/games/ohrrpgce/hspeak.exw \$*
EOF
  chmod a+x hspeak

    # Create an XDG desktop entry for Vikings of Midgard
  cat << EOF > vikings.desktop
[Desktop Entry]
Type=Application
Name=Vikings of Midgard
Comment=A classic RPG bundled with the OHRRPGCE engine
Exec=/usr/games/ohrrpgce-game /usr/share/games/ohrrpgce/vikings/vikings.rpg
Icon=ohrrpgce-game
Terminal=false
Categories=Game;RolePlaying;
EOF

  # Compile engine components
  if [ "$CARCH" = "x86_64" ]; then
    scons arch=64 game custom unlump relump
  else
    scons game custom unlump relump
  fi

  # Lump vikings game data
  cd vikings
  ../relump vikings.rpgdir vikings.rpg
  cd ..
}

package() {
  cd "$srcdir/ohrrpgce"

  # Install compiled binaries and data into the Arch package directory
  if [ "$CARCH" = "x86_64" ]; then
    scons arch=64 release=1 install destdir="$pkgdir"
  else
    scons release=1 install destdir="$pkgdir"
  fi

  # Manually place the wrapper and Euphoria scripts where the system expects them
  install -Dm755 hspeak "$pkgdir/usr/share/games/ohrrpgce/hspeak"
  install -Dm644 hspeak.exw "$pkgdir/usr/share/games/ohrrpgce/hspeak.exw"
  install -Dm644 hsspiffy.e "$pkgdir/usr/share/games/ohrrpgce/hsspiffy.e"

  # Copy the additional euphoria includes directory
  mkdir -p "$pkgdir/usr/share/games/ohrrpgce/euphoria"
  cp -r euphoria/* "$pkgdir/usr/share/games/ohrrpgce/euphoria/"

  # Install the vikings builtin game
  mkdir -p "$pkgdir/usr/share/games/ohrrpgce/vikings"
  cp -r vikings/* "$pkgdir/usr/share/games/ohrrpgce/vikings/"
  rm -rf "$pkgdir/usr/share/games/ohrrpgce/vikings/vikings.rpgdir"
  install -Dm644 vikings.desktop "$pkgdir/usr/share/applications/vikings.desktop"
}
