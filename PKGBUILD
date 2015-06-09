# Maintainer: Swift Geek
# Contributor: onny <onny@project-insanity.org>

#TODO: Clean legacy/ancient lines
#TODO: Delete *.status and *.log file and similar crap
#TODO: Fix "burst_ind" - has bad deps and links against weird paths and libs etc… mostly upstream issues
#TODO: Fix package for good - is there no make install or WTF!?. Also include includes and install in proper dirs… maybe fix this upstream?
#PKGEXT='.pkg.tar.gz'
pkgname=osmocombb-git
pkgver=a
pkgrel=3
pkgdesc="An Free Software / Open Source GSM Baseband software implementation."
arch=('i686' 'x86_64')
url="http://bb.osmocom.org/"
license="GPL3"
#TODO: test if python2 is makedepend or regular dep
makedepends=('shtool' 'libtool' 'autoconf' 'git' 'make' 'gcc' 'pkg-config' 'patch')
depends=('libosmocore' 'python2')
optdepends=('gpsd' 'cp210x-program')
options=('!strip') #TODO: Not sure about !emptydirs
source=('git+http://cgit.osmocom.org/cgit/osmocom-bb' '8a8796802bc497f00b6a27ca14e2be0c9f9ec176.patch')
# Uncomment line below and comment one above for higher baudrates using the testing burst_ind with the cp210x usb-serial-adapter:
#source=('git+http://cgit.osmocom.org/cgit/osmocom-bb#branch=sylvain/burst_ind')
md5sums=('SKIP' '94bb3ff0cdff13d7a8163c7d2ee40a35')

pkgver() {
  cd "$srcdir/osmocom-bb"
  __pkgver="$(git describe --always)"
  __pkgver="${__pkgver//-/.}"
  echo "${__pkgver#*_v}"
}

prepare() {
  cd "$srcdir/osmocom-bb"
  msg2 "Starting to patch..."
  # Reverse commit "improving" osmocon
  # patch -p1  -R < "$srcdir/8a8796802bc497f00b6a27ca14e2be0c9f9ec176.patch"
  echo "patching src/host/layer23/configure.ac ... " && sed -i 's/-D_HAVE_GPSD/-D_HAVE_GPSD -lgps/' src/host/layer23/configure.ac
  if [[ "${source[0]}" =~ ^.*burst_ind$ ]] ; then
    echo "applying patches for burst_ind branch ..."
    echo "patching src/host/osmocon/osmocon.c ... " && sed -i '64i#define I_HAVE_A_CP210x' src/host/osmocon/osmocon.c
  fi
  msg2 "Starting to patch..."
  find . -name "*.py" | xargs sed -i '1s"^#!.\+$"#!/usr/bin/python2"'

  # Uncomment this line if you want to enable Tx (Transmit) Support.
  #echo 'CFLAGS += -DCONFIG_TX_ENABLE' >> "${srcdir}/osmocom-bb/src/target/firmware/Makefile"

  # Uncomment this line if you want to write to flash.
  #echo 'CFLAGS += -DCONFIG_FLASH_WRITE' >> "${srcdir}/osmocom-bb/src/target/firmware/Makefile"

  # Uncomment this line if you want to write to flash, including the bootloader.
  #echo 'CFLAGS += -DCONFIG_FLASH_WRITE_LOADER' >> "${srcdir}/osmocom-bb/src/target/firmware/Makefile"

}

build() {
  cd "$srcdir/osmocom-bb"

  msg2 "Starting make..."

  cd "$srcdir/osmocom-bb/src"
  make
}

package () {
  cd "$srcdir/osmocom-bb"

  find . \( -name "*.log" -name "*.status" -name "*.m4" -name "configure*" -name "COPYING" -name "*.c" -o -name "*.h" -o -name "*.in" -o -name "*.am" -o -name "*.o" -o -name "Makefile*" \) -print | xargs -i rm {}

  mkdir -p $pkgdir/opt/osmocombb/host/osmocon
  mkdir -p $pkgdir/opt/osmocombb/host/layer23
  mkdir -p $pkgdir/opt/osmocombb/host/rita_pll

  cp -r $srcdir/osmocom-bb/src/* $pkgdir/opt/osmocombb/
  cp -ar $srcdir/osmocom-bb/doc $pkgdir/opt/osmocombb/
  cp -ar $srcdir/osmocom-bb/include $pkgdir/opt/osmocombb/

  mkdir -p $pkgdir/usr/bin

  ln -s /opt/osmocombb/host/osmocon/osmocon $pkgdir/usr/bin/
  ln -s /opt/osmocombb/host/osmocon/osmoload $pkgdir/usr/bin/
  ln -s /opt/osmocombb/host/layer23/src/mobile/mobile $pkgdir/usr/bin/


}

