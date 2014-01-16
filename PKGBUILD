# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>
# SELinux Maintainer: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>

pkgbase=systemd-selinux
pkgname=('systemd-selinux' 'systemd-sysvcompat-selinux')
pkgver=208
pkgrel=10
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/systemd"
makedepends=('acl' 'cryptsetup' 'libdbus' 'docbook-xsl' 'gobject-introspection' 'gperf'
             'gtk-doc' 'intltool' 'kmod' 'libcap' 'libgcrypt' 'libmicrohttpd' 'libxslt'
             'linux-api-headers' 'pam-selinux' 'python' 'quota-tools' 'xz'
             'libselinux')
options=('strip' 'debug')
source=("http://www.freedesktop.org/software/${pkgname/-selinux}/${pkgname/-selinux}-$pkgver.tar.xz"
        'initcpio-hook-udev'
        'initcpio-install-systemd'
        'initcpio-install-udev'
        '0001-systemd-order-remote-mounts-from-mountinfo-before-re.patch'
        '0001-Make-hibernation-test-work-for-swap-files.patch'
        '0001-fix-lingering-references-to-var-lib-backlight-random.patch'
        '0001-mount-check-for-NULL-before-reading-pm-what.patch'
        '0001-shared-util-fix-off-by-one-error-in-tag_to_udev_node.patch'
        '0001-login-Don-t-stop-a-running-user-manager-from-garbage.patch'
        '0001-fstab-generator-When-parsing-the-root-cmdline-option.patch'
        '0002-fstab-generator-Generate-explicit-dependencies-on-sy.patch'
        '0003-gpt-auto-generator-Generate-explicit-dependencies-on.patch'
        '0004-Remove-FsckPassNo-from-systemd-fsck-root.service.patch'
        '0005-mount-service-drop-FsckPassNo-support.patch'
        '0006-efi-boot-generator-hookup-to-fsck.patch'
        '0007-fsck-root-only-run-when-requested-in-fstab.patch'
        '0001-fstab-generator-Do-not-try-to-fsck-non-devices.patch'
        '0001-acpi-fpdt-break-on-zero-or-negative-length-read.patch')
md5sums=('df64550d92afbffb4f67a434193ee165'
         '29245f7a240bfba66e2b1783b63b6b40'
         '8b68b0218a3897d4d37a6ccf47914774'
         'bde43090d4ac0ef048e3eaee8202a407'
         '8f1182afa1156f0076a912b23e761e02'
         'a5c6564d5435ee99814effd2aa9baf93'
         '1b191c4e7a209d322675fd199e3abc66'
         'a693bef63548163ffc165f4c4801ebf7'
         'ccafe716d87df9c42af0d1960b5a4105'
         '441e3d464ee6af5fe4af6a8bc10d7980'
         '718d841203cf2ea9e24a7d0f1d19d48b'
         '623c77bad0d2968e44963d72924825f1'
         'e52fc8368853c7800ab03ab8868cfd41'
         '2096f33bd36dfa0a7f0431d0a429787a'
         'd2481a6ea199b581e243a950125b0ca6'
         'c2aee634a3a6c50778968f0d5c756f40'
         'ef8b8212d504bb73c10bf4e85f0703b2'
         '4ba2317bf4d7708fca406f49482b1bf3'
         '078f10d6fc315b329844cd20fa742eee')

