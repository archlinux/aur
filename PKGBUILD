# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>

pkgbase=systemd-selinux
pkgname=('systemd-selinux' 'libsystemd-selinux' 'systemd-sysvcompat-selinux')
pkgver=231
pkgrel=4
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/systemd"
groups=('selinux')
makedepends=('acl' 'cryptsetup' 'docbook-xsl' 'gperf' 'lz4' 'xz' 'pam-selinux' 'libelf'
             'intltool' 'iptables' 'kmod' 'libcap' 'libidn' 'libgcrypt'
             'libmicrohttpd' 'libxslt' 'util-linux' 'linux-api-headers'
             'python-lxml' 'quota-tools' 'shadow-selinux' 'gnu-efi-libs' 'git'
             'libselinux')
options=('strip' 'debug')
# Retrieve the splash-arch.bmp image from systemd package sources, as this
# file is too big to fit in the AUR.
source=("git://github.com/systemd/systemd.git#tag=v$pkgver"
        'initcpio-hook-udev'
        'initcpio-install-systemd'
        'initcpio-install-udev'
        'arch.conf'
        'loader.conf'
        'splash-arch.bmp::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/splash-arch.bmp?h=packages/systemd&id=e43ddb71a5b1ab56e898347a63e54c5d5d07728a'
        'udev-hwdb.hook')
md5sums=('SKIP'
         '90ea67a7bb237502094914622a39e281'
         '55ea7d81c02d090b65c42a88f1a5a21a'
         '1b3aa3a0551b08af9305d33f85b5c2fc'
         '20ead378f5d6df4b2a3e670301510a7d'
         'ddaef54f68f6c86c6c07835fc668f62a'
         '1e2f9a8b0fa32022bf0a8f39123e5f4e'
         'a475a5ed8f03fb0f6b58b4684998d05c')

_backports=(
  '531ac2b2349da02acc9c382849758e07eb92b020'  # If the notification message length is 0, ignore the message
  '8523bf7dd514a3a2c6114b7b8fb8f308b4f09fc4'  # pid1: process zero-length notification messages again
  '9987750e7a4c62e0eb8473603150596ba7c3a015'  # pid1: don't return any error in manager_dispatch_notify_fd()
  'bd64d82c1c0e3fe2a5f9b3dd9132d62834f50b2d'  # Revert "pid1: reconnect to the console before being re-executed"
  'bd5b9f0a12dd9c1947b11534e99c395ddf44caa9'  # systemctl: suppress errors with "show" for nonexistent units and properties
)

prepare() {
  cd "${pkgbase/-selinux}"

  if (( ${#_backports[*]} > 0 )); then
    git cherry-pick -n "${_backports[@]}"
  fi

  ./autogen.sh
}

build() {
  cd "${pkgbase/-selinux}"

  local timeservers=({0..3}.arch.pool.ntp.org)

  local configure_options=(
    --libexecdir=/usr/lib
    --localstatedir=/var
    --sysconfdir=/etc

    --enable-audit
    --enable-lz4
    --enable-gnuefi
    --enable-selinux
    --disable-ima

    --with-sysvinit-path=
    --with-sysvrcnd-path=
    --with-ntp-servers="${timeservers[*]}"
    --with-default-dnssec=no
    --with-dbuspolicydir=/usr/share/dbus-1/system.d
    --without-kill-user-processes
  )

  ./configure "${configure_options[@]}"

  make
}

package_systemd-selinux() {
  pkgdesc="system and service manager with SELinux support"
  license=('GPL2' 'LGPL2.1')
  depends=('acl' 'bash' 'dbus' 'iptables' 'kbd' 'kmod' 'hwids' 'libcap'
           'libgcrypt' 'libsystemd-selinux' 'libidn' 'lz4' 'pam-selinux' 'libelf' 'libseccomp'
           'util-linux-selinux' 'xz' 'audit' 'libselinux')
  provides=('nss-myhostname' "systemd-tools=$pkgver" "udev=$pkgver"
            "${pkgname/-selinux}=${pkgver}-${pkgrel}")
  replaces=('nss-myhostname' 'systemd-tools' 'udev' 'selinux-systemd')
  conflicts=('nss-myhostname' 'systemd-tools' 'udev'
             "${pkgname/-selinux}" 'selinux-systemd')
  optdepends=('cryptsetup: required for encrypted block devices'
              'libmicrohttpd: remote journald capabilities'
              'quota-tools: kernel-level quota management'
              'systemd-sysvcompat: symlink package to provide sysvinit binaries'
              'polkit: allow administration as unprivileged user')
  backup=(etc/pam.d/systemd-user
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

  make -C "${pkgbase/-selinux}" DESTDIR="$pkgdir" install

  # don't write units to /etc by default. some of these will be re-enabled on
  # post_install.
  rm -r "$pkgdir/etc/systemd/system/"*.wants

  # get rid of RPM macros
  rm -r "$pkgdir/usr/lib/rpm"

  # add back tmpfiles.d/legacy.conf
  install -m644 "${pkgbase/-selinux}/tmpfiles.d/legacy.conf" "$pkgdir/usr/lib/tmpfiles.d"

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

  ### manpages shipped with systemd-sysvcompat
  rm "$pkgdir"/usr/share/man/man8/{telinit,halt,reboot,poweroff,runlevel,shutdown}.8

  ### runtime libraries shipped with libsystemd
  rm "$pkgdir"/usr/lib/lib{nss,systemd,udev}*.so*

  # add example bootctl configuration
  install -Dm644 "$srcdir/arch.conf" "$pkgdir"/usr/share/systemd/bootctl/arch.conf
  install -Dm644 "$srcdir/loader.conf" "$pkgdir"/usr/share/systemd/bootctl/loader.conf
  install -Dm644 "$srcdir/splash-arch.bmp" "$pkgdir"/usr/share/systemd/bootctl/splash-arch.bmp

  install -Dm644 "$srcdir/udev-hwdb.hook" "$pkgdir/usr/share/libalpm/hooks/udev-hwdb.hook"
}

package_libsystemd-selinux() {
  pkgdesc="systemd client libraries with SELinux support"
  depends=('glibc' 'libcap' 'libgcrypt' 'lz4' 'xz')
  license=('GPL2')
  provides=('libsystemd.so' 'libudev.so'
            "${pkgname/-selinux}=${pkgver}-${pkgrel}")
  conflicts=("${pkgname/-selinux}")

  # TODO(dreisner): for v232, this should be install-rootlibLTLIBRARIES.
  make -C "${pkgbase/-selinux}" DESTDIR="$pkgdir" install-libLTLIBRARIES
}

package_systemd-sysvcompat-selinux() {
  pkgdesc="sysvinit compat for systemd with SELinux support"
  license=('GPL2')
  conflicts=('sysvinit' "${pkgname/-selinux}" 'selinux-systemd-sysvcompat')
  depends=('systemd-selinux')
  provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
            "selinux-systemd-sysvcompat=${pkgver}-${pkgrel}")
  replaces=("${pkgname/-selinux}")

  install -dm755 "$pkgdir"/usr/share/man/man8
  cp -d --no-preserve=ownership,timestamp \
    "${pkgbase/-selinux}"/man/{telinit,halt,reboot,poweroff,runlevel,shutdown}.8 \
    "$pkgdir"/usr/share/man/man8

  install -dm755 "$pkgdir/usr/bin"
  for tool in runlevel reboot shutdown poweroff halt telinit; do
    ln -s 'systemctl' "$pkgdir/usr/bin/$tool"
  done

  ln -s '../lib/systemd/systemd' "$pkgdir/usr/bin/init"
}

# vim: ft=sh syn=sh et
