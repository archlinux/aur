# Maintainer: Peter Weber <peter.weber@mailbox.org>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# upstream patches:
# https://src.fedoraproject.org/cgit/rpms/gnome-terminal.git
# https://github.com/debarshiray/gnome-terminal

pkgname=gnome-terminal-transparency
_pkgname=gnome-terminal
pkgver=3.36.0.1
pkgrel=2
pkgdesc="The GNOME Terminal Emulator, with background transparency"
url="https://wiki.gnome.org/Apps/Terminal"
arch=(x86_64)
license=(GPL)
depends=('vte3>=0.60.0' gsettings-desktop-schemas)
makedepends=(itstool docbook-xsl libnautilus-extension appstream-glib
             gnome-shell vala yelp-tools)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
groups=(gnome)
changelog=package.changelog
source=(https://download.gnome.org/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz
        0001-screen-Fix-non-preserved-working-dir.patch
        transparency.patch)
sha256sums=('8b31c1ce622031b860aef6dd9295e1cac89edcc58c27b925543c9a17dffb40e2'
            '32f26314ba3b33c95acb41510fa9e4f46d00bb575d3a32cc765b65303c30734a'
            'af3348189059ba9df0e2a59aa9ab38c14571ced3602b017c2f9aacd13a6572ea')

prepare() {
  cd $_pkgname-$pkgver
  # https://bugs.archlinux.org/task/65774
  patch -Np1 -i ../0001-screen-Fix-non-preserved-working-dir.patch
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
