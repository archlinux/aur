# Maintainer: Nowaker <spam@nowaker.net>

pkgname=fprintd-git
pkgver=1.94.5.r91.gb10251e
pkgrel=1
pkgdesc="Development version of the D-Bus service for fingerprint readers"
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  dbus
  glib2
  glibc
  libgcc
  libfprint
  pam
  polkit
  systemd
  systemd-libs
)
makedepends=(
  git
  glib2-devel
  gtk-doc
  meson
  pam_wrapper
  python-cairo
  python-dbus
  python-dbusmock
  python-packaging
)
groups=(fprint)
provides=("fprintd=$pkgver")
conflicts=(fprintd)
source=("fprintd::git+https://gitlab.freedesktop.org/libfprint/fprintd.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/fprintd"

  git describe --long --tags --match 'v*' \
    | sed -E 's/^v//; s/-/.r/; s/-/./g'
}

build() {
  local meson_options=(
    -D gtk_doc=true
    -D pam_modules_dir=/usr/lib/security
  )

  arch-meson fprintd build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  depends+=(libfprint-2.so)

  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
