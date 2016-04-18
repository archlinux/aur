# Maintainer: Brian Allred <brian.d.allred@gmail.com>

pkgname=google-play-music-desktop-player-git
_name=Google-Play-Music-Desktop-Player-UNOFFICIAL-
pkgver=3.2.1
pkgrel=1
pkgdesc="A beautiful cross platform Desktop Player for Google Play Music."
arch=('i686' 'x86_64')
url="http://www.googleplaymusicdesktopplayer.com"
license=('MIT')
depends=('libnotify' 'alsa-lib' 'gconf' 'gtk2' 'nss')
makedepends=('nodejs' 'electron' 'npm' 'git' 'gcc-multilib' 'libx11' 'lib32-libx11')
optdepends=('gnome-keyring' 'lsb-release' 'libxtst' 'desktop-file-utils: Needed to update desktop icon database')
install=google-play-music-desktop-player-git.install
source=("git+https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-.git"
        "google-play-music-desktop-player.desktop"
        "google-play-music-desktop-player-git.install")
md5sums=('SKIP'
         '377409fe129d5c93f4edf7e598a6e67f'
         'e297b473f8fd1b6f26642da1d7206123')

pkgver() {
  cd "$srcdir/$_name"
  git describe --tags | sed 's/^v//' | sed 's/-/./g'
}

build() {
  cd "$srcdir/$_name"
  npm install
  npm run build
  npm run package:linux
}

package() {
  # remarks: this package structure is based on a debtap conversion of the .deb output of 'npm run make:linux'

  cd "$pkgdir"

  # remarks: is there a way to keep npm from building for both architectures?
  if [ $CARCH = "x86_64" ]
  then
    dist_dir="$srcdir/$_name/dist/Google Play Music Desktop Player-linux-x64"
  elif [ $CARCH = "i686" ]
  then
    dist_dir="$srcdir/$_name/dist/Google Play Music Desktop Player-linux-ia32"
  fi

  # make directories
  mkdir -p usr/bin usr/share/applications/ usr/share/doc/google-play-music-desktop-player/ usr/share/pixmaps/ usr/share/google-play-music-desktop-player/

  # copy license
  cp "$dist_dir/LICENSE" usr/share/doc/google-play-music-desktop-player/
  # copy icon
  cp "$dist_dir/resources/app/build/assets/img/main.png" usr/share/pixmaps/google-play-music-desktop-player.png
  # copy application
  cp -r "$dist_dir"/* usr/share/google-play-music-desktop-player
  # link binary
  ln -s "/usr/share/google-play-music-desktop-player/Google Play Music Desktop Player" "usr/bin/google-play-music-desktop-player"
  # create desktop entry
  cp $srcdir/google-play-music-desktop-player.desktop usr/share/applications/
}
