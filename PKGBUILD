# Maintainer: Srđan Simić <lei.pero@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

# CSD Patch: https://github.com/leipero/gnome-terminal-csd-patch
_pkgname=gnome-terminal
pkgname=gnome-terminal-csd1
pkgver=3.30.0
pkgrel=1
pkgdesc="The GNOME Terminal Emulator with CSD support"
url="https://wiki.gnome.org/Apps/Terminal"
arch=(x86_64)
license=(GPL)
depends=('vte3>=0.52.0' gsettings-desktop-schemas dconf)
makedepends=(intltool itstool docbook-xsl libnautilus-extension appdata-tools
             gnome-shell gconf vala yelp-tools git)
conflicts=(gnome-terminal)
options=(!emptydirs)
groups=(gnome)
_commit=4b2638a4c99b991ff8a07dfd52b4397d6636fdd9  # tags/3.30.0^0
source=("git+https://git.gnome.org/browse/gnome-terminal#commit=$_commit"
	"https://raw.githubusercontent.com/leipero/gnome-terminal-csd-patch/master/gnome-terminal-csd.patch")
sha256sums=('SKIP'
	    'bd15026f1c1e811481ddf6b478a9d291897383ab581e69cbac1ab47019719268')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  patch -p1 -i "../gnome-terminal-csd.patch"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname
  LDFLAGS+=" -pthread"  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/$pkgname --disable-static --with-nautilus-extension
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $_pkgname
  make check
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
