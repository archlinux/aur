# Maintainer: Damglador <damglador@gmail.com>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Jan de Groot <jan@archlinux.org>
_pkgname=gconf
pkgname=lib32-${_pkgname}
pkgver=3.2.6+11+g07808097
pkgrel=7
pkgdesc="An obsolete configuration database system"
url="https://gitlab.gnome.org/Archive/gconf"
arch=(x86_64)
license=('LGPL-2.0-only')

depends=(lib32-polkit lib32-dbus-glib)
makedepends=(git intltool lib32-gtk3 gtk-doc gobject-introspection gnome-common glib2-devel)
makedeps+=(lib32-libxml2 lib32-libldap) # required only by executables which are removed, still needed for building
optdepends=("$_pkgname: configuration files and utilities")

_commit=0780809731c8ab1c364202b1900d3df106b28626 # The latest and last commit, dug out from deep within the waves of time...
source=("git+https://gitlab.gnome.org/Archive/gconf.git#commit=$_commit"
        01_xml-gettext-domain.patch gconf-reload.patch)
sha256sums=('9d4fdc49825c6938be59ae9f7e88eccc4fc8a1dc2c7ce130919916c32ccad179'
            'c883dec2b96978874a53700cfe7f26f24f8296767203e970bc6402b4b9945eb8'
            '567b78d8b4b4bbcb77c5f134d57bc503c34867fcc6341c0b01716bcaa4a21694')

prepare() {
  cd $_pkgname

  # Patch from fedora - reloads gconf after installing schemas
  patch -Np1 -i ../gconf-reload.patch

  # http://bugzilla.gnome.org/show_bug.cgi?id=568845
  patch -Np1 -i ../01_xml-gettext-domain.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd $_pkgname
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --lib{exec,}dir=/usr/lib32 \
    --enable-defaults-service \
    --disable-gtk-doc \
    --disable-static \
    --disable-orbit \
    --disable-gsettings-backend \
    --program-suffix="-32" \
    --includedir="/usr/include/${pkgbase}32" \
    --build=i686-pc-linux-gnu
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -j$(nproc) CFLAGS+="-DGLIB_DISABLE_DEPRECATION_WARNINGS -Wno-unused-result"
}

check() {
  cd $_pkgname
  make check
}

package() {
  DESTDIR="$pkgdir" make -C $_pkgname install

  rm -r "$pkgdir"/etc
  rm -r "$pkgdir"/usr/{bin,include,share}
}
