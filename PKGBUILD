# Maintainer (Arch): Dave Reisner <dreisner@archlinux.org>
# Maintainer (Arch): Tom Gundersen <teg@jklm.no>
# Maintainer: Márcio Silva <coadde@parabola.nu>
# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>

_pkgbase=systemd
pkgbase=systemd-knock
pkgname=('systemd-knock' 'libsystemd-knock' 'systemd-knock-sysvcompat'
         'libsystemd-knock-standalone' 'libudev-knock' 'nss-knock-myhostname' 'nss-knock-mymachines' 'nss-knock-resolve')
pkgver=230
pkgrel=4.2
arch=('i686' 'x86_64' 'armv7h')
url="http://www.freedesktop.org/wiki/Software/systemd"
makedepends=('acl' 'cryptsetup' 'docbook-xsl' 'gperf' 'lz4' 'xz' 'pam' 'libelf'
             'intltool' 'iptables' 'kmod' 'libcap' 'libidn' 'libgcrypt'
             'libmicrohttpd' 'libxslt' 'util-linux' 'linux-libre-api-headers'
             'python-lxml' 'quota-tools' 'shadow' 'git')
makedepends_i686=('gnu-efi-libs')
makedepends_x86_64=('gnu-efi-libs')
options=('strip' 'debug')
source=("git://github.com/systemd/systemd.git#tag=v$pkgver"
        #'0001-adds-TCP-Stealth-support-to-systemd.patch::https://gnunet.org/sites/default/files/systemd-knock-patch.diff'
        "https://repo.parabola.nu/other/knock/patches/systemd/0001-adds-TCP-Stealth-support-to-systemd-230.patch"{,.sig}
        "https://repo.parabola.nu/other/systemd/splash-parabola.bmp"{,.sig}
        'initcpio-hook-udev'
        'initcpio-install-systemd'
        'initcpio-install-udev'
        'parabola.conf'
        'loader.conf'
        'udev-hwdb.hook'
        '0001-FSDG-man-Refer-to-the-operating-system-as-GNU-Linux.patch'
        '0002-FSDG-os-release-Default-to-PRETTY_NAME-GNU-Linux-ins.patch'
        '0003-FSDG-os-release-Default-to-NAME-GNU-Linux-instead-of.patch'
        '0004-FSDG-os-release-Default-ID-to-gnu-linux-instead-of-l.patch'
        '0005-FSDG-systemd-resolved-Default-to-hostname-gnu-linux-.patch'
        '0006-FSDG-man-Use-FSDG-operating-systems-as-examples.patch'
        "https://repo.parabola.nu/other/systemd/splash-parabola.bmp"{,.sig})
md5sums=('SKIP'
         '32e8e7c8802dac3078a2c4b0e05abd30'
         'SKIP'
         'f8253cd3c0f249591338fbb4c223d249'
         'SKIP'
         '90ea67a7bb237502094914622a39e281'
         '976c5511b6493715e381f43f16cdb151'
         '1b3aa3a0551b08af9305d33f85b5c2fc'
         '36ee74767ac8734dede1cbd0f4f275d7'
         '9b9f4a58e4c4009bf5290c5b297600c3'
         'a475a5ed8f03fb0f6b58b4684998d05c'
         '92a4bb5e527e1e956743c1ffa622adc7'
         '397e2262bf96df3bc1762a3b0bef2f75'
         'e592f6778c12627d46982ddfe0698361'
         'c4c559f9916806f5162ccff3e7c433e8'
         '5166fe700ef5991c2da3876206c699fb'
         '166ce41b60d4eaa7738486f7aab5ebd8'
         'f8253cd3c0f249591338fbb4c223d249'
         'SKIP')
validpgpkeys=(
              '684D54A189305A9CC95446D36B888913DDB59515' # Márcio Silva
              'C92BAA713B8D53D3CAE63FC9E6974752F9704456' # André Silva
)

_backports=(
  # Revert "rules: allow users to access frame buffer devices" (#3333)
  e77813ca9f4e0735fd0e3e2caae4d7d1ee436011

  # {machine,system}ctl: always pass &changes and &n_changes (#3350)
  acc0269cad31d1aaef2034a055b34c07c88a353d

  # systemctl: fix return values on success
  5f056378b0ceffb6e6fba3513f7eae72e2d09dc8

  # automount: handle expire_tokens when the mount unit changes its state (#3434)
  0a62f81045dd810c8f1223cccbac4d706ea2cb45
)

