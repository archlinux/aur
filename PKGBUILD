# Contributor: Paul Burton <paulburton89@gmail.com>
# Contributor: Hervé Cauwelier <herve@oursours.net>
# Contributor: MagicFish1990 <magicfish1990@gmail.com>

pkgname=nvidia-bl
pkgver=0.17.3
pkgrel=8
pkgdesc="Driver to adjust display backlight on modern mobile NVidia graphics adapters."
arch=('i686' 'x86_64')
license=('GPL')
depends=('linux>=3.8')
makedepends=('linux-headers')
install=nvidia-bl.install
backup=etc/modprobe.d/nvidia_bl.conf
url="https://launchpad.net/~mactel-support/+archive/ppa"
source=('nvidia_bl.c'
        'Makefile'
        'nvidia_bl.conf'
        'nvidia_bl_ml.conf')
md5sums=('5ba18564188130954bdad60fe5a5fea5'
         '65086fc2501d2024ee6a1c78b21d030e'
         '897ee78c30e6b498d0e3ce07c06dabc5'
         '5771d2ea826f76d8f27bd9fdcb78a76f')

build() {
  cd "${srcdir}"
  sed -i 's/__devinitconst//g' nvidia_bl.c
  make || return 1
}
package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}"/usr/lib/modules/extramodules-`uname -r|sed -e 's/.[0-9]\+-[0-9]\+//g'`/
  mkdir -p "${pkgdir}"/etc/modprobe.d/
  mkdir -p "${pkgdir}"/etc/modules-load.d/
  install -m 644 nvidia_bl.conf "${pkgdir}"/etc/modprobe.d/nvidia_bl.conf
  install -m 644 nvidia_bl_ml.conf "${pkgdir}"/etc/modules-load.d/nvidia_bl_ml.conf
  install -m 644 nvidia_bl.ko "${pkgdir}"/usr/lib/modules/extramodules-`uname -r|sed -e 's/.[0-9]\+-[0-9]\+//g'`/nvidia_bl.ko
}

