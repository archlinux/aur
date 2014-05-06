# Maintainer: Rohit Manokaran <rohitmanokaran@yahoo.com>
# Contributor: Pawel "l0ner" Soltys <pwslts@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>
# Contributor: Calvin Morisson <mutantturkey@gmail.com>

pkgname=hal
pkgver=0.5.14
pkgrel=18
pkgdesc="Hardware Abstraction Layer"
arch=(i686 x86_64)
license=('GPL' 'custom')
url="http://www.freedesktop.org/wiki/Software/hal"
depends=('dbus-glib>=0.82' 'libusb-compat' 'systemd>=189' 'filesystem>=2012' 'hal-info>=0.20090716' 'dmidecode' 'pciutils>=3.0.2' 'usbutils>=006' 'pm-utils>=1.2.5' 'util-linux>=2.24' 'v4l-utils')
makedepends=('pkg-config' 'gperf' 'libtool')
options=('!libtool' '!makeflags')
install=hal.install
source=(http://hal.freedesktop.org/releases/${pkgname}-${pkgver}.tar.gz
         hald
         hal.patch
         udev-update.patch
         hal-glib-2.3-compile-fix.patch
         hal-libudev-events.patch
         badvok-compile-fix.patch)
#        patches/hal-0.5.9-hide-diagnostic.patch
#        patches/hal-remove-dell-killswitch.patch
#        patches/hal-KVM-evdev.patch
#        patches/hal-HDAPS-blacklist.patch
#        patches/hal-xen-unignore-axes.patch
#        patches/hal-use-at-console.patch
#        patches/fix-libusb-detection.patch
#        patches/dbus-error-init.patch
#        patches/path-max.patch
#        patches/handle-input-touchpad.patch
#        patches/macbook-fix-ioperm.patch
#        patches/hal-ignore-internal-dm-devices.patch

md5sums=('e9163df591a6f38f59fdbfe33e73bf20'
         '4cdfc673ad65ddb51919f5a757f62145'
         '9285ba215509584baaa9e1b573c89416'
         '68209ba62b2a19537bfa459fdef70ed3'
         'c126a66766118f83a171511832d1b619'
         'd115a2f1793121b08dd58527c1530d0b'
         '7acfdd590c98272930ddfd37f1c7f5a3'
        )
#         '4d4b6801a1cedca22b8bdd9db73b16fb'
#         '6d87c3e63184ae3a69caafc846f538a3'
#         '6507e5091ee2d11a87ae738a8e2caecb'
#         '1171c2d83b76059f2da7a3538e08fa4e'
#         '52bd305299aa22ae07f1a862c22d30fa'
#         '3f11234fb5e5044fbfc5199ec65b182c'
#         'da088f12cfc2d190bbf95b747e19ab9e'
#         '634f4ec2203eff7de8fa2ed2c6b9cbe0'
#         'f8c9b3a40d03907b498feef571d42466'
#         '0575677614db0632b17b1a719798c7e0'
#         '46a5db3ff896ee37762aa8d7e70942c4'
#         '17bc2b911f245cef4a1d98769d5c4d14'

build() {

  cd $srcdir
  patch -Np1 -d ${srcdir} < hal.patch

  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/hal-libudev-events.patch"
  patch -Np1 -i "${srcdir}/hal-glib-2.3-compile-fix.patch"
  patch -Np1 -i "${srcdir}/udev-update.patch"
  patch -Np1 -i "${srcdir}/badvok-compile-fix.patch"

  # fix trialing space
  sed -i 's/failed; [\] /failed; \\/' policy/Makefile.am

  # fix subdir-objects mess in automake 1.14
  sed -i 's/AM_INIT_AUTOMAKE[(]\[gnu 1.9\][)]/AM_INIT_AUTOMAKE([subdir-objects])/' configure.in
#   sed -i 's/AC_DEFUN[(]\[AM_INIT_AUTOMAKE\]/AC_DEFUN([AM_INIT_AUTOMAKE([subdir-objects])]/' aclocal.m4

#  patch -Np1 -i "${srcdir}/hal-remove-dell-killswitch.patch"
#  patch -Np1 -i "${srcdir}/hal-KVM-evdev.patch"
#  patch -Np1 -i "${srcdir}/hal-HDAPS-blacklist.patch"
#  patch -Np1 -i "${srcdir}/hal-xen-unignore-axes.patch"
#  patch -Np1 -i "${srcdir}/hal-use-at-console.patch"
#  patch -Np1 -i "${srcdir}/fix-libusb-detection.patch"
#  patch -Np1 -i "${srcdir}/dbus-error-init.patch"
#  patch -Np1 -i "${srcdir}/path-max.patch"
#  patch -Np1 -i "${srcdir}/handle-input-touchpad.patch"
#  patch -Np1 -i "${srcdir}/macbook-fix-ioperm.patch"
#  patch -Np1 -i "${srcdir}/hal-ignore-internal-dm-devices.patch"

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
  cd $srcdir/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
#   install -m755 -d "${pkgdir}/etc/rc.d"
  install -m755 -d "${pkgdir}/media"
#   install -m755 "${srcdir}/hald" "${pkgdir}/etc/rc.d/hal"

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"

  # These empty directories are required by hal to successfuly create its fdi-cache
  install -m755 -d "${pkgdir}/etc/hal/fdi/policy"
  install -m755 -d "${pkgdir}/etc/hal/fdi/preprobe"
  install -m755 -d "${pkgdir}/etc/hal/fdi/information"

  # udev-sockets support has been removed from udev. hal-libudev-events.patch fixes hal to get events from libudev
  rm "${pkgdir}/etc/udev/rules.d/90-hal.rules"
  rmdir "${pkgdir}/etc/udev/rules.d"
  rmdir "${pkgdir}/etc/udev"

  # move umount.hal from non-standard /sbin to /usr/sbin
  if test -e "${pkgdir}/sbin/umount.hal"; then
    install -m755 -d "${pkgdir}/usr/sbin"
    mv "${pkgdir}/sbin/umount.hal" "${pkgdir}/usr/sbin/umount.hal"
    rmdir "${pkgdir}/sbin"
  fi

  # create systemd service files
  install -m755 -d "${pkgdir}/usr/lib/systemd/system"
  cat >${pkgdir}/usr/lib/systemd/system/hal.service <<EOF
[Unit]
Description=Hardware Abstraction Layer
Requires=dbus.service
Wants=acpid.service
After=dbus.service syslog.target acpid.service

[Service]
Type=oneshot
ExecStart=/usr/bin/hald --daemon=yes --use-syslog
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

  # These dirs dont appear to be used. If they are needed we need to add systemd tmpfile to create them
  rmdir "${pkgdir}/var/run/hald/hald-local"
  rmdir "${pkgdir}/var/run/hald/hald-runner"
  rmdir "${pkgdir}/var/run/hald"

  # Change ownership from hal:hal to root [namcap error]
  chown root:root "${pkgdir}/var/cache/hald"
}