prepare() {
  cd "$_pkgbase"

  if (( ${#_backports[*]} > 0 )); then
    git cherry-pick -n "${_backports[@]}"
  fi

  # apply FSDG and Knock patches
  local patchfile
  for patchfile in "$srcdir"/*.patch; do
    patch -Np1 -i "$patchfile"
  done

  # Rename "Linux Boot Manager" -> "Systemd Boot Manager"
  sed -i 's|Linux Boot Manager|Systemd Boot Manager|' src/boot/bootctl.c

  ./autogen.sh
}

build() {
  cd "$_pkgbase"

  local timeservers=({0..3}.arch.pool.ntp.org)

  if [ "$CARCH" = "armv7h" ]; then
    LDFLAGS+=" -Wl,-fuse-ld=bfd"
    CFLAGS+=" -fno-lto"
    CXXFLAGS+=" -fno-lto"
  fi

  local enable_gnuefi=''
  if [ "$CARCH" != "armv7h" ]; then
    enable_gnuefi='--enable-gnuefi'
  fi

  local configure_options=(
    --libexecdir=/usr/lib
    --localstatedir=/var
    --sysconfdir=/etc

    --enable-lz4
    $enable_gnuefi
    --disable-audit
    --disable-ima
    --enable-tcp-stealth

    --with-sysvinit-path=
    --with-sysvrcnd-path=
    --with-ntp-servers="${timeservers[*]}"
    --with-default-dnssec=no
    --without-kill-user-processes
  )

  ./configure "${configure_options[@]}"

  make

  # Go ahead and split the package now.  It's easier this way, because
  # we can use mv instead of awkward, error-prone rm/cp pairs.
  rm -rf "$srcdir/dest"

  # Put things in the main systemd package by default
  make DESTDIR="$srcdir/dest/systemd" install

  install -dm755 "$srcdir/dest/libsystemd"/usr/{lib/pkgconfig,share/man/man3,include}
  mv -T "$srcdir/dest"/{systemd,libsystemd}/usr/include/systemd
  mv -T "$srcdir/dest"/{systemd,libsystemd}/usr/lib/pkgconfig/libsystemd.pc
  mv "$srcdir/dest"/systemd/usr/lib/libsystemd.so*      -t "$srcdir/dest"/libsystemd/usr/lib/
  mv "$srcdir/dest"/systemd/usr/share/man/man3/{SD,sd}* -t "$srcdir/dest"/libsystemd/usr/share/man/man3/

  install -dm755 "$srcdir/dest/libudev"/usr/{lib/pkgconfig,share/man/man3,include}
  mv -T "$srcdir/dest"/{systemd,libudev}/usr/include/libudev.h
  mv -T "$srcdir/dest"/{systemd,libudev}/usr/lib/pkgconfig/libudev.pc
  mv "$srcdir/dest"/systemd/usr/lib/libudev.so*       -t "$srcdir/dest"/libudev/usr/lib/
  mv "$srcdir/dest"/systemd/usr/share/man/man3/*udev* -t "$srcdir/dest"/libudev/usr/share/man/man3/

  local nssmodule
  for nssmodule in myhostname mymachines resolve; do
    install -dm755 "$srcdir/dest/nss-$nssmodule"/usr/{lib,share/man/man8}
    mv -T "$srcdir/dest"/{systemd,nss-$nssmodule}/usr/share/man/man8/nss-$nssmodule.8
    mv "$srcdir/dest"/systemd/usr/lib/libnss_$nssmodule.so* -t "$srcdir/dest"/nss-$nssmodule/usr/lib/
  done

  install -dm755 "$srcdir/dest/systemd-sysvcompat"/usr/share/man/man8
  mv "$srcdir/dest/systemd"/usr/share/man/man8/{telinit,halt,reboot,poweroff,runlevel,shutdown}.8 \
     -t "$srcdir/dest/systemd-sysvcompat"/usr/share/man/man8

  rmdir "$srcdir/dest"/systemd/usr/{share/man/man3,lib/pkgconfig,include}
}

package_systemd-knock() {
  pkgdesc="system and service manager with support for stealth TCP sockets (Parabola rebranded)"
  license=('GPL2' 'LGPL2.1')
  depends=('acl' 'bash' 'dbus' 'iptables' 'kbd' 'kmod' 'hwids' 'libcap'
           'libgcrypt' 'libsystemd-knock' 'libidn' 'lz4' 'pam' 'libelf' 'libseccomp'
           'util-linux' 'xz')
  provides=("systemd-tools=$pkgver" "udev=$pkgver" "systemd=$pkgver")
  replaces=('systemd-tools' 'udev')
  conflicts=('systemd-tools' 'udev' 'systemd')
  optdepends=('cryptsetup: required for encrypted block devices'
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

  cp -rT -d --no-preserve=ownership,timestamp "$srcdir/dest/$_pkgbase" "$pkgdir"

  # don't write units to /etc by default. some of these will be re-enabled on
  # post_install.
  rm -r "$pkgdir/etc/systemd/system/"*.wants

  # get rid of RPM macros
  rm -r "$pkgdir/usr/lib/rpm"

  # add back tmpfiles.d/legacy.conf
  install -m644 "$_pkgbase/tmpfiles.d/legacy.conf" "$pkgdir/usr/lib/tmpfiles.d"

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

  # add example bootctl configuration
  install -Dm644 "$srcdir/parabola.conf" "$pkgdir"/usr/share/systemd/bootctl/parabola.conf
  install -Dm644 "$srcdir/loader.conf" "$pkgdir"/usr/share/systemd/bootctl/loader.conf
  install -Dm644 "$srcdir/splash-parabola.bmp" "$pkgdir"/usr/share/systemd/bootctl/splash-parabola.bmp

  install -Dm644 "$srcdir/udev-hwdb.hook" "$pkgdir/usr/share/libalpm/hooks/udev-hwdb.hook"
}

package_libsystemd-knock() {
  pkgdesc="systemd client libraries metapackage"
  depends=(libsystemd-knock-standalone libudev-knock nss-knock-myhostname nss-knock-mymachines nss-knock-resolve)
  license=('GPL2')
  provides=("libsystemd=$pkgver")
  conflicts=('libsystemd')
}

package_libsystemd-knock-standalone() {
  pkgdesc="systemd client library"
  depends=('glibc' 'libcap' 'libgcrypt' 'lz4' 'xz')
  license=('GPL2')
  provides=('libsystemd.so' "libsystemd-standalone=$pkgver")
  conflicts=('libsystemd-standalone')

  cp -rT -d --no-preserve=ownership,timestamp "$srcdir/dest/libsystemd" "$pkgdir"
}

package_libudev-knock() {
  pkgdesc="systemd library for enumerating and introspecting local devices"
  depends=('glibc' 'libcap')
  license=('GPL2')
  provides=('libudev.so' "libudev=$pkgver")
  conflicts=('libudev')

  cp -rT -d --no-preserve=ownership,timestamp "$srcdir/dest/${pkgname/-knock/}" "$pkgdir"
}

package_nss-knock-myhostname() {
  pkgdesc="NSS module providing hostname resolution for the locally configured system hostname"
  depends=('glibc' 'libcap')
  license=('GPL2')
  provides=("nss-myhostname=$pkgver")
  conflicts=('nss-myhostname')

  cp -rT -d --no-preserve=ownership,timestamp "$srcdir/dest/${pkgname/-knock/}" "$pkgdir"
}

package_nss-knock-mymachines() {
  pkgdesc="NSS module providing hostname resolution for local systemd-machined container instances"
  depends=('glibc' 'libcap')
  license=('GPL2')
  provides=("nss-mymachines=$pkgver")
  conflicts=('nss-mymachines')

  cp -rT -d --no-preserve=ownership,timestamp "$srcdir/dest/${pkgname/-knock/}" "$pkgdir"
}

package_nss-knock-resolve() {
  pkgdesc="NSS module providing hostname resolution via systemd-resolved"
  depends=('glibc' 'libcap')
  license=('GPL2')
  provides=("nss-resolve=$pkgver")
  conflicts=('nss-resolve')

  cp -rT -d --no-preserve=ownership,timestamp "$srcdir/dest/${pkgname/-knock/}" "$pkgdir"
}

package_systemd-knock-sysvcompat() {
  pkgdesc="sysvinit compat for systemd-knock"
  license=('GPL2')
  provides=("systemd-sysvcompat=$pkgver")
  conflicts=('sysvinit' 'systemd-sysvcompat')
  depends=('systemd-knock')

  cp -rT -d --no-preserve=ownership,timestamp "$srcdir/dest/${pkgname/-knock/}" "$pkgdir"

  install -dm755 "$pkgdir/usr/bin"
  for tool in runlevel reboot shutdown poweroff halt telinit; do
    ln -s 'systemctl' "$pkgdir/usr/bin/$tool"
  done

  ln -s '../lib/systemd/systemd' "$pkgdir/usr/bin/init"
}

# vim: ft=sh syn=sh et
