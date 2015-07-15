# Maintainer (Arch): Dave Reisner <dreisner@archlinux.org>
# Maintainer (Arch): Tom Gundersen <teg@jklm.no>
# Maintainer: Márcio Silva <coadde@parabola.nu>
# Maintainer: André Silva <emulatorman@parabola.nu>

_pkgbase=systemd
pkgbase=systemd-knock
pkgname=('systemd-knock' 'libsystemd-knock' 'systemd-knock-sysvcompat')
pkgver=221
pkgrel=2.1
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/systemd"
makedepends=('acl' 'cryptsetup' 'docbook-xsl' 'gperf' 'lz4' 'xz' 'pam'
             'intltool' 'iptables' 'kmod' 'libcap' 'libidn' 'libgcrypt'
             'libmicrohttpd' 'libxslt' 'util-linux' 'linux-libre-api-headers'
             'python' 'python-lxml' 'quota-tools' 'shadow' 'gnu-efi-libs' 'git')
options=('strip' 'debug')
source=("git://github.com/systemd/systemd.git#tag=v$pkgver"
        #'0001-adds-TCP-Stealth-support-to-systemd.patch::https://gnunet.org/sites/default/files/systemd-knock-patch.diff'
        "https://repo.parabola.nu/other/knock/patches/systemd/0001-adds-TCP-Stealth-support-to-systemd-221.patch"
        "https://repo.parabola.nu/other/systemd-knock/splash-parabola.bmp"
        'initcpio-hook-udev'
        'initcpio-install-systemd'
        'initcpio-install-udev'
        'parabola.conf'
        'loader.conf')
md5sums=('SKIP'
         '936208db8995db77efbb388735f950af'
         'db7c5e4aaa501c1af4301e011f4f5966'
         '90ea67a7bb237502094914622a39e281'
         '976c5511b6493715e381f43f16cdb151'
         'bde43090d4ac0ef048e3eaee8202a407'
         '36ee74767ac8734dede1cbd0f4f275d7'
         '9b9f4a58e4c4009bf5290c5b297600c3')

prepare() {
  cd "$_pkgbase"

  # pam_systemd: Properly check kdbus availability
  # https://github.com/systemd/systemd/commit/c5d452bb228e
  git cherry-pick -n c5d452bb228e

  # udevd: suppress warning if we don't find cgroup
  # https://github.com/systemd/systemd/commit/11b9fb15be96
  git cherry-pick -n 11b9fb15be96

  # core: fix reversed dependency check in unit_check_unneeded
  # https://github.com/systemd/systemd/commit/084918ba41ac
  git cherry-pick -n 084918ba41ac

  # rules: remove all power management from udev
  # https://github.com/systemd/systemd/commit/e2452eef02a8
  git cherry-pick -n e2452eef02a8

  # logind: fix delayed execution regression
  # https://github.com/systemd/systemd/commit/418b22b88f79
  git cherry-pick -n 418b22b88f79

  # bus-proxy: never apply policy when sending signals
  # https://github.com/systemd/systemd/commit/3723263f4989
  git cherry-pick -n 3723263f4989

  patch -Np1 <../0001-adds-TCP-Stealth-support-to-systemd-221.patch

  ./autogen.sh
}

build() {
  cd "$_pkgbase"

  local timeservers=({0..3}.arch.pool.ntp.org)

  ./configure \
      --libexecdir=/usr/lib \
      --localstatedir=/var \
      --sysconfdir=/etc \
      --enable-lz4 \
      --enable-compat-libs \
      --enable-gnuefi \
      --enable-tcp-stealth \
      --disable-audit \
      --disable-ima \
      --disable-kdbus \
      --with-sysvinit-path= \
      --with-sysvrcnd-path= \
      --with-ntp-servers="${timeservers[*]}"

  make
}

