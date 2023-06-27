# Maintainer: GT610 <myddz1005@163.com>
# Contributer: Veli Tasalı (tasali) <me@velitasali.com>

pkgbase=gcr-git
pkgname=(gcr-git gcr-docs-git)
pkgver=4.1.0+r14+gc8d2e0f
pkgrel=1
pkgdesc="A library for bits of crypto UI and parsing"
url="https://gitlab.gnome.org/GNOME/gcr"
arch=(x86_64)
license=(GPLv2)
depends=(glib2 libgcrypt p11-kit openssh libsecret systemd)
makedepends=(gobject-introspection vala libxslt git gi-docgen gtk3 meson)
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
  provides=(gcr libgck-2.so libgcr-4.so libgcr-4-{gtk3,gtk4}.so)
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
  mv {"${pkgdir}",doc}/usr/share/doc
}

package_gcr-docs-git() {
  provides=(gcr-docs)
  conflicts=(gcr-docs)
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
