# Maintainer: Yurii Kolesnykov <yurikoles@gmai.com>
# Credit: Dave Reisner <dreisner@archlinux.org>
# Credit: Tom Gundersen <teg@jklm.no>

pkgbase=systemd-git
_pkgbase=systemd
pkgname=('systemd-git' 'libsystemd-git')
pkgdesc="systemd from git"
pkgver=238.r283.ge64c2d0b5
pkgrel=1
branch='master'
arch=('i686' 'x86_64')
url="https://www.github.com/systemd/systemd"
makedepends=('acl' 'cryptsetup' 'docbook-xsl' 'gperf' 'lz4' 'xz' 'pam' 'libelf'
             'intltool' 'iptables' 'kmod' 'libcap' 'libidn' 'libgcrypt'
             'libmicrohttpd' 'libxslt' 'util-linux' 'linux-api-headers'
             'python-lxml' 'quota-tools' 'shadow' 'gnu-efi-libs' 'git'
             'meson' 'libseccomp' 'pcre2')
options=('strip' '!distcc' '!ccache')
source=('git+https://github.com/systemd/systemd'
        'initcpio-hook-udev'
        'initcpio-install-systemd'
        'initcpio-install-udev'
        'arch.conf'
        'loader.conf'
        'splash-arch.bmp'::'https://git.archlinux.org/svntogit/packages.git/plain/trunk/splash-arch.bmp?h=packages/systemd'
        'systemd-user.pam'
        'systemd-hook'
        'systemd-binfmt.hook'
        'systemd-catalog.hook'
        'systemd-daemon-reload.hook'
        'systemd-hwdb.hook'
        'systemd-sysctl.hook'
        'systemd-sysusers.hook'
        'systemd-tmpfiles.hook'
        'systemd-udev-reload.hook'
        'systemd-update.hook')
sha512sums=('SKIP'
            'f0d933e8c6064ed830dec54049b0a01e27be87203208f6ae982f10fb4eddc7258cb2919d594cbfb9a33e74c3510cfd682f3416ba8e804387ab87d1a217eb4b73'
            '86d7cacd7536b1069c82bbbb08de7ec81e7f0f18a19fc2b06fabe90db4700623eb3540b75121080d325672d92e26912632ae4f93fd3c0bb48eb3e5eedd88352c'
            'a25b28af2e8c516c3a2eec4e64b8c7f70c21f974af4a955a4a9d45fd3e3ff0d2a98b4419fe425d47152d5acae77d64e69d8d014a7209524b75a81b0edb10bf3a'
            '61032d29241b74a0f28446f8cf1be0e8ec46d0847a61dadb2a4f096e8686d5f57fe5c72bcf386003f6520bc4b5856c32d63bf3efe7eb0bc0deefc9f68159e648'
            'c416e2121df83067376bcaacb58c05b01990f4614ad9de657d74b6da3efa441af251d13bf21e3f0f71ddcb4c9ea658b81da3d915667dc5c309c87ec32a1cb5a5'
            '5a1d78b5170da5abe3d18fdf9f2c3a4d78f15ba7d1ee9ec2708c4c9c2e28973469bc19386f70b3cf32ffafbe4fcc4303e5ebbd6d5187a1df3314ae0965b25e75'
            'b90c99d768dc2a4f020ba854edf45ccf1b86a09d2f66e475de21fe589ff7e32c33ef4aa0876d7f1864491488fd7edb2682fc0d68e83a6d4890a0778dc2d6fe19'
            '462ed39bd5c90168079956a402abafe8f0910882e6876b165a2c27af73833d0cad1be9cdbcb3549b34652ea86e5d0dba044946a38797bd533fdd1f5a0083f63b'
            '46f93725bc94381300535737fd0186a3c096fa83661179eab0c450c7b164a87d9a5dd9abcf6ae98bdeb4bf50a4ba4f1944769948c236e4814f166ff03b0ee177'
            '4cff2ebd962e26e2f516d8b4ac45c839dbfa54dd0588b423c224a328b9f7c62306ca7b2f6cb55240c564caf9972d5bcd2e0efaf2de49d64729aeb3bc1560c9eb'
            '872de70325e9798f0b5a77e991c85bd2ab6de24d9b9ba4e35002d2dd5df15f8b30739a0042a624776177ffc14a838cde7ee98622016ed41df3efda9a659730b2'
            '471342b8d0e05533908cda5d6a906050a51e3181beda1239e91d717029ee40a9eaed714996a445417d87c4e31b7f8522a665de176077fe0536d538369594996d'
            '3b11e8956169e6d80eca6e6de1b3e42641454d9d7be48961d400754f2242077d69fb7bfbeb0904f35ce569511036a7c9614a4a1cc3096fba993f46ae65e02895'
            'bf3225011760695040e9f7be2560348e68e86eac0295f5a17a6f7e3dda7ad7c008812a15904e2071b53d5f8048891602c8a9a18608ac64930f2d8cc4fac2a319'
            'ff1429a7c88e21d578c25d07e8cd9568577feb5a940fe39a7a815cf8431c57ca951ac6b394c53d2cdeb4efc645572c0b1b670a48cafcc405db41a6602b548e35'
            'e4a9d7607fe93daf1d45270971c8d8455c4bfc2c0bea8bcad05aeb89847edee23cd1a41073a72042622acf417018fe254f5bfc137604fe2c71292680bf67a1c2'
            '209b01b044877cc986757fa4009a92ea98f480306c2530075d153203c3cd2b3afccab6aacc1453dee8857991e04270572f1700310705d7a0f4d5bed27fab8c67')
