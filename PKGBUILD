# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=udisks2-nosystemd
pkgver=2.9.2
pkgrel=1
pkgdesc="Disk Management Service, version 2"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/udisks"
license=('GPL2')
groups=('eudev-base')
depends=('polkit-consolekit' 'libatasmart' 'libgudev' 'libblockdev>=2.24')
makedepends=('docbook-xsl' 'gobject-introspection' 'parted' 'libiscsi' 'gtk-doc')
optdepends=('gptfdisk: GUID partition table support'
            'parted: partition management'
            'gptfdisk: GUID partition table support'
            'ntfs-3g: NTFS filesystem management support'
            'dosfstools: VFAT filesystem management support'
            'libiscsi: iSCSI support')
provides=("udisks2=${pkgver}")
conflicts=('udisks2' 'udisks2-eudev')
replaces=('udisks2' 'udisks2-eudev')
options=(!libtool)
backup=('etc/udisks2/udisks2.conf')
source=(https://github.com/storaged-project/udisks/archive/udisks-$pkgver.tar.gz
        disable_logind_support.patch
        remove_check.patch)
sha512sums=('8c4cd266d97fd01e8b7b6e15e53774a52d723a5b382307c6fefba0ec1eda0178caa760358260180da6cc793af73fd40499b09a2c271d83524a81a260072432e6'
            '22041d363bd7e7a6cc3a7c49c169800a0fad0bc5d3fba5f8663bcd26e2ea09ed78dbdd31ace26a9700863d565be6026b4d2259d5ebbf234ad8571ce2795588ad'
            'e98ef1d34b690e776dfaa9b8a801a98bac395aad38db55933caa843f685471ce9ccfe63287507396925234d17768400d8c38d735f209e515c708f7515ea7ba4f')

prepare() {
  cd "udisks-udisks-$pkgver"

  # It should fix an issue when udisks is asking to enter an user password on
  # every (un)mount operation if installed together with systemd package and any
  # initsystem which supports tmpfiles.d configs.
  patch -p1 -i "$srcdir"/disable_logind_support.patch

  # Allow to build with ZRAM support but without systemd installed
  patch -p1 -i "$srcdir"/remove_check.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "udisks-udisks-$pkgver"
  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --disable-static \
      --sbindir=/usr/bin \
      --libexecdir=/usr/lib \
      --enable-gtk-doc enable_available_modules=yes
  make
}

package() {
  cd "udisks-udisks-$pkgver"
  make DESTDIR="$pkgdir" install
}
