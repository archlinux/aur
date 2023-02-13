# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
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
pkgver=1.14.6
pkgrel=1
pkgdesc="Freedesktop.org message bus system with SELinux support"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(x86_64 aarch64)
license=(GPL custom)
groups=(selinux)
# Make sure systemd's hook supports reloading dbus: the following commit was introduced in package systemd 242.84-2
# https://git.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/systemd&id=4e247891655844511c775fba566df270f8d0d55f
# https://github.com/archlinux/svntogit-packages/commit/4e247891655844511c775fba566df270f8d0d55f
depends=('systemd-libs-selinux>=242.84-2' expat audit)
makedepends=(systemd-selinux xmlto docbook-xsl python yelp-tools doxygen git autoconf-archive audit libselinux)
source=("git+https://gitlab.freedesktop.org/dbus/dbus.git?signed#tag=dbus-$pkgver"
        dbus-reload.hook no-fatal-warnings.diff)
sha256sums=('SKIP'
            'd636205622d0ee3b0734360225739ef0c7ad2468a09489e6ef773d88252960f3'
            'c10395be67e1127a58d7173b587fbbf16f8a8b271c41293558fcf9e27c185478')
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90') # Simon McVittie <simon.mcvittie@collabora.co.uk>

prepare() {
  cd dbus

  # Allow us to enable checks without them being fatal
  git apply -3 ../no-fatal-warnings.diff

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd dbus
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/dbus-1.0 \
    --runstatedir=/run \
    --with-console-auth-dir=/run/console/ \
    --with-dbus-user=dbus \
    --with-system-pid-file=/run/dbus/pid \
    --with-system-socket=/run/dbus/system_bus_socket \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --enable-inotify \
    --enable-libaudit \
    --enable-systemd \
    --enable-user-session \
    --enable-xml-docs \
    --enable-doxygen-docs \
    --enable-ducktype-docs \
    --disable-static \
    --without-x \
    --enable-selinux --enable-libaudit
  make
}

check() {
  make -C dbus -j1 check
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

  # Split docs
  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 dbus/COPYING
}

package_dbus-docs-selinux() {
  pkgdesc+=" (documentation)"
  depends=()
  conflicts=("${pkgname/-selinux}")

  mv doc/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 dbus/COPYING
}

# vim:set sw=2 sts=-1 et:
