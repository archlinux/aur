# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=aisleriot-git
pkgver=3.22.8.r6.g21bf497e
pkgrel=1
pkgdesc="A collection of patience games written in guile scheme"
url="https://wiki.gnome.org/Apps/Aisleriot"
arch=('x86_64')
license=('GPL')
depends=('guile' 'gtk3' 'librsvg' 'libcanberra' 'dconf')
provides=('aisleriot')
conflicts=('aisleriot')
makedepends=('appdata-tools' 'gnome-common' 'git')
optdepends=('libkdegames: KDE card sets'
            'pysolfc: PySol card sets'
            'pysolfc-cardsets: PySol card sets')
options=('!emptydirs')
source=("git+https://gitlab.gnome.org/GNOME/aisleriot.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's/-/.r/' | tr - .
}

build() {
  cd ${pkgname%-git}
  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --disable-static \
    --with-platform=gtk-only \
    --with-kde-card-theme-path=/usr/share/carddecks \
    --with-pysol-card-theme-path=/usr/share/PySolFC

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
}
