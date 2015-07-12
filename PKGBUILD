# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Based on the PKGBUILD for i-nex-git from eloaders <eloaders at linux dot pl>

pkgname=i-nex
pkgver=7.4.0
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
source=("https://github.com/eloaders/I-Nex/archive/${pkgver}.tar.gz")
sha256sums=('f7eb0a97d140ea85dc4e04972c5a34210c5a486310550ddc7d07cab5570dbbbe')
provides=('i-nex' 'i-nex-bzr' 'i-nex-dev' 'i-nex-git')
conflicts=('i-nex' 'i-nex-bzr' 'i-nex-dev' 'i-nex-git')
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
  cd "I-Nex-${pkgver}"
  git describe --tags | tr - .
}
prepare() {
  cd "I-Nex-${pkgver}"
  sed -i 's|python3$|python2|' pastebinit
  # make it dynamic
  sed -i -e 's|^STATIC.*|STATIC = false|' i-nex.mk
  sed -i -e 's|^UDEV_RULES_DIR.*|UDEV_RULES_DIR = /usr/lib/udev/rules.d|' i-nex.mk
  cd "I-Nex"
  autoreconf -i
}
 
build() {
  cd "I-Nex-${pkgver}"
  cd "I-Nex"
  ./configure --prefix=/usr
  cd ..
  make
}
 
package() {
  cd "I-Nex-${pkgver}"
  make install DESTDIR="$pkgdir"
}