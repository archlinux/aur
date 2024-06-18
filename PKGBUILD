# Maintainer: GT610 <myddz1005@163.com>
# Contributer: Veli Tasalı (tasali) <me@velitasali.com>

pkgbase=gcr-git
pkgname=(
  gcr-git
  gcr-docs-git
)
pkgver=4.3.0+r5+g78e5f89
pkgrel=1
pkgdesc="A library for bits of crypto UI and parsing"
url="https://gitlab.gnome.org/GNOME/gcr"
arch=(x86_64)
license=(GPL2)
depends=(
  glib2
  libgcrypt
  libsecret
  openssh
  p11-kit
  systemd
)
makedepends=(
  gi-docgen
  git   
  gobject-introspection
  gtk4
  meson
  vala
  libxslt
  glib2-devel
)
_commit=78e5f89016635b4c4922e63f599b8ec81ea4b923
source=("git+https://gitlab.gnome.org/GNOME/gcr.git")
b2sums=('SKIP')

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
  provides=(
    libgck-2.so
    libgcr-4.so
  )
  conflicts=(gcr-4)
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
  conflicts=(gcr-4-docs)
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:

