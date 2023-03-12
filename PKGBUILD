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
pkgver=1.14.6
pkgrel=1
pkgdesc="Freedesktop.org message bus system - but do not create a ~/.dbus directory (for non-systemd systems)"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(x86_64)
license=(
  GPL
  custom
)
depends=(
  audit
  expat
  libelogind
)
makedepends=(
autoconf-archive
  docbook-xsl
  doxygen
  git
  python
  elogind
  xmlto
  yelp-tools
)
source=(
  "git+https://gitlab.freedesktop.org/dbus/dbus.git?signed#tag=dbus-$pkgver"
  dbus-enable-elogind.patch
  no-fatal-warnings.diff
  dbus-launch-Move-dbus-autolaunch-stuff-to-runuser.patch
)
b2sums=('SKIP'
        'c9ef41ff7b31af6cbaf28ca16974fb62aa0f2492f1c6970b41216758768d1139d2ce9aabbb3aff952d625b0decd1e8c2b25f79bb0a13c146aa9453dd4f7b5c5a'
        '1f14c134f0511b7bd8e2dc71f665a6e6e23f0addd944888c6f956d4f29c7caa962aa05fdbe9a10d500a28751ba635168248ae7609c269e03e00366b85d5d488f'
        '1e956a19a10198c2c1588577cbdb1cb770abacc1766d3973623c327d55f6d3f43a7560370b523023c94e9b8af82090a4e8f270f97db748465ed7d004a8b01c22')
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90') # Simon McVittie <simon.mcvittie@collabora.co.uk>

provides=('dbus' 'dbus-docs')
conflicts=('dbus' 'dbus-docs')

prepare() {
  cd dbus
  patch -Np 1 -i ../dbus-enable-elogind.patch
  # Allow us to enable checks without them being fatal
  git apply -3 ../no-fatal-warnings.diff
  patch -p1 -i ../dbus-launch-Move-dbus-autolaunch-stuff-to-runuser.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/dbus-1.0 \
    --runstatedir=/run \
    --with-console-auth-dir=/run/console/ \
    --with-dbus-user=dbus \
    --with-system-pid-file=/run/dbus/pid \
    --with-system-socket=/run/dbus/system_bus_socket \
    --without-systemdsystemunitdir \
    --enable-inotify \
    --enable-libaudit \
    --disable-systemd \
    --disable-user-session \
    --enable-xml-docs \
    --enable-doxygen-docs \
    --enable-ducktype-docs \
    --disable-static \
    --enable-elogind \
    --enable-x11-autolaunch
  )

  cd dbus
  ./configure "${configure_options[@]}"
}

# check() {
#   make -C dbus -j1 check
# }

package_dbus-xdg-elogind() {
  depends+=(
    libaudit.so
    libelogind.so
  )
  provides=(
    libdbus
    libdbus-1.so
  )
  conflicts=(libdbus)
  replaces=(libdbus)



  DESTDIR="$pkgdir" make -C dbus install

  rm -r "$pkgdir"/{etc,var}

  # We have a pre-assigned uid (81)
  echo 'u dbus 81 "System Message Bus"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/dbus.conf"

  # Split docs
  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 dbus/COPYING
}

package_dbus-xdg-docs() {
  pkgdesc+=" - Documentation"
  depends=()

  mv doc/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 dbus/COPYING
}

# vim:set sw=2 et:
