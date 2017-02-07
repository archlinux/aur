# Maintainer: Yurii Kolesnykov <yurikoles@gmai.com>
# Credit: Dave Reisner <dreisner@archlinux.org>
# Credit: Tom Gundersen <teg@jklm.no>

pkgbase=systemd-git
pkgname=('systemd-git' 'libsystemd-git' 'systemd-sysvcompat-git')
pkgdesc="systemd from git"
pkgver=232.r752.g1fb857974
pkgrel=1
branch='master'
arch=('i686' 'x86_64')
url="https://www.github.com/systemd/systemd"
makedepends=('acl' 'cryptsetup' 'docbook-xsl' 'gperf' 'lz4' 'xz' 'pam' 'libelf'
             'intltool' 'iptables' 'kmod' 'libcap' 'libidn' 'libgcrypt'
             'libmicrohttpd' 'libxslt' 'util-linux' 'linux-api-headers'
             'python-lxml' 'quota-tools' 'shadow' 'gnu-efi-libs' 'git')
options=('strip' '!distcc' '!ccache')
source=("systemd-git::git://github.com/systemd/systemd.git#branch=${branch}"
		    'initcpio-hook-udev'
        'initcpio-install-systemd'
        'initcpio-install-udev'
        'arch.conf'
        'loader.conf'
        'splash-arch.bmp'::'https://git.archlinux.org/svntogit/packages.git/plain/trunk/splash-arch.bmp?h=packages/systemd'
        'systemd-user.pam'
        'systemd-hwdb.hook'
        'systemd-sysusers.hook'
        'systemd-tmpfiles.hook'
        'systemd-update.hook')
sha512sums=('SKIP'
            'f0d933e8c6064ed830dec54049b0a01e27be87203208f6ae982f10fb4eddc7258cb2919d594cbfb9a33e74c3510cfd682f3416ba8e804387ab87d1a217eb4b73'
            '52af734947a768758d5eb3f18e31a1cfec6699eca6fa10e40b90c7f11991509186c0a696e3490af3eaba80064ea4cb93e041579abf05addf072d294300aa4b28'
            'fec639de0d99967ed3e67289eff5ff78fff0c5829d350e73bed536a8391f1daa1d118d72dbdc1f480ffd33fc22b72f4817d0973bd09ec7f182fd26ad87b24355'
            '61032d29241b74a0f28446f8cf1be0e8ec46d0847a61dadb2a4f096e8686d5f57fe5c72bcf386003f6520bc4b5856c32d63bf3efe7eb0bc0deefc9f68159e648'
            'c416e2121df83067376bcaacb58c05b01990f4614ad9de657d74b6da3efa441af251d13bf21e3f0f71ddcb4c9ea658b81da3d915667dc5c309c87ec32a1cb5a5'
            '5a1d78b5170da5abe3d18fdf9f2c3a4d78f15ba7d1ee9ec2708c4c9c2e28973469bc19386f70b3cf32ffafbe4fcc4303e5ebbd6d5187a1df3314ae0965b25e75'
            'b90c99d768dc2a4f020ba854edf45ccf1b86a09d2f66e475de21fe589ff7e32c33ef4aa0876d7f1864491488fd7edb2682fc0d68e83a6d4890a0778dc2d6fe19'
            '2c1f765e7cefc50f07ad994634ea25d9396e6b9c0de46e58f18377e642a471517a0dbf5eb547070a38c6ecf84ec8e030f650a6cee010871cd7a466a32534adda'
            '9d27d97f172a503f5b7044480a0b9ccc0c4ed5dbb2eb3b2b1aa929332c3bcfe38ef0c0310b6566f23b34f9c05b77035221164a7ab7677784c4a54664f12fca22'
            '0f4efddd25256e09c42b953caeee4b93eb49ecc6eaebf02e616b4dcbfdac9860c3d8a3d1a106325b2ebc4dbc6e08ac46702abcb67a06737227ccb052aaa2a067'
            '10190fba9f39a8f4b620a0829e0ba8ed63bb4dbeca712966011ee7807880d01ab2abff1a80baafeb6674db70526a473fe585db8190e864f318fc4d6068552618')
