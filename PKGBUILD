# Maintainer: David P. <megver83@parabola.nu>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=udisks2-elogind
pkgver=2.6.4
pkgrel=1
pkgdesc="Disk Management Service, version 2"
arch=('armv7h' 'i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/udisks"
license=('GPL2')
groups=('elogind-nosystemd')
depends=('glib2' 'polkit-elogind' 'libatasmart-nosystemd' 'libgudev-nosystemd' 'acl' 'eudev')
makedepends=('intltool' 'docbook-xsl' 'gobject-introspection' 'python2' 'gnome-common')
optdepends=('parted: partition management'
            'gptfdisk: GUID partition table support'
            'ntfs-3g: NTFS filesystem management support'
            'dosfstools: VFAT filesystem management support')
provides=("udisks2=${pkgver}")
conflicts=('udisks2')
options=(libtool strip)
source=('https://github.com/storaged-project/udisks/releases/download/udisks-${pkgver}/udisks-${pkgver}.tar.bz2'
        'udisks-enable-elogind.patch')
sha256sums=('da416914812a77e5f4d82b81deb8c25799fd3228d27d52f7bf89a501b1857dda'
            '52e9157cdf2a1ecc02664205491c9015951213309d08fe18a32f62f54ed93095')

prepare(){
    cd "udisks-$pkgver"
    patch -Np 1 -i ${srcdir}/udisks-enable-elogind.patch
    autoreconf -vfi
}

build() {
  cd "udisks-$pkgver"
  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --disable-static \
      --sbindir=/usr/bin \
      --libexecdir=/usr/lib
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
