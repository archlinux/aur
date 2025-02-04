# Maintainer: robertfoster

pkgname=rtcwcoop-git
pkgver=1.0.2.r46.g799bc3c0
pkgrel=1
pkgdesc="A Return to Castle Wolfenstein modification which enables cooperative gameplay, based on iortcw"
arch=('i686' 'x86_64')
url="http://www.rtcwcoop.com"
license=('GPL')
depends=('iortcw-data' 'freetype2' 'sdl2' 'libjpeg-turbo' 'openal' 'opus' 'opusfile' 'libogg' 'zlib')
makedepends=('cmake' 'git' 'zip')
noextract=('patch-data-141.zip')
install='rtcwcoop-git.install'
source=("rtcwcoop::git+https://github.com/rtcwcoop/rtcwcoop.git"
  'rtcwcoop.launcher'
  'rtcwcoopded.launcher'
  'rtcwcoop.png'
  'rtcwcoop.desktop')

pkgver() {
  cd "$srcdir/rtcwcoop"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/rtcwcoop"

  mkdir -p $pkgdir/opt/rtcwcoop/{coopmain,main}

  cd $srcdir/rtcwcoop

  make USE_INTERNAL_LIBS=0 COPYDIR=$pkgdir/opt/rtcwcoop/ copyfiles

  ln -s -r /opt/iortcw-data/* $pkgdir/opt/rtcwcoop/main

  # Create Coop PK3
  if [ "$CARCH" = "x86_64" ]; then

    # x86_64 Systems
    ./create_pk3_64.sh release
  else

    # i686 Systems
    ./create_pk3.sh release
  fi

  cp media/{bin,sp_pak_coop1}.pk3 $pkgdir/opt/rtcwcoop/coopmain

  # Modify Launcher Scripts
  if [ "$CARCH" = "x86_64" ]; then
    # x86_64 Systems

    sed -i "s:ARCH:x86_64:" \
      $srcdir/rtcwcoop.launcher
    sed -i "s:ARCH:x86_64:" \
      $srcdir/rtcwcoopded.launcher
  else
    # i686 Systems

    sed -i "s:ARCH:i386:" \
      $srcdir/rtcwcoop.launcher
    sed -i "s:ARCH:i386:" \
      $srcdir/rtcwcoopded.launcher
  fi

  # Install Launcher Script (Single Player Client)
  install -D -m 755 $srcdir/rtcwcoop.launcher \
    $pkgdir/usr/bin/rtcwcoop
  # Install Launcher Script (Multi Player Client)
  install -D -m 755 $srcdir/rtcwcoopded.launcher \
    $pkgdir/usr/bin/rtcwcoopded

  install -Dm644 $srcdir/rtcwcoop.png $pkgdir/usr/share/pixmaps/rtcwcoop.png
  install -Dm755 $srcdir/rtcwcoop.desktop $pkgdir/usr/share/applications/rtcwcoop.desktop
}

sha256sums=('SKIP'
            '7ab66c161014948af13362cdc7b30d3f1f8deff60f93d9c179f4cbfd50a9ade4'
            'e55a82cc0e37b66dd47c82e271c437ce0696e78d2604398fb66a0412f34419ab'
            'd91fb40bc593f8eb9c170ab71eb654a63d7690ce22b886e1477e649d9133ef48'
            'a40f8d17afd6a9fa855790697fe567dfa6c43025b66e1f8432f4c89d1a50e8ad')
