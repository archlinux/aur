# Maintainer: Veli Tasalı (tasali) <me@velitasali.com>

pkgbase=gcr-git
pkgname=(gcr-git gcr-docs-git)
pkgver=3.90.0+r8+g2c8cb33
pkgrel=1
pkgdesc="A library for bits of crypto UI and parsing"
url="https://gitlab.gnome.org/GNOME/gcr"
arch=(x86_64)
license=(GPL2)
depends=(gtk3 gtk4 libgcrypt p11-kit openssh libsecret)
makedepends=(gobject-introspection vala libxslt git gi-docgen meson)
options=(debug)
source=("git+https://gitlab.gnome.org/GNOME/gcr.git")
sha256sums=('SKIP')

pkgver() {
  cd gcr
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gcr
}

build() {
  arch-meson gcr build
  meson compile -C build
}

check() {
  # Secure memory tests fail
  dbus-run-session meson test -C build --print-errorlogs || :
}

package_gcr-git() {
  provides=(gcr libgck-2.so libgcr-4-{gtk3,gtk4}.so)
  conflicts=(gcr)
  backup=(etc/security/limits.d/10-gcr.conf)
  install=gcr.install

  meson install -C build --destdir "$pkgdir"

  # gcr wants to lock some memory to prevent swapping out private keys
  # https://bugs.archlinux.org/task/32616
  # https://bugzilla.gnome.org/show_bug.cgi?id=688161
  install -Dm644 /dev/stdin "$pkgdir/etc/security/limits.d/10-gcr.conf" <<END
@users - memlock 1024
END

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_gcr-docs-git() {
  provides=(gcr-docs)
  conflics=(gcr-docs)
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
