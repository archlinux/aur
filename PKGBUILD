# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: ffcc <ffercc at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>

pkgname=udisks
pkgver=1.0.5
pkgrel=5
pkgdesc="Disk Management Service"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/udisks"
license=('GPL')
depends=('systemd' 'util-linux' 'sg3_utils' 'glib2' 'dbus-glib' 'polkit'
         'parted' 'device-mapper' 'libatasmart' 'lsof' 'libgudev')
makedepends=('intltool' 'docbook-xsl')
source=(http://hal.freedesktop.org/releases/${pkgname}-${pkgver}.tar.gz
        drop-pci-db.patch
        fix-glibc-2.27.patch)
sha256sums=('f2ec82eb0ea7e01dc299b5b29b3c18cdf861236ec43dcff66b3552b4b31c6f71'
            '329921064156846a6ca94ca38072a601368f1a71afe614f071a49e902d91340b'
            '5db57404465df87f17552c44f4a904ec2fe1e488fd1b37fc3f1e011244cc7b64')

prepare() {
  cd ${pkgname}-${pkgver}

  # https://bugs.freedesktop.org/show_bug.cgi?id=90778
  sed -i '1i #include <sys/stat.h>' src/helpers/job-drive-detach.c
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/udisks --disable-static

  patch -p1 < ../drop-pci-db.patch
  patch -p0 < ../fix-glibc-2.27.patch


  make
  # fix mdadm location
  sed -i -e 's#/sbin/mdadm#/usr/bin/mdadm#g' \
            "${srcdir}/${pkgname}-${pkgver}"/data/80-udisks.rules
}

package() {
  cd ${pkgname}-${pkgver}
  make profiledir=/usr/share/bash-completion/completions DESTDIR="$pkgdir" install
  chmod 644 "$pkgdir"/usr/share/bash-completion/completions/udisks-bash-completion.sh

  # move udev helpers and rules to /usr/lib
  mv "$pkgdir"/lib/udev "$pkgdir"/usr/lib/
  rm -r "$pkgdir"/lib

  # move umount helper to /usr/bin
  mv "$pkgdir"/sbin/umount.udisks "$pkgdir"/usr/bin/
  rm -r "$pkgdir"/sbin

  # install the /media folder
  install -d -m 755 "$pkgdir"/media
}
