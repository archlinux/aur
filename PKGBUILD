# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Nikolay Rysev <mad.f3ka@gmail.com>
# Modified for vfs_proprietary by Daniel Kamil Kozar <dkk089@gmail.com>
# Modified for libfprint2 by Stephen Bird <sebirdman@gmail.com>

pkgname=fprintd-libfprint2
_pkgname=fprintd
pkgver=1.90.1+62+ge828ea3
pkgrel=1
pkgdesc="D-Bus service to access fingerprint readers"
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/fprint/fprintd"
license=(GPL)
depends=(dbus-glib 'libfprint-git>=1.90.0' 'polkit>=0.91')
optdepends=('pam: to use the fprintd pam plugin')
provides=(fprintd)
conflicts=(fprintd)
makedepends=(intltool git gtk-doc meson pam)
checkdepends=(pam_wrapper python-cairo python-dbus python-dbusmock python-gobject)
groups=(fprint)
source=("git+https://gitlab.freedesktop.org/libfprint/$_pkgname.git"
        '53.patch'
        'disable-systemd-protection.patch')
sha256sums=('SKIP'
            'd64ace799a6c6a3ea4ee56be104b3bdba6fe913329c25672205e2a3ebb897e6a'
            '4854d32d6579de31fd59b4df02f6a29db2e266dedfe9edda13bedcda1b083be1')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^V_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $_pkgname
  git apply "$srcdir/53.patch"
  patch -p1 -i "${srcdir}/disable-systemd-protection.patch"
}

build() {
  arch-meson $_pkgname build -D pam_modules_dir=/usr/lib/security -D gtk_doc=true
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
