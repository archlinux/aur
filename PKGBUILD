# Maintainer: robertfoster

pkgname=realrtcw
pkgver=3.1n
pkgrel=1
pkgdesc="An overhaul mod for critically acclaimed Return To Castle Wolfenstein."
arch=('i686' 'x86_64')
url="http://www.moddb.com/mods/realrtcw-realism-mod"
license=('GPL')
depends=('freetype2' 'graphite' 'harfbuzz' 'iortcw-data' 'libjpeg-turbo' 'libogg' 'openal' 'opus' 'opusfile' 'pcre' 'sdl2' 'zlib')
makedepends=('unzip')
install='realrtcw.install'
_commit="d83161cbf8f3ebf5390dac3ccc0227543ec0989c"

source=("$pkgname-$pkgver.tar.gz::https://github.com/wolfetplayer/RealRTCW/archive/${_commit}.tar.gz"
  "$pkgname-$pkgver.zip::https://www.moddb.com/downloads/mirror/201571/125/9f598d20c7263f58fa8765d568cf020d"
  "$pkgname.png"
  "$pkgname.launcher"
  "$pkgname.desktop"
)

prepare() {
  cd $srcdir

  # Unzipping with flattened paths
  unzip -jo $pkgname-$pkgver.zip -d paks
}

package() {
  cd "$srcdir/RealRTCW-${_commit}"

  USE_INTERNAL_LIBS=0 \
    COPYDIR=$pkgdir/opt/realrtcw \
    make copyfiles

  ln -s -r /opt/iortcw-data/pak0.pk3 $pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/sp_pak1.pk3 $pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pak0.pk3 $pkgdir/opt/realrtcw/main

  ln -s -r /opt/iortcw-data/mp_bin.pk3 $pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pak1.pk3 $pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pak2.pk3 $pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pak3.pk3 $pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pak4.pk3 $pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pak5.pk3 $pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pakmaps0.pk3 $pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pakmaps1.pk3 $pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pakmaps2.pk3 $pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pakmaps3.pk3 $pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pakmaps4.pk3 $pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pakmaps5.pk3 $pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/mp_pakmaps6.pk3 $pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/sp_pak2.pk3 $pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/sp_pak3.pk3 $pkgdir/opt/realrtcw/main
  ln -s -r /opt/iortcw-data/sp_pak4.pk3 $pkgdir/opt/realrtcw/main

  ln -s -r /opt/iortcw-data/openurl.sh $pkgdir/opt/realrtcw/openurl.sh

  # Installing RealRTCW pk3
  for i in paks/*.pk3; do
    install -m 644 "$srcdir"/$i \
      "$pkgdir/opt/realrtcw/main"
  done

  # Modify Launcher Scripts
  if [ "$CARCH" = "x86_64" ]; then
    # x86_64 Systems
    TARGET=x86_64
  else
    # i686 Systems
    TARGET=x86
  fi
  sed -i "s:ARCH:$TARGET:" \
    $srcdir/realrtcw.*

  # Install Launcher Script (Single Player Client)
  install -D -m 755 "$srcdir/realrtcw.launcher" \
    "$pkgdir/usr/bin/realrtcw"

  # Install Desktop File (Single Player)
  install -D -m 644 "$srcdir/realrtcw.desktop" \
    "$pkgdir/usr/share/applications/realrtcw.desktop"

  # Install Icon File (Single Player)
  install -Dm 644 "$srcdir/realrtcw.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/realrtcw.png"
}

md5sums=('f0d07eef3bcde761727eca023aef2b4f'
  '6f140b9df87f6fb362c323b0b5656710'
  '19ef21acfceb965f36b53b70267641d1'
  '7e3991e5f331662419ad1ed04e49366c'
  '88752202a0da9bc9cb467b6f0f201132')
