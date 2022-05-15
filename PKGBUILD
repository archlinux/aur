# Maintainer: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>
# Contributor: David A. Redick <david.a.redick@gmail.com>
# Contributor: Petteri Tolonen <petteri dot tolonen at gmail dot com>

# FreeDink consists of multiple parts:
# * The engine – this is an open source reimplementation of the game Dink Smallwood.
# * The editor – it is part of the enigne.
# * The game data – telling the same story as the original game.
#   If you have a copy of the original game, you can also use the original files instead.
# * The mod manager DFArc – optional, to use modifications, such as extra stories.

# The mod manager DFArc can be started by right-clicking on the FreeDink application launcher.

pkgname=freedink
_engine=109.6
_data=1.08.20190120
_dfarc=3.14
pkgver=$_engine
pkgrel=2
pkgdesc='Humorous top-down adventure and role-playing game'
arch=('i486' 'i686' 'pentium4' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://www.gnu.org/software/freedink'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'sdl2_gfx' 'fontconfig' # For the game.
         'wxgtk3'          # For DFArc.
         'fluidsynth'      # Current solution to play midi files.
         'soundfont-fluid' # Arbitrary choosen, but hardcoded, soundfont to play midi files.
         #'timidity++'
        )
makedepends=('help2man' 'rsync' 'cxxtest' 'glm' 'intltool')
install=freedink.install


# For the game to play midi files, one needs to install either timidity++ or fluidsynth and a soundfont.

# In case of timidity:
# - install timidity++
# - install a soundfont
# - configure /etc/timidity/timidity.cfg

# Using fluidsynth (current solution):
# - install fluidsynth
# - install a soundfont
# - set environment variable SDL_SOUNDFONTS
#   Examples:
#   SDL_SOUNDFONTS=/usr/share/soundfonts/FluidR3_GM.sf2
#   SDL_SOUNDFONTS=/usr/share/soundfonts/FluidR3_GM.sf2:/usr/share/soundfonts/FluidR3_GS.sf2
#   (This is done by the sound.patch)

# Using timidity is a better solution, because
# - one of the files cannot be played with fluidsynth.
# - sound is played quieter with fluidsynth.
#
# Debian Buster uses timidity, but the configuration differs a lot.
# The way it's explained in the Arch wiki and example config works for
# using timidity standalone, but not for using it with freedink.

# To build the latest git version, use this as source:
#       https://git.savannah.gnu.org/git/freedink.git
#       https://git.savannah.gnu.org/git/freedink/freedink-data.git
#       https://git.savannah.gnu.org/git/freedink/dfarc.git
source=(https://ftp.gnu.org/gnu/freedink/freedink-${_engine}.tar.gz
        https://sources.debian.org/data/main/f/freedink/109.6-3/debian/patches/sdl2-2.0.10.patch
        sound.patch
        backport.patch::https://git.savannah.gnu.org/cgit/freedink.git/patch/?id=ced987af0574b7fdb11a85ccdcb32f7a6748ef09
        backport-translations.patch::https://git.savannah.gnu.org/cgit/freedink/freedink-data.git/patch/?id=c80d04ba1eb1b0e42525378f617972432968d872
        https://ftp.gnu.org/gnu/freedink/freedink-data-${_data}.tar.gz
        https://ftp.gnu.org/gnu/freedink/dfarc-${_dfarc}.tar.gz
        )

sha256sums=('5e0b35ac8f46d7bb87e656efd5f9c7c2ac1a6c519a908fc5b581e52657981002'
            '9e26cd4179fd4cb3dd5ea347e6a66f5f8b3a7a5fb574dd728592c0b52bdf5442'
            '59cdf6e96b5ee3e8d6a44750222590be6cb013c436682dfb223367c895540ba4'
            'SKIP'
            'SKIP'
            '715f44773b05b73a9ec9b62b0e152f3f281be1a1512fbaaa386176da94cffb9d'
            'a51124ecd11eeca0f1d16732ef58ee690e2fa2db06cc0ec2a5b61b41f8b0e8fa')

