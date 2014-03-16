# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>
# SELinux Maintainer: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>

pkgbase=systemd-selinux
pkgname=('systemd-selinux' 'systemd-sysvcompat-selinux')
pkgver=210
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/systemd"
makedepends=('acl' 'cryptsetup' 'docbook-xsl' 'gobject-introspection' 'gperf'
             'gtk-doc' 'intltool' 'kmod' 'libcap' 'libgcrypt'  'libmicrohttpd' 'libxslt'
             'linux-api-headers' 'pam-selinux' 'python' 'python-lxml' 'quota-tools' 'xz'
             'libselinux')
options=('strip' 'debug')
source=("http://www.freedesktop.org/software/${pkgname/-selinux}/${pkgname/-selinux}-$pkgver.tar.xz"
        '0001-login-fix-pos-array-allocation.patch'
        '0002-login-set-pos-slot-to-fallback-on-pos-eviction.patch'
        '0003-login-Allow-calling-org.freedesktop.login1.Seat.Swit.patch'
        '0004-fix-typo-in-iDRAC-network-interface-name-irdac-idrac.patch'
        '0007-mount-don-t-send-out-PropertiesChanged-message-if-ac.patch'
        '0008-mount-don-t-fire-PropertiesChanged-signals-for-mount.patch'
        '0009-logs-show-fix-corrupt-output-with-empty-messages.patch'
        '0010-journalctl-refuse-extra-arguments-with-verify-and-si.patch'
        '0011-cdrom_id-use-the-old-MMC-fallback.patch'
        '0012-nspawn-fix-detection-of-missing-proc-self-loginuid.patch'
        '0013-Fix-systemd-stdio-bridge-symlink.patch'
        '0014-execute-free-directory-path-if-we-fail-to-remove-it-.patch'
        '0015-journal-assume-that-next-entry-is-after-previous-ent.patch'
        '0016-journal-forget-file-after-encountering-an-error.patch'
        '0017-core-correctly-unregister-PIDs-from-PID-hashtables.patch'
        'initcpio-hook-udev'
        'initcpio-install-systemd'
        'initcpio-install-udev')
md5sums=('03efddf8c9eca36d4d590f9967e7e818'
         'e64ade3fffc1e8fc5af0703135b389c4'
         'b619c45b2e973b9bd1cc85a66647a859'
         '5265ac8a57f8b6438effd332c5a38e7e'
         '0d047c3e44076fcefded5c2db31743d7'
         'c5bee064008abf23e5154768681944d2'
         '11f93b3c02c268a16db95f69c3d8c459'
         '43bc34b1e991dca2d9fb8b887e3b2d3d'
         '2e4a5fc2b2cc2e64c3ade2f504763b81'
         'b55c5fb9dccb25085e199afc460ca011'
         'cc16a4ae58eb87a9739f183ed20e2290'
         'be17e74f25c70a2928fe16ce4fdb5a7e'
         '4875226e16a893b82663691c6ae7c922'
         '0180fbe462be9ca6a0da208ccb94844e'
         'c1182aee4a8baaf66d7a6b7a1347d60e'
         '057ef5aa2089f0884151f22e7dbe4ed5'
         '29245f7a240bfba66e2b1783b63b6b40'
         '5e04f468a13ae2b9d6a9dfc77c49a7d1'
         'bde43090d4ac0ef048e3eaee8202a407')

prepare() {
  cd "${pkgname/-selinux}-$pkgver"

  patch -Np1 <../0001-login-fix-pos-array-allocation.patch
  patch -Np1 <../0002-login-set-pos-slot-to-fallback-on-pos-eviction.patch
  patch -Np1 <../0003-login-Allow-calling-org.freedesktop.login1.Seat.Swit.patch
  patch -Np1 <../0004-fix-typo-in-iDRAC-network-interface-name-irdac-idrac.patch
  patch -Np1 <../0007-mount-don-t-send-out-PropertiesChanged-message-if-ac.patch
  patch -Np1 <../0008-mount-don-t-fire-PropertiesChanged-signals-for-mount.patch
  patch -Np1 <../0009-logs-show-fix-corrupt-output-with-empty-messages.patch
  patch -Np1 <../0010-journalctl-refuse-extra-arguments-with-verify-and-si.patch
  patch -Np1 <../0011-cdrom_id-use-the-old-MMC-fallback.patch
  patch -Np1 <../0012-nspawn-fix-detection-of-missing-proc-self-loginuid.patch
  patch -Np1 <../0013-Fix-systemd-stdio-bridge-symlink.patch
  patch -Np1 <../0014-execute-free-directory-path-if-we-fail-to-remove-it-.patch
  patch -Np1 <../0015-journal-assume-that-next-entry-is-after-previous-ent.patch
  patch -Np1 <../0016-journal-forget-file-after-encountering-an-error.patch
  patch -Np1 <../0017-core-correctly-unregister-PIDs-from-PID-hashtables.patch

  autoreconf -fis
}

build() {
  cd "${pkgname/-selinux}-$pkgver"

  ./configure \
      --libexecdir=/usr/lib \
      --localstatedir=/var \
      --sysconfdir=/etc \
      --enable-audit \
      --enable-introspection \
      --enable-gtk-doc \
      --enable-compat-libs \
      --enable-selinux \
      --disable-ima \
      --disable-kdbus \
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
  depends=('acl' 'bash' 'dbus' 'glib2' 'kbd' 'kmod' 'hwids' 'libcap' 'libgcrypt'
           'pam-selinux' 'libseccomp' 'util-linux-selinux' 'xz' 'libselinux')
  provides=("libsystemd=$pkgver" 'nss-myhostname' "systemd-tools=$pkgver" "udev=$pkgver"
            'libgudev-1.0.so' 'libsystemd.so' 'libsystemd-daemon.so' 'libsystemd-id128.so'
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

  # don't write units to /etc by default -- we'll enable the getty on
  # post_install as a sane default.
  rm "$pkgdir/etc/systemd/system/getty.target.wants/getty@tty1.service"
  rm "$pkgdir/etc/systemd/system/multi-user.target.wants/systemd-networkd.service"
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
