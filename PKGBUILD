# Maintainer: Manolis Kapernaros (kapcom01) <kapcom01@protonmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Nikolay Rysev <mad.f3ka@gmail.com>
# Modified for vfs_proprietary by Daniel Kamil Kozar <dkk089@gmail.com>

pkgname=fprintd-vfs_proprietary
pkgname_=fprintd
pkgver=0.8.1
pkgrel=2
pkgdesc="D-Bus service to access fingerprint readers, modified for the vfs_proprietary plugin"
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/fprint/fprintd"
license=(GPL)
depends=(libfprint-vfs_proprietary-git dbus-glib polkit)
conflicts=(fprintd)
makedepends=(intltool gtk-doc gnome-common git)
groups=(fprint)
_commit=9e32cd525724f21eebf2336a06b13a39c6616ab0  # tags/V_0_8_1^0
source=(
  "git+https://gitlab.freedesktop.org/libfprint/fprintd.git#commit=$_commit"
  'disable-systemd-protection.patch'
  'gcc10-workaround.patch'
)
sha256sums=(
  'SKIP'
  '034ded26596473b418fdfcfeb0838fef131819025660d047d41cf343f8c35116'
  'eef023908190da9bc53abf274a17cb2575d80f48a3a8b258b9cd7d5459de4247'
)

pkgver() {
  cd $pkgname_
  git describe --tags | sed 's/^V_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname_
  patch -p1 -i "${srcdir}/disable-systemd-protection.patch"
  patch -p1 -i "${srcdir}/gcc10-workaround.patch"
  NOCONFIGURE=1 ./autogen.sh
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
  install -d -m 700 "$pkgdir/var/lib/fprint"
}
