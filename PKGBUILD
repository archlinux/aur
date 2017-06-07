# Maintainer: Breizh <breizh.craft.98@openmailbox.org>
# Contributor: Mr_Men <tetcheve at gmail dot com>
# Contributor: Hasan Gormus aka hsngrms <hsngrms at yandex dot com>
# Contributor: uwinkelvos <uwinkelvos at gmx dot de>
# Contributor: Bernhard Landauer <oberon@manjaro.org>

pkgname=nvidiabl
pkgver=0.88
pkgrel=5
pkgdesc="Backlight driver for NVidia graphics adapters"
arch=('x86_64' 'i686')
url="https://github.com/guillaumezin/nvidiabl"
license=('GPL')
makedepends=('linux-headers')
conflicts=('nvidia-bl' 'nvidiablctl')
install=$pkgname.install
source=("https://github.com/guillaumezin/$pkgname/archive/master.zip"
        $pkgname-master.patch
        kernel-4.8.patch)
md5sums=('c1cec85b0a9f4469d433a2756bdb2497'
         '79e5699da970908d6ec8dba114df87cb'
         'd94abebc5f40586fbed015d9fab29a37')

prepare() {
  cd $pkgname-master
  patch -p1 -i ../$pkgname-master.patch
  patch -p1 -i ../kernel-4.8.patch
}

build() {
  cd $pkgname-master
  make
}

package() {
  cd $pkgname-master
  _extramodules="extramodules-$(uname -r | cut -f-2 -d'.')-$(uname -r|sed -e 's/.*-//g')"
  _MODPATH="$pkgdir/usr/lib/modules/$_extramodules/"
  install -d "$_MODPATH"
  install -d "$pkgdir/usr/bin/"
  install -m 644 "$pkgname.ko" "$_MODPATH"
  install -m 755 scripts/usr/local/sbin/${pkgname}ctl "$pkgdir/usr/bin/"
}
