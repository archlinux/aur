# Maintainer: Srđan Simić <lei.pero@gmail.com>
# Contributor: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=gnome-terminal
pkgname=gnome-terminal-csd1
pkgver=3.24.2
pkgrel=1
pkgdesc="The GNOME Terminal Emulator with CSD support"
url="https://wiki.gnome.org/Apps/Terminal"
arch=(i686 x86_64)
license=(GPL)
depends=(vte3 gsettings-desktop-schemas dconf)
makedepends=(intltool itstool docbook-xsl libnautilus-extension appdata-tools
             gnome-shell gconf vala yelp-tools git)
conflicts=(${_pkgname})
options=(!emptydirs)
groups=(gnome)
# CSD Patch: https://github.com/leipero/gnome-terminal-csd-patch
source=("https://download.gnome.org/sources/${_pkgname}/${pkgver::4}/${_pkgname}-${pkgver}.tar.xz"
	"https://raw.githubusercontent.com/leipero/gnome-terminal-csd-patch/master/gnome-terminal-csd.patch")
sha256sums=('281edac30a07ca45beaaaf0a13fe2219cf8b87ece5e55dccbfc49ef769dfec0f'
            'bd15026f1c1e811481ddf6b478a9d291897383ab581e69cbac1ab47019719268')


prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -p1 -i "../gnome-terminal-csd.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/$pkgname --disable-static --with-nautilus-extension
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd "${_pkgname}-${pkgver}"
  make check
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
