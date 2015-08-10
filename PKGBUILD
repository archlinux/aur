# Maintainer: eloaders <eloaders at linux dot pl>

pkgname=i-nex-git
pkgver=7.4.0.21.g5bdc044
pkgrel=1
pkgdesc="System information tool like hardinfo, sysinfo"
arch=('i686' 'x86_64')
url="http://i-nex.linux.pl/"
license=('LGPL3')
depends=('gambas3-runtime' 
	 'gambas3-gb-image' 
	 'gambas3-gb-form'
         'gambas3-gb-desktop'
         'gambas3-gb-qt4'
         'gambas3-gb-desktop-x11'
         'python2' 
         'libcpuid-git'
         'xorg-server-utils' 
         'lsb-release' 
         'curl')
makedepends=('gambas3-devel' 'gcc' 'imagemagick' 'git')
source=($pkgname::'git://github.com/eloaders/I-Nex.git')
sha256sums=('SKIP')
provides=('i-nex' 'i-nex-bzr' 'i-nex-dev')
conflicts=('i-nex' 'i-nex-bzr' 'i-nex-dev')
backup=('etc/i-nex/Database/i2c/devices.json'
	'etc/i-nex/Database/A6.json'
	'etc/i-nex/Database/amd.json'
	'etc/i-nex/Database/atom.json'
	'etc/i-nex/Database/i3.json'
	'etc/i-nex/Database/i5.json'
	'etc/i-nex/Database/i7.json'
	'etc/i-nex/Database/intel_Core_2_Duo.json'
	'etc/i-nex/Database/intel.json'
	'etc/i-nex/Database/Opteron.json'
	'etc/i-nex/Database/Xeon.json')
pkgver() {
  cd $pkgname
  git describe --tags | tr - .
}
prepare() {
  cd $pkgname
  sed -i 's|python3$|python2|' pastebinit
  # make it dynamic
  sed -i -e 's|^STATIC.*|STATIC = false|' i-nex.mk
  sed -i -e 's|^UDEV_RULES_DIR.*|UDEV_RULES_DIR = /usr/lib/udev/rules.d|' i-nex.mk
  cd I-Nex
  autoreconf -i
}
 
build() {
  cd $pkgname
  cd I-Nex
  ./configure --prefix=/usr
  cd ..
  make
}
 
package() {
  cd $pkgname
  make install DESTDIR="$pkgdir"
}
