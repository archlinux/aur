# Maintainer: David Roheim <david.roheim@gmail.com>
# Contributor: Rohit Manokaran <rohit000@live.com>
# Contributor: James An <james@jamesan.ca>
# Contributor: Rohit Manokaran <rohitmanokaran@yahoo.com>
# Contributor: Pawel "l0ner" Soltys <pwslts@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>
# Contributor: Calvin Morisson <mutantturkey@gmail.com>
# Contributor: deusstultus <deusstultus@gmail.com>

pkgname=hal
pkgver=0.5.14
pkgrel=22
pkgdesc="Hardware Abstraction Layer"
arch=(i686 x86_64)
license=('GPL' 'custom')
url="http://www.freedesktop.org/wiki/Software/hal"
depends=('dbus-glib>=0.82' 'libusb-compat' 'hal-info>=0.20090716' 'dmidecode' 'v4l-utils')
optdepends=('acpid>=2.0' 'pm-utils>=1.2.5')
makedepends=('gperf')
options=('!libtool' '!makeflags')
install=hal.install
source=(http://hal.freedesktop.org/releases/${pkgname}-${pkgver}.tar.gz
         hald
         hal.service
         hal.patch
         udev-update.patch
         hal-glib-2.3-compile-fix.patch
         hal-libudev-events.patch
         badvok-compile-fix.patch)

md5sums=('e9163df591a6f38f59fdbfe33e73bf20'
         '4cdfc673ad65ddb51919f5a757f62145'
         'ca4a7932fe7e8acbfa17245b62cc3b9b'
         '9285ba215509584baaa9e1b573c89416'
         '68209ba62b2a19537bfa459fdef70ed3'
         'c126a66766118f83a171511832d1b619'
         'd115a2f1793121b08dd58527c1530d0b'
         '7acfdd590c98272930ddfd37f1c7f5a3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np0 -d ${srcdir} -i ${srcdir}/hal.patch

  patch -Np1 -i ${srcdir}/hal-libudev-events.patch
  patch -Np1 -i ${srcdir}/hal-glib-2.3-compile-fix.patch
  patch -Np1 -i ${srcdir}/udev-update.patch
  patch -Np1 -i ${srcdir}/badvok-compile-fix.patch

  # fix trialing space
  sed -i 's/failed; [\] /failed; \\/' policy/Makefile.am

  # fix subdir-objects mess in automake 1.14
  sed -i 's/AM_INIT_AUTOMAKE[(]\[gnu 1.9\][)]/AM_INIT_AUTOMAKE([subdir-objects])/' configure.in

  libtoolize --force
  aclocal
  autoupdate   # required to fix obsolete macros
  autoconf
  automake --add-missing --warnings=all

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/hal --with-udev-prefix=/etc \
      --enable-static=no --disable-acpi-ibm \
      --disable-docbook-docs --disable-console-kit \
      --disable-policy-kit --disable-acl-management \
      --enable-umount-helper --disable-smbios \
      --with-hal-user=hal --with-hal-group=hal \
      --with-pid-file=/var/run/hald.pid \
      --sbindir=/usr/bin --disable-gtk-doc
  make

}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # These empty directories are required by hal to successfuly create its fdi-cache
  install -m755 -d "${pkgdir}/etc/hal/fdi/"{policy,preprobe,information}

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