prepare () {
  cd "${srcdir}/freedink-${_engine}"

  # Fix an otherwise breaking check.
  sed "s/AC_PREREQ(2.61)/AC_PREREQ(2.64)/" -i configure.ac

  # Patches
  patch -p1 < ../sdl2-2.0.10.patch
  patch -p1 < ../backport.patch

  # German & French translation update (backported from git).
  patch --directory="${srcdir}/freedink-data-${_data}" -p1 < ../backport-translations.patch

  # Hacking in here the sound changes.
  patch -p0 < ../sound.patch

  # Display correct version in main menu.
  sed '/dversion_string = "v1.08 FreeDink";/ s/v1.08/v1.09/' -i src/game_engine.cpp

  # Autodetect the freedink binary in the mod manager without needing symlinks.
  # This changes the default configuration to look for a binary called freedink instead of dink.
  sed '/^  mDinkExe/   s/"dink"/"freedink"/'         -i "${srcdir}/dfarc-${_dfarc}/src/Config.cpp"
  sed '/^  mEditorExe/ s/"dinkedit"/"freedinkedit"/' -i "${srcdir}/dfarc-${_dfarc}/src/Config.cpp"

  # Creates configure script, downloads gnutool and translations.
  ./bootstrap
}

build () {
  # Build the FreeDink game engine.
  cd "${srcdir}/freedink-${_engine}"

  ./configure --prefix=/usr

  # Sometimes linking errors occur when building in parallel. Allow only 1 job.
  make -j1

  # Build the mod manager (optional). With GTK3 instead of GTK2.
  cd "${srcdir}/dfarc-${_dfarc}"
  ./configure --prefix=/usr --disable-desktopfiles --with-wx-config=/usr/bin/wx-config-gtk3
  make
}

check () {
  # cd "${srcdir}/freedink-${_engine}"
  # make check

  cd "${srcdir}/dfarc-${_dfarc}"
  make check
}

package () {
  # Game Engine
  cd "${srcdir}/freedink-${_engine}"
  make DESTDIR="${pkgdir}" install

  # Game Data
  cd "${srcdir}/freedink-data-${_data}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install

  # Mod Manager
  cd "${srcdir}/dfarc-${_dfarc}"
  make DESTDIR="${pkgdir}" install

  # Packaging Files - use for all the same quality icons.
  rm -r "${pkgdir}"/usr/share/pixmaps
  rm "${pkgdir}"/usr/share/icons/hicolor/32x32/mimetypes/application-x-dmod.png

  # Get the images for the launcher.
  install -Dm644 "${srcdir}"/freedink-${_engine}/android/res/drawable-xxhdpi/ic_launcher.png \
                 "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/freedink.png
  install -Dm644 "${srcdir}"/dfarc-${_dfarc}/share/pixmaps/dfarc.png \
                 "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/freedink.png

  # Use symlinks for the mimetype's image (instead of duplicated images).
  mkdir -p "${pkgdir}"/usr/share/icons/hicolor/{32x32,256x256,scalable}/mimetypes/
  ln -s ../apps/freedink.png "${pkgdir}"/usr/share/icons/hicolor/32x32/mimetypes/application-x-dmod.png
  ln -s ../apps/freedink.png "${pkgdir}"/usr/share/icons/hicolor/256x256/mimetypes/application-x-dmod.png
  ln -s ../apps/freedink.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/mimetypes/application-x-dmod.svg

  # The launcher associated to the mimetype uses this icon.
  ln -s ../apps/freedink.png "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/dfarc.png
  ln -s ../apps/freedink.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/dfarc.png
  ln -s ../apps/freedink.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/dfarc.svg

  # Packaging Files - as there is just one icon, show only one launcher for all.
  rm "${pkgdir}"/usr/share/applications/freedinkedit.desktop

  # This launcher is left only for the mimetype.
  echo "NoDisplay=true" >> "${pkgdir}"/usr/share/applications/freedink-dfarc.desktop
  sed 's/Exec=dfarc/Exec=freedink-dfarc/' -i "${pkgdir}"/usr/share/applications/freedink-dfarc.desktop

  # The editor and mod manager can now be started by right-clicking.
  cat >> "${pkgdir}"/usr/share/applications/freedink.desktop << EOF
Actions=Editor;DFArc;

[Desktop Action Editor]
Name=FreeDink Editor
Exec=freedinkedit

[Desktop Action DFArc]
Name=DFArc Mod Manager
Exec=freedink-dfarc
EOF

  # Do not keep 2 names for the binaries, remove the symlinks.
  rm "${pkgdir}"/usr/bin/{freedink-dfarc,dink{,edit}}
  mv "${pkgdir}"/usr/bin/dfarc "${pkgdir}"/usr/bin/freedink-dfarc
}