pkgver() {
  cd "${srcdir}/$pkgbase"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgbase"

  #_validate_tag || return

  if (( ${#_backports[*]} > 0 )); then
    git cherry-pick -n "${_backports[@]}"
  fi

  ./autogen.sh
}

build() {
  cd "$pkgbase"

  local timeservers=({0..3}.arch.pool.ntp.org)

  local configure_options=(
    --libexecdir=/usr/lib
    --localstatedir=/var
    --sysconfdir=/etc

    --enable-lz4
    --enable-gnuefi
    --disable-audit
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

package_systemd-git() {
  pkgdesc="system and service manager"
  license=('GPL2' 'LGPL2.1')
  depends=('acl' 'bash' 'dbus' 'iptables' 'kbd' 'kmod' 'hwids' 'libcap'
           'libgcrypt' 'libsystemd-git' 'libidn' 'lz4' 'pam' 'libelf' 'libseccomp'
           'util-linux' 'xz')
  provides=("systemd=$pkgver" "udev=$pkgver" 'nss-myhostname' "systemd-tools=$pkgver")
  replaces=('systemd' 'nss-myhostname' 'systemd-tools' 'udev')
  conflicts=('systemd' 'nss-myhostname' 'systemd-tools' 'udev' )
  optdepends=('cryptsetup: required for encrypted block devices'
              'libmicrohttpd: remote journald capabilities'
              'quota-tools: kernel-level quota management'
              'systemd-sysvcompat-git: symlink package to provide sysvinit binaries'
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

  make -C "$pkgbase" DESTDIR="$pkgdir" install

  # don't write units to /etc by default. some of these will be re-enabled on
  # post_install.
  rm -r "$pkgdir/etc/systemd/system/"*.wants

  # get rid of RPM macros
  rm -r "$pkgdir/usr/lib/rpm"

  # add back tmpfiles.d/legacy.conf
  install -m644 "$pkgbase/tmpfiles.d/legacy.conf" "$pkgdir/usr/lib/tmpfiles.d"

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

  install -Dm644 "$srcdir/systemd-hwdb.hook" "$pkgdir/usr/share/libalpm/hooks/systemd-hwdb.hook"
  install -Dm644 "$srcdir/systemd-sysusers.hook" "$pkgdir/usr/share/libalpm/hooks/systemd-sysusers.hook"
  install -Dm644 "$srcdir/systemd-tmpfiles.hook" "$pkgdir/usr/share/libalpm/hooks/systemd-tmpfiles.hook"
  install -Dm644 "$srcdir/systemd-update.hook" "$pkgdir/usr/share/libalpm/hooks/systemd-update.hook"

  # overwrite the systemd-user PAM configuration with our own
  install -Dm644 systemd-user.pam "$pkgdir/etc/pam.d/systemd-user"
}

package_libsystemd-git() {
  pkgdesc="systemd client libraries"
  depends=('glibc' 'libcap' 'libgcrypt' 'lz4' 'xz')
  license=('GPL2')
  provides=('libsystemd.so' 'libudev.so' 'libsystemd')
  conflicts=('libsystemd')

  make -C "$pkgbase" DESTDIR="$pkgdir" install-rootlibLTLIBRARIES
}

package_systemd-sysvcompat-git() {
  pkgdesc="sysvinit compat for systemd"
  license=('GPL2')
  groups=('base')
  conflicts=('sysvinit' 'systemd-sysvcompat')
  depends=('systemd-git')
  provides=('systemd-sysvcompat')

  install -dm755 "$pkgdir"/usr/share/man/man8
  cp -d --no-preserve=ownership,timestamp \
    "$pkgbase"/man/{telinit,halt,reboot,poweroff,runlevel,shutdown}.8 \
    "$pkgdir"/usr/share/man/man8

  install -dm755 "$pkgdir/usr/bin"
  for tool in runlevel reboot shutdown poweroff halt telinit; do
    ln -s 'systemctl' "$pkgdir/usr/bin/$tool"
  done

  ln -s '../lib/systemd/systemd' "$pkgdir/usr/bin/init"
}

# vim: ft=sh syn=sh et
