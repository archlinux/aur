# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=udisks2-nosystemd
pkgver=2.6.4
pkgrel=1
pkgdesc="Disk Management Service, version 2"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/udisks"
license=('GPL2')
groups=('eudev-base')
depends=('glib2' 'udev' 'polkit-consolekit' 'libatasmart' 'util-linux' 'libgudev')
makedepends=('intltool' 'docbook-xsl' 'gobject-introspection' 'gnome-common')
optdepends=('parted: partition management'
            'gptfdisk: GUID partition table support'
            'ntfs-3g: NTFS filesystem management support'
            'dosfstools: VFAT filesystem management support')
provides=("udisks2=${pkgver}")
conflicts=('udisks2' 'udisks2-eudev')
replaces=('udisks2' 'udisks2-eudev')
options=(!libtool)
source=(https://github.com/storaged-project/udisks/archive/udisks-$pkgver.tar.gz
        dbus_service_fix.patch)
sha256sums=('7c7889dbd8f910b8a8094841168c04d48e0bdaf946b22aa5f0742a460473c191'
            '1721df69e97ad8fd0567448ef4752a35288b68f25111316054aec6fb4e749f86')

prepare() {
  cd "udisks-udisks-$pkgver"
  patch -p1 -i ../dbus_service_fix.patch
}

build() {
  cd "udisks-udisks-$pkgver"
  ./autogen.sh \
      --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --disable-static \
      --sbindir=/usr/bin \
      --libexecdir=/usr/lib
  make
}

package() {
  cd "udisks-udisks-$pkgver"
  make DESTDIR="$pkgdir" install \
    bash_completiondir=/usr/share/bash-completion/completions
}
