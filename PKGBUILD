# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
pkgname=(
  modemmanager-dev
  libmm-glib-dev
)
pkgver=1.25.1_dev
_commit=8486641f922a409a514db33c177aff10b1a18304
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
b2sums=('f38251c2b87eb832fd7258ace8d0e7f1001b2e2ccde10884d8a316433ad7cff6212dccd49d9688cc62c6ace04f5c7c089187e0d7e6fd2a3e07c30d220d5b31e9')
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
