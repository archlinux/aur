# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=udisks2-nosystemd
pkgver=2.9.0
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
        disable_logind_support.patch)
sha512sums=('d3ee7dac016e03b7d4fc6e2c64450953fe22469d854b5e7232ad95b356b05930ddf2c8372a74280825e6fff693ab53294cb5c071e2d85b347703dd58289a605e'
            '22041d363bd7e7a6cc3a7c49c169800a0fad0bc5d3fba5f8663bcd26e2ea09ed78dbdd31ace26a9700863d565be6026b4d2259d5ebbf234ad8571ce2795588ad')

prepare() {
  cd "udisks-udisks-$pkgver"

  # It should fix an issue when udisks is asking to enter an user password on
  # every (un)mount operation if installed together with systemd package and any
  # initsystem which supports tmpfiles.d configs.
  patch -p1 -i "$srcdir"/disable_logind_support.patch

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