prepare() {
  cd "${pkgname/-selinux}-$pkgver"
  patch -Np1 < "$srcdir"/0001-fix-lingering-references-to-var-lib-backlight-random.patch
  patch -Np1 < "$srcdir"/0001-mount-check-for-NULL-before-reading-pm-what.patch
  patch -Np1 < "$srcdir"/0001-shared-util-fix-off-by-one-error-in-tag_to_udev_node.patch
  # Fix lingering user managers
  patch -Np1 < "$srcdir"/0001-login-Don-t-stop-a-running-user-manager-from-garbage.patch
  # Backport changes in fstab passno handling
  # Basically, we only need 0001 and 0007, but 0007 is based on earlier patches,
  # and it doesn't hurt to backport them all.
  patch -Np1 < "$srcdir"/0001-fstab-generator-When-parsing-the-root-cmdline-option.patch
  patch -Np1 < "$srcdir"/0002-fstab-generator-Generate-explicit-dependencies-on-sy.patch
  patch -Np1 < "$srcdir"/0003-gpt-auto-generator-Generate-explicit-dependencies-on.patch
  patch -Np1 < "$srcdir"/0004-Remove-FsckPassNo-from-systemd-fsck-root.service.patch
  patch -Np1 < "$srcdir"/0005-mount-service-drop-FsckPassNo-support.patch
  patch -Np1 < "$srcdir"/0006-efi-boot-generator-hookup-to-fsck.patch
  patch -Np1 < "$srcdir"/0007-fsck-root-only-run-when-requested-in-fstab.patch
  # Fix FS#38210 (result of the previous backport)
  patch -Np1 < "$srcdir"/0001-fstab-generator-Do-not-try-to-fsck-non-devices.patch
  # Fix FS#38123
  patch -Np1 < "$srcdir"/0001-Make-hibernation-test-work-for-swap-files.patch
  # Fix FS#35671
  patch -Np1 <"$srcdir"/0001-systemd-order-remote-mounts-from-mountinfo-before-re.patch
  # Fix FS#38403
  patch -Np1 <"$srcdir"/0001-acpi-fpdt-break-on-zero-or-negative-length-read.patch

  autoreconf
}

build() {
  cd "${pkgname/-selinux}-$pkgver"

  ./configure \
      --libexecdir=/usr/lib \
      --localstatedir=/var \
      --sysconfdir=/etc \
      --enable-introspection \
      --enable-gtk-doc \
      --enable-selinux \
      --disable-audit \
      --disable-ima \
      --with-sysvinit-path= \
      --with-sysvrcnd-path= \
      --with-firmware-path="/usr/lib/firmware/updates:/usr/lib/firmware"

  make
}

check() {
  make -C "${pkgname/-selinux}-$pkgver" check || :
}

