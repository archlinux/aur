# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
pkgname=(
  modemmanager-dev
  libmm-glib-dev
)
pkgver=1.23.95_dev
_commit=0743d88d4261eee18445799c552fff92debfaef1
pkgrel=1
pkgdesc="Mobile broadband modem management service"
url="https://www.freedesktop.org/wiki/Software/ModemManager/"
arch=(x86_64)
license=('GPL-2.0-or-later AND LGPL-2.1-or-later')
depends=(
  libgudev
  libmbim-dev
  libqmi-dev
  mobile-broadband-provider-info
  polkit
  ppp
  systemd
)
makedepends=(
  bash-completion
  gi-docgen
  git
  glib2
  glib2-devel
  gobject-introspection
  meson
  vala
)
checkdepends=(
  python-dbus
  python-gobject
)
source=(git+https://gitlab.freedesktop.org/mobile-broadband/ModemManager.git#commit=$_commit)
b2sums=('599ed2aca7371f1328122dad272362b687a75affcc8399b4ca0ea3e5f06802ffee805ca7433dafdc7cb7325a191ad65618950381c8d9ae545be8068c805fb8a8')
validpgpkeys=(
  A814D09B9C5BC01945A64308AECE0239C6606AD5 # Aleksander Morgado <aleksandermj@chromium.org>
)

build() {
  local meson_options=(
    -D dbus_policy_dir=/usr/share/dbus-1/system.d
    -D dist_version="\"${pkgver//_/-}-$pkgrel\""
    -D gtk_doc=false
    -D polkit=permissive
    -D vapi=true
  )

  arch-meson ModemManager build "${meson_options[@]}"
  meson compile -C build
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

package_modemmanager-dev() {
  depends+=(
    libgudev-1.0.so
    libg{lib,object,io,module}-2.0.so
    libmbim-glib.so
    libmm-glib.so
    libqmi-glib.so
    libsystemd.so
  )
  optdepends=(
    'usb_modeswitch: install if your modem shows up as a storage drive'
  )
  provides=(modemmanager)
  conflicts=(modemmanager)

  meson install -C build --destdir "$pkgdir"
  rm "$pkgdir"/usr/share/ModemManager/fcc-unlock.available.d/14c3:4d75

  cd "$pkgdir"
  _pick libmm usr/include
  _pick libmm usr/lib/girepository-1.0
  _pick libmm usr/lib/libmm-glib.so*
  _pick libmm usr/lib/pkgconfig
  _pick libmm usr/share/gir-1.0
  _pick libmm usr/share/vala
}

package_libmm-glib-dev() {
  pkgdesc="ModemManager library"
  depends=(libg{lib,object,io}-2.0.so)
  provides=(libmm-glib libmm-glib.so)
  conflicts=(libmm-glib)

  mv libmm/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
