# Maintainer: Peter Weber <peter.weber@mailbox.org>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# upstream patches:
# https://src.fedoraproject.org/cgit/rpms/gnome-terminal.git
# https://github.com/debarshiray/gnome-terminal

pkgname=gnome-terminal-transparency
_pkgname=gnome-terminal
pkgver=3.40.1
pkgrel=1
pkgdesc="The GNOME Terminal Emulator with background transparency"
url="https://wiki.gnome.org/Apps/Terminal"
arch=(x86_64)
license=(GPL)
depends=('vte3>=0.64.0' gsettings-desktop-schemas)
makedepends=(docbook-xsl libnautilus-extension gnome-shell yelp-tools)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
groups=(gnome)
changelog=package.changelog
source=(https://download.gnome.org/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz
        transparency.patch)
sha256sums=('0770cc7320d737fb2eaf9e4cf5ecc6a741f120b17b192f061f683e14b869d8e4'
            '53a67c32525645b846e1a26c7a87977d51a12f2cb37282c7cabcdd7094e0cc20')

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
