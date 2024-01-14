# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.
#
# This PKGBUILD does not build a variant for dbus-daemon-units, as there is nothing specific to SELinux there

pkgbase=dbus-selinux
pkgname=(
  dbus-selinux
  dbus-docs-selinux
)
pkgver=1.14.10
pkgrel=2
pkgdesc="Freedesktop.org message bus system with SELinux support"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(x86_64 aarch64)
license=("AFL-2.1 OR GPL-2.0-or-later")
groups=(selinux)
depends=(
  audit
  libcap-ng
  expat
  libselinux
  'systemd-libs-selinux>=242.84-2'
)
makedepends=(
  docbook-xsl
  doxygen
  python
  systemd-selinux
  xmlto
  yelp-tools
)
source=(
  https://dbus.freedesktop.org/releases/dbus/dbus-$pkgver.tar.xz{,.asc}
  dbus-reload.hook
)
b2sums=('f605b0810dcde6a0753384927131e7f4675be737ad7506a51261717c2622e74b99ac33cc2c199b98e5aa6b9d7c68ef692b8ee9f684f6fdab8d06c6fa861a6f6b'
        'SKIP'
        '05ab81bf72e7cf45ad943f5b84eaecef4f06bed94979c579a3e23134cbabd7ea6f65fa9ac252f8b43ceb4a3295e0d2325f06560a044fe7ddf125fc30dfc2b7e2')
validpgpkeys=(
  DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90  # Simon McVittie <simon.mcvittie@collabora.co.uk>
)

prepare() {
  cd dbus-$pkgver
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --libexecdir=/usr/lib/dbus-1.0
    --runstatedir=/run
    --with-console-auth-dir=/run/console/
    --with-dbus-user=dbus
    --with-system-pid-file=/run/dbus/pid
    --with-system-socket=/run/dbus/system_bus_socket
    --with-systemdsystemunitdir=/usr/lib/systemd/system
    --enable-inotify
    --enable-libaudit
    --enable-systemd
    --enable-user-session
    --enable-xml-docs
    --enable-doxygen-docs
    --enable-ducktype-docs
    --disable-static
    --without-x
    --enable-selinux
  )

  cd dbus-$pkgver
  ./configure "${configure_options[@]}"
  make
}

check() {
  make -C dbus-$pkgver -j1 check
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_dbus-selinux() {
  depends+=(
    libaudit.so
    libcap-ng.so
    libexpat.so
    libsystemd.so
  )
  provides=(
    libdbus
    libdbus-1.so
    libdbus-selinux 
    "${pkgname/-selinux}=${pkgver}-${pkgrel}"
    "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}"
  )
  conflicts=(libdbus libdbus-selinux "${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
  replaces=(libdbus libdbus-selinux)

  cd dbus-$pkgver
  DESTDIR="$pkgdir" make install

  rm -r "$pkgdir"/{etc,var}

  _pick unit "$pkgdir"/usr/lib/systemd/{system,user}/dbus.service
  _pick docs "$pkgdir"/usr/share/doc

  # We have a pre-assigned uid (81)
  echo 'u dbus 81 "System Message Bus"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/dbus.conf"

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 ../*.hook

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}

package_dbus-docs-selinux() {
  pkgdesc+=" - Documentation"
  depends=()
  conflicts=("${pkgname/-selinux}")

  mv docs/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
