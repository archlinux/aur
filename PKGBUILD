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
        http://http.debian.net/debian/pool/main/l/lomoco/lomoco_$pkgver.0-4.debian.tar.xz
        "lomoco_mxair.patch::https://bugs.archlinux.org/attachments/36657/10920/mxair.patch"
        lomoco_mouse.conf
        lomoco.sh)
md5sums=('f5197d0a3ee81229c3eecc1e03f7b08d'
         'ac869dbf7792ef65df3849ab6f130ba1'
         'd0390dfcadae6e54a4af3e6227d24201'
         '182b10a7e4a1828a93c1d55ef7f81b97'
         'bc92f661641265b33b27895ef24028fd')

prepare() {
  cd "$srcdir"/${pkgname}-${pkgver}
  for i in $(cat ../debian/patches/series); do
    patch -p1 <../debian/patches/$i
  done
  patch -p0 <"$srcdir"/lomoco_mxair.patch
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
