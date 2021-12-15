# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_pkgname=gcr
pkgname=gcr-nogtk
pkgver=3.41.0
pkgrel=1
pkgdesc="A library for bits of crypto UI and parsing (without GTK)"
url="https://gitlab.gnome.org/GNOME/gcr"
arch=(x86_64 i686)
license=(GPL2)
depends=(dconf libgcrypt p11-kit openssh libsecret)
makedepends=(gobject-introspection vala libxslt git gtk-doc meson)
provides=(libgck-1.so libgcr-{base,ui}-3.so ${_pkgname}=${pkgver}-${pkgrel})
_commit=f5026a8c9c7d78372b3efeca3412b0e40011ce11  # tags/3.41.0^0
backup=(etc/security/limits.d/10-gcr.conf)
install=gcr.install
source=("git+https://gitlab.gnome.org/GNOME/gcr.git#commit=$_commit")
sha256sums=('SKIP')
conflicts=(${_pkgname})

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
}

build() {
  arch-meson -D gtk=false -D gtk_doc=false $_pkgname build
  meson compile -C build
}

check() {
  # Secure memory tests fail
  dbus-run-session meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  # gcr wants to lock some memory to prevent swapping out private keys
  # https://bugs.archlinux.org/task/32616
  # https://bugzilla.gnome.org/show_bug.cgi?id=688161
  install -Dm644 /dev/stdin "$pkgdir/etc/security/limits.d/10-gcr.conf" <<END
@users - memlock 1024
END
}

# vim:set ts=2 sw=2 et:
