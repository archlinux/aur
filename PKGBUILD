# $Id$
# Maintainer: Tom Gundersen <teg@jklm.no>

pkgname=udisks
pkgver=1.0.5
pkgrel=3
pkgdesc="Disk Management Service"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/udisks"
license=('GPL')
depends=('systemd' 'util-linux' 'sg3_utils' 'glib2' 'dbus-glib' 'polkit'
         'parted' 'device-mapper' 'libatasmart' 'lsof' 'libgudev')
makedepends=('intltool' 'docbook-xsl')
source=(http://hal.freedesktop.org/releases/${pkgname}-${pkgver}.tar.gz
        drop-pci-db.patch)
md5sums=('70d48dcfe523a74cd7c7fbbc2847fcdd'
         '773cccd70afd18ace4332037feff67ec')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # https://bugs.freedesktop.org/show_bug.cgi?id=90778
  sed -i '1i #include <sys/stat.h>' src/helpers/job-drive-detach.c
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/udisks --disable-static

  patch -p1 < ../drop-pci-db.patch

  make
  # fix mdadm location
  sed -i -e 's#/sbin/mdadm#/usr/bin/mdadm#g' \
            "${srcdir}/${pkgname}-${pkgver}"/data/80-udisks.rules
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make profiledir=/usr/share/bash-completion/completions DESTDIR="${pkgdir}" install
  chmod 644 "${pkgdir}/usr/share/bash-completion/completions/udisks-bash-completion.sh"

  # move udev helpers and rules to /usr/lib
  mv "${pkgdir}"/lib/udev "${pkgdir}"/usr/lib/
  rm -r "${pkgdir}"/lib

  # move umount helper to /usr/bin
  mv "${pkgdir}"/sbin/umount.udisks "${pkgdir}"/usr/bin/
  rm -r "${pkgdir}"/sbin

  # install the /media folder
  install -d -m 755 $pkgdir/media
}
