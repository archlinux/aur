# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Jeff Mickey <j@codemac.net>
# Contributor: Shadowhand <woody.gilk@gmail.com>

pkgname=lomoco
pkgver=1.0
pkgrel=12
url="https://launchpad.net/ubuntu/+source/lomoco"
pkgdesc="Logitech USB mouse configuration program"
license=('GPL')
depends=('libusb-compat')
replaces=('lmctl')
arch=('x86_64')
backup=(etc/udev/lomoco_mouse.conf)
source=(http://http.debian.net/debian/pool/main/l/lomoco/lomoco_$pkgver.0.orig.tar.gz
        http://http.debian.net/debian/pool/main/l/lomoco/lomoco_$pkgver.0-1.debian.tar.gz
        "lomoco_mxair.patch::https://bugs.archlinux.org/task/36657?getfile=10920"
        lomoco_mouse.conf
        lomoco.sh
        0001_stropts.patch)
md5sums=('f5197d0a3ee81229c3eecc1e03f7b08d'
         'b616b29dfe183b74f43072c22a470b8b'
         'd0390dfcadae6e54a4af3e6227d24201'
         '182b10a7e4a1828a93c1d55ef7f81b97'
         'bc92f661641265b33b27895ef24028fd'
         'c1b46fc882b4aa5b5d6d0a86b433ca19')

prepare() {
  cd "$srcdir"/${pkgname}-${pkgver}
  for i in $(cat ../debian/patches/series); do
    patch -p1 <../debian/patches/$i
  done
  patch -p0 <"$srcdir"/lomoco_mxair.patch
  patch -p1 <"$srcdir"/0001_stropts.patch
}

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  ./autogen.sh --prefix=/usr --mandir=/usr/share/man
  make
  make udev-rules
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install

  # Fix and install udev rules and helpers
  sed -i 's|RUN+="udev.lomoco"|RUN+="lomoco.sh"|g' udev/lomoco.rules
  sed -i 's|SYSFS|ATTR|' udev/lomoco.rules
  install -D -m 644 udev/lomoco.rules "$pkgdir"/usr/lib/udev/rules.d/80-lomoco.rules
  install -D -m 755 ../lomoco.sh "$pkgdir"/usr/lib/udev/lomoco.sh
  install -D -m 644 ../lomoco_mouse.conf "$pkgdir"/etc/udev/lomoco_mouse.conf
}
