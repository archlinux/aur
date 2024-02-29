# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>

pkgbase=dbus-xdg
pkgname=(
  dbus-xdg-elogind
  dbus-xdg-docs
)
pkgver=1.14.10
pkgrel=2
pkgdesc="Freedesktop.org message bus system - without creating a ~/.dbus directory (for non-systemd systems)"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(x86_64)
license=("AFL-2.1 OR GPL-2.0-or-later")
depends=(
  audit
  libcap-ng
  expat
  libelogind
  libx11
)
makedepends=(
  docbook-xsl
  doxygen
  python
  elogind
  xmlto
  yelp-tools
)
source=(
  https://dbus.freedesktop.org/releases/dbus/dbus-$pkgver.tar.xz
  dbus-enable-elogind.patch
  no-fatal-warnings.diff
  dbus-launch-Move-dbus-autolaunch-stuff-to-runuser.patch
)
b2sums=('f605b0810dcde6a0753384927131e7f4675be737ad7506a51261717c2622e74b99ac33cc2c199b98e5aa6b9d7c68ef692b8ee9f684f6fdab8d06c6fa861a6f6b'
        'c9ef41ff7b31af6cbaf28ca16974fb62aa0f2492f1c6970b41216758768d1139d2ce9aabbb3aff952d625b0decd1e8c2b25f79bb0a13c146aa9453dd4f7b5c5a'
        '1f14c134f0511b7bd8e2dc71f665a6e6e23f0addd944888c6f956d4f29c7caa962aa05fdbe9a10d500a28751ba635168248ae7609c269e03e00366b85d5d488f'
        '1e956a19a10198c2c1588577cbdb1cb770abacc1766d3973623c327d55f6d3f43a7560370b523023c94e9b8af82090a4e8f270f97db748465ed7d004a8b01c22')
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90') # Simon McVittie <simon.mcvittie@collabora.co.uk>

provides=('dbus' 'dbus-docs')
conflicts=('dbus' 'dbus-docs' 'systemd')

prepare() {
  cd dbus-$pkgver
  patch -Np 1 -i ../dbus-enable-elogind.patch
  # Allow us to enable checks without them being fatal
  git apply -3 ../no-fatal-warnings.diff
  patch -p1 -i ../dbus-launch-Move-dbus-autolaunch-stuff-to-runuser.patch

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
    --without-systemdsystemunitdir
    --enable-inotify
    --enable-libaudit
    --disable-systemd
    --disable-user-session
    --enable-xml-docs
    --enable-doxygen-docs
    --enable-ducktype-docs
    --disable-static
    --enable-elogind
    --enable-x11-autolaunch
  )

  cd dbus-$pkgver
  ./configure "${configure_options[@]}"
  make
}

# check() {
#   make -C dbus-$pkgver -j1 check
# }

package_dbus-xdg-elogind() {
  depends+=(
    libaudit.so
    libcap-ng.so
    libexpat.so
    libelogind.so
  )
  provides=(
    libdbus
    libdbus-1.so
  )
  conflicts=(libdbus)
  replaces=(libdbus)

  cd dbus-$pkgver
  DESTDIR="$pkgdir" make install

  rm -r "$pkgdir"/{etc,var}

  # Split docs
  mkdir -p docs/usr/share
  mv {"$pkgdir",docs}/usr/share/docs || echo firstmv

  # We have a pre-assigned uid (81)
  echo 'u dbus 81 "System Message Bus"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/dbus.conf"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}

package_dbus-xdg-docs() {
  pkgdesc+=" - Documentation"
  depends=()

  mv "$srcdir"/dbus-"$pkgver"/docs/* "$pkgdir"
}

# vim:set sw=2 et:
