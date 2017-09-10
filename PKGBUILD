# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=udisks2-nosystemd
pkgver=2.7.2
pkgrel=1
pkgdesc="Disk Management Service, version 2"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/udisks"
license=('GPL2')
groups=('eudev-base')
depends=('polkit-consolekit' 'libatasmart' 'libgudev' 'libblockdev')
makedepends=('docbook-xsl' 'gobject-introspection' 'gnome-common' 'intltool' 'parted' 'libiscsi')
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
source=(https://github.com/storaged-project/udisks/archive/udisks-$pkgver.tar.gz
        fix_build.patch)
sha256sums=('34d834520efcfbb8cca33ccf703e45752b32772ae766673dab6360202c7838aa'
            '9b9144de4d68703f574987d36dbe08c3b97d525adea65870f9b940f3315eefe7')

prepare() {
  cd "udisks-udisks-$pkgver"

  sed -e 's/AC_MSG_ERROR(\[libstoragemgmt/AC_MSG_WARN([libstoragemgmt/' \
      -e 's/AC_MSG_ERROR(\[libconfig/AC_MSG_WARN([libconfig/' \
      -i configure.ac

  # Fix build with gtk-doc 2.16. See https://github.com/storaged-project/udisks/issues/389
  patch -p1 -i "$srcdir"/fix_build.patch
}

build() {
  cd "udisks-udisks-$pkgver"
  ./autogen.sh \
      --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --disable-static \
      --sbindir=/usr/bin \
      --libexecdir=/usr/lib \
      --enable-available-modules
  make
}

package() {
  cd "udisks-udisks-$pkgver"
  make DESTDIR="$pkgdir" install \
    bash_completiondir=/usr/share/bash-completion/completions
}
