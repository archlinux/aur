# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>
# SELinux Maintainer: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>

pkgbase=systemd-selinux
pkgname=('systemd-selinux' 'libsystemd-selinux' 'systemd-sysvcompat-selinux')
pkgver=212
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/systemd"
groups=('selinux')
makedepends=('acl' 'cryptsetup' 'docbook-xsl' 'gobject-introspection' 'gperf'
             'gtk-doc' 'intltool' 'kmod' 'libcap' 'libgcrypt'  'libmicrohttpd' 'libxslt'
             'libutil-linux' 'linux-api-headers' 'pam-selinux' 'python' 'python-lxml' 'quota-tools' 'xz'
             'libselinux')
options=('strip' 'debug')
source=("http://www.freedesktop.org/software/${pkgname/-selinux}/${pkgname/-selinux}-$pkgver.tar.xz"
        'initcpio-hook-udev'
        'initcpio-install-systemd'
        'initcpio-install-udev')
md5sums=('257a75fff826ff91cb1ce567091cf270'
         '29245f7a240bfba66e2b1783b63b6b40'
         '5e04f468a13ae2b9d6a9dfc77c49a7d1'
         'bde43090d4ac0ef048e3eaee8202a407')

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
           'libsystemd-selinux' 'pam-selinux' 'libseccomp'
           'libutil-linux-selinux' 'xz' 'libselinux')
  provides=('nss-myhostname' "systemd-tools=$pkgver" "udev=$pkgver"
            "${pkgname/-selinux}=${pkgver}-${pkgrel}")
  replaces=('nss-myhostname' 'systemd-tools' 'udev' 'selinux-systemd')
  conflicts=('nss-myhostname' 'systemd-tools' 'udev'
             "${pkgname/-selinux}" 'selinux-systemd')
  optdepends=('python: systemd library bindings'
              'cryptsetup: required for encrypted block devices'
              'libmicrohttpd: systemd-journal-gatewayd'
              'quota-tools: kernel-level quota management'
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

  ### split off runtime libraries
  rm -rf "$srcdir/_libsystemd"
  install -dm755 "$srcdir"/_libsystemd/usr/lib
  cd "$srcdir"/_libsystemd
  mv "$pkgdir"/usr/lib/lib{systemd,{g,}udev}*.so* usr/lib

  # include MIT license, since it's technically custom
  install -Dm644 "$srcdir/${pkgname/-selinux}-$pkgver/LICENSE.MIT" \
      "$pkgdir/usr/share/licenses/systemd/LICENSE.MIT"
}

package_libsystemd-selinux() {
  pkgdesc="systemd client libraries"
  depends=('glib2' 'glibc' 'libgcrypt' 'xz')
  license=('GPL2')
  provides=('libgudev-1.0.so' 'libsystemd.so' 'libsystemd-daemon.so' 'libsystemd-id128.so'
            'libsystemd-journal.so' 'libsystemd-login.so' 'libudev.so'
            "${pkgname/-selinux}=${pkgver}-${pkgrel}")
  conflicts=("${pkgname/-selinux}")

  mv "$srcdir/_libsystemd"/* "$pkgdir"
}

package_systemd-sysvcompat-selinux() {
  pkgdesc="sysvinit compat for systemd"
  license=('GPL2')
  conflicts=('sysvinit' "${pkgname/-selinux}" 'selinux-systemd-sysvcompat')
  depends=('systemd-selinux')
  provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
            "selinux-systemd-sysvcompat=${pkgver}-${pkgrel}")
  replaces=("${pkgname/-selinux}")

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
depends=('acl' 'bash' 'dbus' 'glib2' 'kbd' 'kmod' 'hwids' 'libcap' 'libgcrypt'
         'libsystemd-selinux' 'pam-selinux' 'libseccomp' 'libutil-linux-selinux'
         'util-linux-selinux' 'xz' 'libselinux')
'

# vim: ft=sh syn=sh et
