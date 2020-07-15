# Maintainer: Matthew Murray <matt@mattmurr.xyz>
pkgname=fprintd-clients-git
_pkgname=fprintd-clients
pkgver=1.90.1.r2.g54e56d6
pkgrel=1
pkgdesc='Fprintd without the daemon'
arch=(x86_64)
license=(GPL)
depends=(glib2 libfprint polkit dbus dbus-glib libsystemd)
makedepends=(gtk-doc git meson pam_wrapper python-cairo python-dbus python-dbusmock)
conflicts=(fprintd fprintd-clients)
provides=($_pkgname)
url="https://gitlab.freedesktop.org/uunicorn/fprintd"
source=("${_pkgname}::git+${url}.git#branch=debian/clients-only"
  disable-systemd-reactivated.diff)
md5sums=('SKIP'
         'b392087f0a6a824fcbceec21d2a38402')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  patch -Np1 < $srcdir/disable-systemd-reactivated.diff
}

build() {
  arch-meson $_pkgname build \
    -D pam_modules_dir=/usr/lib/security
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  depends+=(libfprint-2.so)

  DESTDIR=$pkgdir meson install -C build
  install -d -m 700 "${pkgdir}/var/lib/fprint"
}

# vim:set ts=2 sw=2 et:
