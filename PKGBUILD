# Maintainer: Igor <f2404@yandex.ru>
# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Original package: Jan de Groot <jgc@archlinux.org>

_realname=gnome-terminal
pkgname=$_realname-git

pkgver=3.31.1.6093.f624ba89
_realver=3.7.3
pkgrel=1
pkgdesc="The GNOME Terminal Emulator. Git Version"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gconf' 'vte3-git' 'gsettings-desktop-schemas' 'libsm')
makedepends=('gnome-doc-utils' 'intltool' 'itstool' 'docbook-xsl' 'appdata-tools' 'yelp-tools')
options=('!emptydirs')
url="https://www.gnome.org"
groups=('gnome')
install=gnome-terminal.install

provides=($_realname=$pkgver)
conflicts=($_realname)

source=("git+https://gitlab.gnome.org/GNOME/${_realname}.git")
md5sums=("SKIP")

subver() {
  PREFIX="m4_define(\[gt_version_$1\],\["
  echo $(grep $PREFIX configure.ac | eval sed "'s/$PREFIX//'" | sed 's/\])//')
}
 
pkgver() {
  cd $_realname
  major=$(subver major)
  minor=$(subver minor)
  micro=$(subver micro)
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $major.$minor.$micro.$revision.$hash
}

build() {
  cd $_realname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-scrollkeeper
  make
}

package() {
  cd $_realname
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install

  install -m755 -d "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/$_realname.schemas" --domain gnome-terminal "$pkgdir"/etc/gconf/schemas/*.schemas
  rm -f "$pkgdir"/etc/gconf/schemas/*.schemas
}
