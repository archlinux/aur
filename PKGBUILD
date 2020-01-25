# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

# When updating, if makepkg reports "dbus is not a clone of https://gitlab.freedesktop.org/dbus/dbus.git",
# you need to update the remotes of the source git repository, for example with the following command:
#   git -C dbus remote set-url origin https://gitlab.freedesktop.org/dbus/dbus.git
pkgbase=dbus-selinux
pkgname=(dbus-selinux dbus-docs-selinux)
pkgver=1.12.16
pkgrel=5
pkgdesc="Freedesktop.org message bus system with SELinux support"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(x86_64)
license=(GPL custom)
groups=('selinux')
# Make sure systemd's hook supports reloading dbus: the following commit was introduced in package systemd 242.84-2
# https://git.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/systemd&id=4e247891655844511c775fba566df270f8d0d55f
depends=('systemd-libs-selinux>=242.84-2' expat audit)
makedepends=(systemd-selinux xmlto docbook-xsl python yelp-tools doxygen git autoconf-archive audit libselinux)
_commit=23cc709db8fab94f11fa48772bff396b20aea8b0  # tags/dbus-1.12.16^0
source=("git+https://gitlab.freedesktop.org/dbus/dbus.git#commit=$_commit"
        dbus-reload.hook)
sha256sums=('SKIP'
            '56d0b5131e030649c6666707aefd67d5c44b6498091f7fdc92dc570b6d6b94fe')
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90'  # Simon McVittie <simon.mcvittie@collabora.co.uk>
              '3C8672A0F49637FE064AC30F52A43A1E4B77B059') # Simon McVittie <simon.mcvittie@collabora.co.uk>

pkgver() {
  cd dbus
  git describe --tags | sed 's/^dbus-//;s/-/+/g'
}

prepare() {
  cd dbus
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd dbus
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/dbus-1.0 \
    runstatedir=/run \
    --with-console-auth-dir=/run/console/ \
    --with-dbus-user=dbus \
    --with-system-pid-file=/run/dbus/pid \
    --with-system-socket=/run/dbus/system_bus_socket \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --enable-inotify \
    --enable-systemd \
    --enable-user-session \
    --disable-static \
    --disable-verbose-mode \
    --disable-asserts \
    --disable-checks \
    --without-x \
    --enable-selinux --enable-libaudit
  make
}

check() {
  make -C dbus check
}

package_dbus-selinux() {
  depends+=(libsystemd.so libaudit.so)
  provides=(libdbus libdbus-1.so libdbus-selinux "${pkgname/-selinux}=${pkgver}-${pkgrel}" "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
  conflicts=(libdbus libdbus-selinux "${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
  replaces=(libdbus libdbus-selinux)

  DESTDIR="$pkgdir" make -C dbus install

  rm -r "$pkgdir"/{etc,var}

  # We have a pre-assigned uid (81)
  echo 'u dbus 81 "System Message Bus"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/dbus.conf"

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 dbus/COPYING

  # Split docs
  mv "$pkgdir/usr/share/doc" "$srcdir"
}

package_dbus-docs-selinux() {
  pkgdesc+=" (documentation)"
  depends=()
  conflicts=("${pkgname/-selinux}")

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 dbus/COPYING
  mv doc "$pkgdir/usr/share"
}

# vim:set sw=2 et:
