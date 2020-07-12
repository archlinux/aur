# Maintainer: Matthew Murray <matt@mattmurr.xyz>
pkgname=fprintd-clients-git
_pkgname=fprintd-clients
pkgver=r472.ba60533
pkgrel=2
pkgdesc='Fprintd without the daemon'
arch=(x86_64)
license=(GPL)
depends=(glib2 libfprint polkit dbus dbus-glib libsystemd)
makedepends=(gtk-doc git meson pam_wrapper python-cairo python-dbus python-dbusmock)
conflicts=(fprintd)
provides=($_pkgname)
url="https://gitlab.freedesktop.org/uunicorn/fprintd"
source=("${_pkgname}::git+${url}.git#branch=master"
  disable-systemd-reactivated.diff)
md5sums=('SKIP'
         'b392087f0a6a824fcbceec21d2a38402')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  patch -Np1 --directory=$_pkgname < disable-systemd-reactivated.diff
}

build() {
  arch-meson $_pkgname build \
    -D pam_modules_dir=/usr/lib/security \
    -D gtk_doc=true
  meson compile -C build
}

check() {
  # Disable PAM tests
  meson test --no-suite PAM -C build
}

package() {
  depends+=(libfprint-2.so)

  DESTDIR=$pkgdir meson install -C build
  install -d -m 700 "${pkgdir}/var/lib/fprint"
}

# vim:set ts=2 sw=2 et:
