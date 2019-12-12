# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=aisleriot-git
pkgver=3.22.10.r3.g2ce4a2ce
pkgrel=1
pkgdesc="A collection of patience games written in guile scheme"
url="https://wiki.gnome.org/Apps/Aisleriot"
arch=('x86_64')
license=('GPL')
depends=('guile' 'gtk3' 'qt5-svg')
provides=('aisleriot')
conflicts=('aisleriot')
makedepends=('appdata-tools' 'gnome-common' 'git' 'meson')
optdepends=('pysolfc: for PySol card sets'
            'pysolfc-cardsets: for PySol card sets'
	   'libkdegames: for KDE cardsets ')
options=('!strip' '!emptydirs')
source=("git+https://gitlab.gnome.org/GNOME/aisleriot.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's/-/.r/' | tr - .
}

build() {
  cd ${pkgname%-git}
  [[ -d builddir ]] || mkdir builddir
  meson . builddir --prefix=/usr \
	--libexecdir=/usr/lib \
	-Dtheme_kde_path=/usr/share/carddecks \
	--buildtype=plain 
  ninja -j1 -C builddir
}

package() {
  cd ${pkgname%-git}
  DESTDIR="$pkgdir" ninja -C builddir install
}
