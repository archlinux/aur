# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: David Roheim <david.roheim@gmail.com>
# Contributor: Rohit Manokaran <rohit000@live.com>
# Contributor: James An <james@jamesan.ca>
# Contributor: Rohit Manokaran <rohitmanokaran@yahoo.com>
# Contributor: Pawel "l0ner" Soltys <pwslts@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>
# Contributor: Calvin Morisson <mutantturkey@gmail.com>
# Contributor: deusstultus <deusstultus@gmail.com>

pkgname=hal
pkgver=0.5.15
pkgrel=3
pkgdesc="Hardware Abstraction Layer"
arch=(i686 x86_64)
license=('GPL' 'custom')
url="http://www.freedesktop.org/wiki/Software/${pkgname}"
depends=('dbus-glib' 'libusb-compat' 'hal-info' 'dmidecode' 'v4l-utils' 'pciutils')
optdepends=('acpid' 'pm-utils')
makedepends=('gperf')
options=('!libtool' '!makeflags')
install="${pkgname}.install"
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgname^^[a-z]}_${pkgver//\./_}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.service"
	"header.patch")
md5sums=('a8a7d380f3791c818a08a5f74befe3aa'
         'ca4a7932fe7e8acbfa17245b62cc3b9b'
         '26cd90a078dd5c28786aea158fb7a0d3')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np2 -b -z .orig <../header.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/${pkgname} --with-udev-prefix=/etc \
      --enable-static=no --disable-acpi-ibm \
      --disable-docbook-docs --disable-console-kit \
      --disable-policy-kit --disable-acl-management \
      --enable-umount-helper --disable-smbios \
      --with-hal-user=${pkgname} --with-hal-group=${pkgname} \
      --with-pid-file=/var/run/hald.pid \
      --sbindir=/usr/bin --disable-gtk-doc
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # These empty directories are required by hal to successfuly create its fdi-cache
  install -m755 -d "${pkgdir}/etc/${pkgname}/fdi/"{policy,preprobe,information}

  # udev-sockets support has been removed from udev. hal-libudev-events.patch fixes hal to get events from libudev
  rm -r "${pkgdir}/etc/udev"

  # move umount.hal from non-standard /sbin to /usr/bin
  if test -e "${pkgdir}/sbin/umount.hal"; then
    install -m755 -d "${pkgdir}/usr/bin"
    mv "${pkgdir}/sbin/umount.hal" "${pkgdir}/usr/bin/umount.hal"
    rmdir "${pkgdir}/sbin"
  fi

  # create systemd service files
  install -Dm644 ../hal.service "${pkgdir}/usr/lib/systemd/system/hal.service"

  # These dirs dont appear to be used. If they are needed we need to add systemd tmpfile to create them
  rm -r "${pkgdir}/var/run"

  # Change ownership from hal:hal to root [namcap error]
  chown root:root "${pkgdir}/var/cache/hald"
}
