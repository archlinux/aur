# Maintainer: robertfoster

pkgname=bzzwolfsp
pkgver=1.0.2 # renovate: datasource=github-tags depName=rtcwcoop/rtcwcoop
pkgrel=2
pkgdesc="A Return to Castle Wolfenstein Single Player engine mod to make Cooperative play possible (aka RTCW Coop)"
arch=('i686' 'x86_64')
url="http://www.rtcwcoop.com/"
license=('GPL')
depends=('wolf-data' 'sdl2' 'openal' 'opus' 'opusfile' 'libogg' 'speex' 'zip' 'zlib')
conflicts=('bzzwolfsp-svn')
install='bzzwolfsp.install'
source=("https://github.com/rtcwcoop/rtcwcoop/archive/${pkgver}.tar.gz"
  'bzzwolfsp.launcher'
  'bzzwolfspded.launcher'
  'Makefile.local'
  'create_pk3.sh')

build() {
  cd "$srcdir/rtcwcoop-${pkgver}"
  if [ ! -f /opt/wolf-data/pak0.pk3 ]; then
    echo "pak0.pk3 doesn't exist. This process will be terminated"
    echo "Follow the wolf-data package instructions!"
    exit 1
  fi

  cp $srcdir/Makefile.local .
  make release
}

package() {
  cd "$srcdir/rtcwcoop-${pkgver}"
  mkdir -p $pkgdir/opt/bzzwolfsp/{coopmain,main}

  make COPYDIR=$pkgdir/opt/bzzwolfsp/ copyfiles

  ln -s -r /opt/wolf-data/mp_bin.pk3 $pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pak0.pk3 $pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pak1.pk3 $pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pak2.pk3 $pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pak3.pk3 $pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pak4.pk3 $pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pak5.pk3 $pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pakmaps0.pk3 $pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pakmaps1.pk3 $pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pakmaps2.pk3 $pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pakmaps3.pk3 $pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pakmaps4.pk3 $pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pakmaps5.pk3 $pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/mp_pakmaps6.pk3 $pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/scripts $pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/pak0.pk3 $pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/sp_pak1.pk3 $pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/sp_pak2.pk3 $pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/sp_pak3.pk3 $pkgdir/opt/bzzwolfsp/main
  ln -s -r /opt/wolf-data/rotate.cfg $pkgdir/opt/bzzwolfsp/main

  # Create Coop PK3
  cp $srcdir/create_pk3.sh .
  ./create_pk3.sh
  cp media/*.pk3 $pkgdir/opt/bzzwolfsp/coopmain

  # Modify Launcher Scripts
  if [ "$CARCH" = "x86_64" ]; then
    #
    # x86_64 Systems
    #
    sed -i "s:ARCH:x86_64:" \
      $srcdir/bzzwolfsp.launcher
    sed -i "s:ARCH:x86_64:" \
      $srcdir/bzzwolfspded.launcher
  else
    #
    # i686 Systems
    #
    sed -i "s:ARCH:i386:" \
      $srcdir/bzzwolfsp.launcher
    sed -i "s:ARCH:i386:" \
      $srcdir/bzzwolfspded.launcher
  fi

  # Install Launcher Script (Single Player Client)
  install -D -m 755 $srcdir/bzzwolfsp.launcher \
    $pkgdir/usr/bin/bzzwolfsp
  # Install Launcher Script (Multi Player Client)
  install -D -m 755 $srcdir/bzzwolfspded.launcher \
    $pkgdir/usr/bin/bzzwolfspded
}

sha256sums=('e9a3b6d55ff2d3bb71cc79a8d81bf9a4c63a4d16bf96722b29fe05ccd1306e1c'
            'da2d658e1de2c76c340f741d13b1784c8a663b628d2c72dfb2f46a18c08dd88a'
            '9b01921b6a644bae747c72ee1a6dbe5a00305fa74d943c1b719684f0635beb33'
            'de7691434bf58377ed3e10fb218d129400dbb0c930dd1723670ac33b9a762f66'
            'd75ab07f9759425971fdf047927f33a17a965b0fd09ef4e01994340689674dde')