pkgver() {
  cd "${srcdir}/$_pkgbase"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {

  local timeservers=({0..3}.arch.pool.ntp.org)

  local meson_options=(
    -Daudit=false
    -Dgnuefi=true
    -Dima=false
    -Dlz4=true

    -Ddbuspolicydir=/usr/share/dbus-1/system.d
    -Ddefault-dnssec=no
    # TODO(dreisner): consider changing this to unified
    -Ddefault-hierarchy=hybrid
    -Ddefault-kill-user-processes=false
    -Dfallback-hostname='archlinux'
    -Dntp-servers="${timeservers[*]}"
    -Drpmmacrosdir=no
    -Dsysvinit-path=
    -Dsysvrcnd-path=
  )

  arch-meson "$_pkgbase" build "${meson_options[@]}"

  ninja -C build
}

check() {
  cd build
  meson test
}

package_systemd-git() {
  pkgdesc="system and service manager from git"
  license=('GPL2' 'LGPL2.1')
  groups=('base-devel')
  depends=('acl' 'bash' 'cryptsetup' 'dbus' 'iptables' 'kbd' 'kmod' 'hwids' 'libcap'
           'libgcrypt' 'libsystemd' 'libidn' 'lz4' 'pam' 'libelf' 'libseccomp'
           'util-linux' 'xz' 'pcre2')
  provides=('nss-myhostname' 'systemd-sysvcompat' "systemd-tools=$pkgver" "udev=$pkgver" "systemd=$pkgver" 'openresolv')
  replaces=('nss-myhostname' 'systemd-tools' 'udev' 'systemd')
  conflicts=('nss-myhostname' 'systemd-tools' 'udev' 'systemd' 'openresolv')
  optdepends=('libmicrohttpd: remote journald capabilities'
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
  install=systemd.install

  DESTDIR="$pkgdir" ninja -C build install

  # don't write units to /etc by default. some of these will be re-enabled on
  # post_install.
  rm -rv "$pkgdir"/etc/systemd/system/*

  # we'll create this on installation
  rmdir "$pkgdir"/var/log/journal/remote

  # runtime libraries shipped with libsystemd
  install -dm755 libsystemd
  mv "$pkgdir"/usr/lib/lib{nss,systemd,udev}*.so* libsystemd

  # manpages shipped with systemd-sysvcompat
  rm "$pkgdir"/usr/share/man/man8/{halt,poweroff,reboot,runlevel,shutdown,telinit}.8

  # executable (symlinks) shipped with systemd-sysvcompat
  rm "$pkgdir"/usr/bin/{halt,init,poweroff,reboot,runlevel,shutdown,telinit}

  # avoid a potential conflict with [core]/filesystem
  rm "$pkgdir"/usr/share/factory/etc/nsswitch.conf
  sed -i '/^C \/etc\/nsswitch\.conf/d' "$pkgdir"/usr/lib/tmpfiles.d/etc.conf

  # add back tmpfiles.d/legacy.conf, normally omitted without sysv-compat
  install -m644 $_pkgbase/tmpfiles.d/legacy.conf "$pkgdir"/usr/lib/tmpfiles.d

  # ship default policy to leave services disabled
  echo 'disable *' >"$pkgdir"/usr/lib/systemd/system-preset/99-default.preset

  # add mkinitcpio hooks
  install -Dm644 initcpio-install-systemd "$pkgdir"/usr/lib/initcpio/install/systemd
  install -Dm644 initcpio-install-udev "$pkgdir"/usr/lib/initcpio/install/udev
  install -Dm644 initcpio-hook-udev "$pkgdir"/usr/lib/initcpio/hooks/udev

  # ensure proper permissions for /var/log/journal
  # The permissions are stored with named group by tar, so this works with
  # users and groups populated by systemd-sysusers. This is only to prevent a
  # warning from pacman as permissions are set by systemd-tmpfiles anyway.
  install -d -o root -g systemd-journal -m 2755 "$pkgdir"/var/log/journal

  # match directory owner/group and mode from [extra]/polkit
  install -d -o root -g 102 -m 750 "$pkgdir"/usr/share/polkit-1/rules.d

  # add example bootctl configuration
  install -Dm644 arch.conf "$pkgdir"/usr/share/systemd/bootctl/arch.conf
  install -Dm644 loader.conf "$pkgdir"/usr/share/systemd/bootctl/loader.conf
  install -Dm644 splash-arch.bmp "$pkgdir"/usr/share/systemd/bootctl/splash-arch.bmp

  # pacman hooks
  install -Dm755 systemd-hook "$pkgdir"/usr/share/libalpm/scripts/systemd-hook
  install -Dm644 -t "$pkgdir"/usr/share/libalpm/hooks *.hook

  # overwrite the systemd-user PAM configuration with our own
  install -Dm644 systemd-user.pam "$pkgdir"/etc/pam.d/systemd-user
}

package_libsystemd-git() {
  pkgdesc="systemd client libraries from git"
  depends=('glibc' 'libcap' 'libgcrypt' 'lz4' 'xz')
  license=('GPL2')
  provides=('libsystemd.so' 'libudev.so' 'libsystemd')
  conflicts=('libsystemd')

  install -dm755 "$pkgdir"/usr
  mv libsystemd "$pkgdir"/usr/lib
}

package_systemd-sysvcompat-git() {
  pkgdesc="sysvinit compat for systemd from git"
  license=('GPL2')
  groups=('base')
  conflicts=('sysvinit')
  depends=('systemd-git')

  install -Dm644 -t "$pkgdir"/usr/share/man/man8 \
    build/man/{telinit,halt,reboot,poweroff,runlevel,shutdown}.8

  install -dm755 "$pkgdir"/usr/bin
  ln -s ../lib/systemd/systemd "$pkgdir"/usr/bin/init
  for tool in runlevel reboot shutdown poweroff halt telinit; do
    ln -s systemctl "$pkgdir"/usr/bin/$tool
  done
}

