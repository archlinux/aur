# Maintainer: tinywrkb <tinywrkb@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=polkit
pkgname=${_pkgname}-duktape
pkgver=0.118
pkgrel=1
pkgdesc="polkit with duktape as the javascript engine"
arch=(x86_64)
license=(LGPL)
url="https://www.freedesktop.org/wiki/Software/polkit/"
depends=(glib2 pam expat systemd duktape)
makedepends=(intltool gtk-doc gobject-introspection git autoconf-archive)
conflicts=(polkit)
provides=(polkit)
backup=(etc/pam.d/polkit-1)
_commit=ff4c2144f0fb1325275887d9e254117fcd8a1b52
source=("git+https://gitlab.freedesktop.org/polkit/polkit.git#commit=$_commit"
        "0001-Add-duktape-as-javascript-engine.patch")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  patch -p1 -i ../0001-Add-duktape-as-javascript-engine.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname

  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib \
      --enable-libsystemd-login=yes --disable-static \
      --enable-gtk-doc --with-os-type=redhat --with-duktape

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd $_pkgname
  make -k check || :
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install \
      dbusconfdir=/usr/share/dbus-1/system.d \
      rulesdir=/usr/share/polkit-1/rules.d

  install -d -o root -g 102 -m 750 "$pkgdir"/{etc,usr/share}/polkit-1/rules.d

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf" <<END
u polkitd 102 "PolicyKit daemon"
m polkitd proc
END
}

# vim: ts=2 sw=2 et:
