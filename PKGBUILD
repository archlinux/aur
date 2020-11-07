# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Nikolay Rysev <mad.f3ka@gmail.com>
# Modified for vfs_proprietary by Daniel Kamil Kozar <dkk089@gmail.com>
# Modified for libfprint2 by Stephen Bird <sebirdman@gmail.com>
# Contributor: Timothy Gu <timothygu99@gmail.com>

pkgname=fprintd-libfprint2
_pkgname=fprintd
epoch=1
pkgver=1.90.8+3+gc6647ba
pkgrel=1
pkgdesc="D-Bus service to access fingerprint readers"
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/fprint/fprintd"
license=(GPL)
depends=(dbus dbus-glib glib2 'libfprint>=1.90.1' libsystemd 'polkit>=0.91')
optdepends=('pam: to use the fprintd pam plugin')
provides=(fprintd)
conflicts=(fprintd)
makedepends=(git gtk-doc meson pam)
checkdepends=(pam_wrapper python-cairo python-dbus python-dbusmock python-gobject)
groups=(fprint)
source=("git+https://gitlab.freedesktop.org/libfprint/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^V_\|^v//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $_pkgname
}

build() {
  arch-meson $_pkgname build \
    -D pam_modules_dir=/usr/lib/security \
    -D gtk_doc=true
  ninja -C build
}

check() {
  # Unfortunately, the PAM tests often end up cluttering /tmp with pam.*
  # directories, causing random failures the next time tests get run.
  msg2 'Removing stale /tmp/pam.[0-9A-Za-z] directories before testing'
  rm -rf /tmp/pam.[0-9A-Za-z]
  meson test -C build --print-errorlogs
}

package() {
  depends+=(libfprint-2.so)

  DESTDIR="$pkgdir" meson install -C build
  install -d -m 700 "$pkgdir/var/lib/fprint"
}