package_systemd-selinux() {
  pkgdesc="system and service manager"
  license=('GPL2' 'LGPL2.1' 'MIT')
  depends=('acl' 'bash' 'dbus-core' 'glib2' 'kbd' 'kmod' 'hwids' 'libcap' 'libgcrypt'
           'pam-selinux' 'util-linux-selinux' 'xz' 'libselinux')
  provides=("libsystemd=$pkgver" 'nss-myhostname' "systemd-tools=$pkgver" "udev=$pkgver"
            'libgudev-1.0.so' 'libsystemd-daemon.so' 'libsystemd-id128.so'
            'libsystemd-journal.so' 'libsystemd-login.so' 'libudev.so'
            "${pkgname/-selinux}=${pkgver}-${pkgrel}")
  replaces=('libsystemd' 'nss-myhostname' 'systemd-tools' 'udev' 'selinux-systemd')
  conflicts=('libsystemd' 'nss-myhostname' 'systemd-tools' 'udev' 'systemd' 'selinux-systemd')
  optdepends=('cryptsetup: required for encrypted block devices'
              'libmicrohttpd: systemd-journal-gatewayd'
              'quota-tools: kernel-level quota management'
              'python: systemd library bindings'
              'systemd-sysvcompat: symlink package to provide sysvinit binaries')
  backup=(etc/dbus-1/system.d/org.freedesktop.systemd1.conf
          etc/dbus-1/system.d/org.freedesktop.hostname1.conf
          etc/dbus-1/system.d/org.freedesktop.login1.conf
          etc/dbus-1/system.d/org.freedesktop.locale1.conf
          etc/dbus-1/system.d/org.freedesktop.machine1.conf
          etc/dbus-1/system.d/org.freedesktop.timedate1.conf
          etc/pam.d/systemd-user
          etc/systemd/bootchart.conf
          etc/systemd/journald.conf
          etc/systemd/logind.conf
          etc/systemd/system.conf
          etc/systemd/user.conf
          etc/udev/udev.conf)
  install="systemd.install"

  make -C "${pkgname/-selinux}-$pkgver" DESTDIR="$pkgdir" install

  # fix .so links in manpage stubs
  find "$pkgdir/usr/share/man" -type f -name '*.[[:digit:]]' \
      -exec sed -ri '1s|^\.so (.*)\.([0-9]+)|.so man\2/\1.\2|' {} +

  # don't write units to /etc by default -- we'll enable this on post_install
  # as a sane default
  rm "$pkgdir/etc/systemd/system/getty.target.wants/getty@tty1.service"
  rmdir "$pkgdir/etc/systemd/system/getty.target.wants"

  # get rid of RPM macros
  rm -r "$pkgdir/usr/lib/rpm"

  # add back tmpfiles.d/legacy.conf
  install -m644 "systemd-$pkgver/tmpfiles.d/legacy.conf" "$pkgdir/usr/lib/tmpfiles.d"

  # Replace dialout/tape/cdrom group in rules with uucp/storage/optical group
  sed -i 's#GROUP="dialout"#GROUP="uucp"#g;
          s#GROUP="tape"#GROUP="storage"#g;
          s#GROUP="cdrom"#GROUP="optical"#g' "$pkgdir"/usr/lib/udev/rules.d/*.rules

  # add mkinitcpio hooks
  install -Dm644 "$srcdir/initcpio-install-systemd" "$pkgdir/usr/lib/initcpio/install/systemd"
  install -Dm644 "$srcdir/initcpio-install-udev" "$pkgdir/usr/lib/initcpio/install/udev"
  install -Dm644 "$srcdir/initcpio-hook-udev" "$pkgdir/usr/lib/initcpio/hooks/udev"

  # ensure proper permissions for /var/log/journal
  chown root:systemd-journal "$pkgdir/var/log/journal"
  chmod 2755 "$pkgdir/var/log/journal"

  # fix pam file
  sed 's|system-auth|system-login|g' -i "$pkgdir/etc/pam.d/systemd-user"

  ### split out manpages for sysvcompat
  rm -rf "$srcdir/_sysvcompat"
  install -dm755 "$srcdir"/_sysvcompat/usr/share/man/man8/
  mv "$pkgdir"/usr/share/man/man8/{telinit,halt,reboot,poweroff,runlevel,shutdown}.8 \
     "$srcdir"/_sysvcompat/usr/share/man/man8

  # include MIT license, since it's technically custom
  install -Dm644 "$srcdir/${pkgname/-selinux}-$pkgver/LICENSE.MIT" \
      "$pkgdir/usr/share/licenses/systemd/LICENSE.MIT"
}

package_systemd-sysvcompat-selinux() {
  pkgdesc="sysvinit compat for systemd"
  license=('GPL2')
  groups=('selinux')
  conflicts=('sysvinit' 'systemd-sysvcompat' 'selinux-systemd-sysvcompat')
  provides=("${pkgname/-selinux}-sysvcompat=${pkgver}-${pkgrel}"
            "selinux-${pkgname/-selinux}-sysvcompat=${pkgver}-${pkgrel}")
  depends=('systemd-selinux')

  mv "$srcdir/_sysvcompat"/* "$pkgdir"

  install -dm755 "$pkgdir/usr/bin"
  for tool in runlevel reboot shutdown poweroff halt telinit; do
    ln -s 'systemctl' "$pkgdir/usr/bin/$tool"
  done

  ln -s '../lib/systemd/systemd' "$pkgdir/usr/bin/init"
}

workaround_for_the_aur_webinterface='
pkgname="systemd-selinux"
pkgdesc="System and service manager"
depends=('acl' 'bash' 'dbus-core' 'glib2' 'kbd' 'kmod' 'hwids' 'libcap'
         'libgcrypt' 'pam-selinux' 'util-linux-selinux' 'xz' 'libselinux')
'

# vim: ft=sh syn=sh et
