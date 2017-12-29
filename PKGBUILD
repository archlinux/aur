# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=udisks2-nosystemd
pkgver=2.7.5
pkgrel=1
pkgdesc="Disk Management Service, version 2"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/udisks"
license=('GPL2')
groups=('eudev-base')
depends=('polkit-consolekit' 'libatasmart' 'libgudev' 'libblockdev>=2.14')
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
        disable_logind_support.patch)
sha512sums=('fd49fd719d3d11ceb6349e856996f8f6f9ee58a2cc35e6622ce662096fa2e746d01958c81e464c4be6071578f4f3e39c5af81669b83582be47b191703c93e71c'
            '379c9600d06a1a6d1a59cc93b2b15fbafc6c756a4dcbcf1b6b7995e991c0758e19db6f08511351b1a764b747d183373423e1bc396147eb8da5b2d85c420c25b4')

prepare() {
  cd "udisks-udisks-$pkgver"

  sed -e 's/AC_MSG_ERROR(\[libstoragemgmt/AC_MSG_WARN([libstoragemgmt/' \
      -e 's/AC_MSG_ERROR(\[libconfig/AC_MSG_WARN([libconfig/' \
      -i configure.ac

  # It should fix an issue when udisks is asking to enter an user password on
  # every (un)mount operation if installed together with systemd package and any
  # initsystem which supports tmpfiles.d configs.
  patch -p1 -i "$srcdir"/disable_logind_support.patch
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