package_systemd-knock() {
  pkgdesc="system and service manager with support for stealth TCP sockets (Parabola rebranded)"
  license=('GPL2' 'LGPL2.1')
  depends=('acl' 'bash' 'dbus' 'glib2' 'iptables' 'kbd' 'kmod' 'hwids' 'libcap'
           'libgcrypt' 'libsystemd-knock' 'libidn' 'lz4' 'pam' 'libseccomp' 'util-linux'
           'xz')
  provides=('nss-myhostname' "systemd-tools=$pkgver" "udev=$pkgver" "systemd=$pkgver")
  replaces=('nss-myhostname' 'systemd-tools' 'udev')
  conflicts=('nss-myhostname' 'systemd-tools' 'udev' 'systemd')
  optdepends=('python: systemd library bindings'
              'cryptsetup: required for encrypted block devices'
              'libmicrohttpd: remote journald capabilities'
              'quota-tools: kernel-level quota management'
              'systemd-knock-sysvcompat: symlink package to provide sysvinit binaries'
              'polkit: allow administration as unprivileged user')
  backup=(etc/dbus-1/system.d/org.freedesktop.systemd1.conf
          etc/dbus-1/system.d/org.freedesktop.hostname1.conf
          etc/dbus-1/system.d/org.freedesktop.login1.conf
          etc/dbus-1/system.d/org.freedesktop.locale1.conf
          etc/dbus-1/system.d/org.freedesktop.machine1.conf
          etc/dbus-1/system.d/org.freedesktop.timedate1.conf
          etc/dbus-1/system.d/org.freedesktop.import1.conf
          etc/dbus-1/system.d/org.freedesktop.network1.conf
          etc/pam.d/systemd-user
          etc/systemd/bootchart.conf
          etc/systemd/coredump.conf
          etc/systemd/journald.conf
          etc/systemd/journal-remote.conf
          etc/systemd/journal-upload.conf
          etc/systemd/logind.conf
          etc/systemd/system.conf
          etc/systemd/timesyncd.conf
          etc/systemd/resolved.conf
          etc/systemd/user.conf
          etc/udev/udev.conf)
  install="systemd.install"

  make -C "$_pkgbase" DESTDIR="$pkgdir" install

  # don't write units to /etc by default. some of these will be re-enabled on
  # post_install.
  rm -r "$pkgdir/etc/systemd/system/"*.wants

  # get rid of RPM macros
  rm -r "$pkgdir/usr/lib/rpm"

  # add back tmpfiles.d/legacy.conf
  install -m644 "systemd/tmpfiles.d/legacy.conf" "$pkgdir/usr/lib/tmpfiles.d"

  # Replace dialout/tape/cdrom group in rules with uucp/storage/optical group
  sed -i 's#GROUP="dialout"#GROUP="uucp"#g;
          s#GROUP="tape"#GROUP="storage"#g;
          s#GROUP="cdrom"#GROUP="optical"#g' "$pkgdir"/usr/lib/udev/rules.d/*.rules
  sed -i 's/dialout/uucp/g;
          s/tape/storage/g;
          s/cdrom/optical/g' "$pkgdir"/usr/lib/sysusers.d/basic.conf

  # add mkinitcpio hooks
  install -Dm644 "$srcdir/initcpio-install-systemd" "$pkgdir/usr/lib/initcpio/install/systemd"
  install -Dm644 "$srcdir/initcpio-install-udev" "$pkgdir/usr/lib/initcpio/install/udev"
  install -Dm644 "$srcdir/initcpio-hook-udev" "$pkgdir/usr/lib/initcpio/hooks/udev"

  # ensure proper permissions for /var/log/journal. This is only to placate
  chown root:systemd-journal "$pkgdir/var/log/journal"
  chmod 2755 "$pkgdir/var/log/journal"

  # we'll create this on installation
  rmdir "$pkgdir/var/log/journal/remote"

  # fix pam file
  sed 's|system-auth|system-login|g' -i "$pkgdir/etc/pam.d/systemd-user"

  # ship default policy to leave services disabled
  echo 'disable *' >"$pkgdir"/usr/lib/systemd/system-preset/99-default.preset

  ### split out manpages for sysvcompat
  rm -rf "$srcdir/_sysvcompat"
  install -dm755 "$srcdir"/_sysvcompat/usr/share/man/man8/
  mv "$pkgdir"/usr/share/man/man8/{telinit,halt,reboot,poweroff,runlevel,shutdown}.8 \
     "$srcdir"/_sysvcompat/usr/share/man/man8

  ### split off runtime libraries
  rm -rf "$srcdir/_libsystemd"
  install -dm755 "$srcdir"/_libsystemd/usr/lib
  cd "$srcdir"/_libsystemd
  mv "$pkgdir"/usr/lib/lib{systemd,udev}*.so* usr/lib

  # add example bootctl configuration
  install -Dm644 "$srcdir/parabola.conf" "$pkgdir"/usr/share/systemd/bootctl/parabola.conf
  install -Dm644 "$srcdir/loader.conf" "$pkgdir"/usr/share/systemd/bootctl/loader.conf
  install -Dm644 "$srcdir/splash-parabola.bmp" "$pkgdir"/usr/share/systemd/bootctl/splash-parabola.bmp
}

package_libsystemd-knock() {
  pkgdesc="systemd client libraries with support for stealth TCP sockets"
  depends=('glib2' 'glibc' 'libgcrypt' 'lz4' 'xz')
  license=('GPL2')
  provides=('libsystemd.so' 'libsystemd-daemon.so' 'libsystemd-id128.so'
            'libsystemd-journal.so' 'libsystemd-login.so' 'libudev.so' "libsystemd=$pkgver")
  conflicts=('libsystemd')

  mv "$srcdir/_libsystemd"/* "$pkgdir"
}

package_systemd-knock-sysvcompat() {
  pkgdesc="sysvinit compat for systemd-knock"
  license=('GPL2')
  provides=("systemd-sysvcompat=$pkgver")
  conflicts=('sysvinit' 'systemd-sysvcompat')
  depends=('systemd-knock')

  mv "$srcdir/_sysvcompat"/* "$pkgdir"

  install -dm755 "$pkgdir/usr/bin"
  for tool in runlevel reboot shutdown poweroff halt telinit; do
    ln -s 'systemctl' "$pkgdir/usr/bin/$tool"
  done

  ln -s '../lib/systemd/systemd' "$pkgdir/usr/bin/init"
}

# vim: ft=sh syn=sh et
