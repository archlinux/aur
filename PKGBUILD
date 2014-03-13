# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=udisks2-nosystemd
pkgver=2.1.3
pkgrel=1
pkgdesc="Disk Management Service, version 2"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/udisks"
license=('GPL2')
depends=('glib2' 'udev' 'polkit-consolekit' 'libatasmart' 'util-linux')
makedepends=('intltool' 'docbook-xsl' 'gobject-introspection' 'python')
optdepends=('parted: partition management'
            'gptfdisk: GUID partition table support'
            'ntfs-3g: NTFS filesystem management support'
            'dosfstools: VFAT filesystem management support')
provides=("udisks2=${pkgver}")
conflicts=('udisks2')
replaces=('udisks2')
options=(!libtool)
source=(http://udisks.freedesktop.org/releases/udisks-${pkgver}.tar.bz2)
sha256sums=('5cc92fd651ee49a7888f90d091282b949afc629b31fdb34e187208750720632d')

build() {
  cd "udisks-$pkgver"
  ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --disable-static \
      --sbindir=/usr/bin
  make

  # fix mdadm location
  sed -i -e 's#/sbin/mdadm#/usr/bin/mdadm#g' \
	  "${srcdir}/udisks-${pkgver}"/data/80-udisks2.rules
}

package() {
  cd "udisks-$pkgver"
  make DESTDIR="$pkgdir" install \
    bash_completiondir=/usr/share/bash-completion/completions
}
