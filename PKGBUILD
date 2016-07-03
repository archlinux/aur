# Maintainer: Brian Allred <brian.d.allred@gmail.com>

pkgname=gpmdp-git
_name=Google-Play-Music-Desktop-Player-UNOFFICIAL-
pkgver=3.3.0.3.gf352935
pkgrel=1
pkgdesc="A beautiful cross platform Desktop Player for Google Play Music."
arch=('i686' 'x86_64')
url="http://www.googleplaymusicdesktopplayer.com"
license=('MIT')
depends=('libnotify' 'alsa-lib' 'gconf' 'gtk2' 'nss' 'avahi')
makedepends=('nodejs' 'electron' 'npm' 'git' 'gcc' 'libx11')
optdepends=('gnome-keyring' 'lsb-release' 'libxtst' 'desktop-file-utils: Needed to update desktop icon database')
provides=('gpmdp')
replaces=('google-play-music-desktop-player-git')
conflicts=('google-play-music-desktop-player-git' 'gpmdp')
install=gpmdp-git.install
source=("git+https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-.git"
        "gpmdp.desktop"
        "gpmdp-git.install")
md5sums=('SKIP'
         '3eb4676613a62f2dfb701b1b9eabebc8'
         'e297b473f8fd1b6f26642da1d7206123')

pkgver() {
  cd "$srcdir/$_name"
  git describe --tags | sed 's/^v//' | sed 's/-/./g'
}

build() {
  cd "$srcdir/$_name"
  npm install
  npm uninstall ll-keyboard-hook-win -O
  npm update
  npm run build

  if [ $CARCH = "x86_64" ]
  then
     npm run package:linux:64
  elif [ $CARCH = "i686" ]
  then
     npm run package:linux:32
  fi 

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
  mkdir -p usr/bin usr/share/applications/ usr/share/doc/gpmdp/ usr/share/pixmaps/ usr/share/gpmdp/

  # copy license
  cp "$dist_dir/LICENSE" usr/share/doc/gpmdp/
  # copy icon
  cp "$dist_dir/resources/app/build/assets/img/main.png" usr/share/pixmaps/gpmdp.png
  # copy application
  cp -r "$dist_dir"/* usr/share/gpmdp
  # link binary
  ln -s "/usr/share/gpmdp/Google Play Music Desktop Player" "usr/bin/gpmdp"
  # create desktop entry
  cp $srcdir/gpmdp.desktop usr/share/applications/
}
