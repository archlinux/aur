# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Nikolay Rysev <mad.f3ka@gmail.com>
# Modified for vfs_proprietary by Daniel Kamil Kozar <dkk089@gmail.com>
# Modified for libfprint2 by Stephen Bird <sebirdman@gmail.com>

pkgname=fprintd-libfprint2
pkgname_=fprintd
pkgver=0.9.0+70+gb97903f
pkgrel=1
pkgdesc="D-Bus service to access fingerprint readers, modified to use libfprint2"
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/fprint/fprintd"
license=(GPL)
depends=(dbus-glib 'glib2>=2.56' 'libfprint-git>=1.90.0' 'polkit>=0.91')
provides=(fprintd)
conflicts=(fprintd)
makedepends=(intltool gtk-doc git pam)
checkdepends=(python-cairo python-dbusmock python-gobject)
groups=(fprint)
source=(
  "git+https://gitlab.freedesktop.org/libfprint/fprintd.git"
  'disable-systemd-protection.patch'
  'storage_fix.patch'
  'disable_pam_tests.patch'
)
sha256sums=(
  'SKIP'
  '4854d32d6579de31fd59b4df02f6a29db2e266dedfe9edda13bedcda1b083be1'
  '2c81b9f4c5e593ee3ebdca08584be4b42c7a1a33f240c0da6e2aab50f0ff4b5c'
  'e94a80acaccc0e4830595b575f3865ed86a9866c18f910a83b568f602c750e3d'
)

pkgver() {
  cd $pkgname_
  git describe --tags | sed 's/^V_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname_
  patch -p1 -i "${srcdir}/disable-systemd-protection.patch"
  patch -p1 -i "${srcdir}/storage_fix.patch"
  patch -p1 -i "${srcdir}/disable_pam_tests.patch"
  NOCONFIGURE=1 ./autogen.sh
}

check() {
  cd $pkgname_
  make check
}


build() {
  cd $pkgname_
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname_
  make DESTDIR="$pkgdir" dbus_confdir=/usr/share/dbus-1/system.d install
  install -d -m 755 "$pkgdir/var/lib/fprint"
}
