# Maintainer: Peter Weber <peter.weber@mailbox.org>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=gnome-terminal-transparency
_pkgname=gnome-terminal
pkgver=3.32.2
pkgrel=1
pkgdesc="The GNOME Terminal Emulator, with background transparency"
url="https://wiki.gnome.org/Apps/Terminal"
arch=(x86_64)
license=(GPL)
depends=('vte3>=0.56.2' gsettings-desktop-schemas)
makedepends=(intltool itstool docbook-xsl libnautilus-extension appstream-glib
             gnome-shell vala yelp-tools)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
groups=(gnome)
changelog=package.changelog
source=(https://download.gnome.org/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz
        transparency.patch)
sha256sums=('759a2b093ca606107eb8fb53e407cdf9adce76ccee33f9fa0cd76bf594bd106a'
            '2adce1298846fc11b4a9dadbe60eb4a7e93b885c05c654e5ad277cf53c50178c')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../transparency.patch
  # autogen.sh not in tarball
  autoreconf -fiv
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --disable-static --with-nautilus-extension
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
