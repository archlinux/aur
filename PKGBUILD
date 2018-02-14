# Maintainer: Stefano Capitani (Ste74) <capitani74atgmaildotcom
# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>

pkgname=brightside
pkgver=1.4.0
pkgrel=4
pkgdesc="A tool to set up hotcorners regardless of the WM or DE in use"
arch=('i686' 'x86_64')
url="http://linux.softpedia.com/get/Desktop-Environment/Tools/Brightside-3672.shtml"
license=('GPL2')
depends=('gnome-vfs-nosmb' 'alsa-lib' 'gconf' 'libglade' 'libgnomeui' 'libwnck' 'popt')
makedepends=('intltool')
install=$pkgname.install
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz"
        'brightside-1.4.0-wnck.patch')
sha1sums=('0129efa865f43c7a2bf6d6751ea3347a774c6672'
          '75952642c5d2e538b61bd5fedda3cca93e5c051c')

prepare() {
  cd "$pkgname-$pkgver.orig"
  patch -Np1 -i "$srcdir"/brightside-1.4.0-wnck.patch
  # gconf install path fix
  sed -i '/^schemadir =/s| = \$(sysconfdir)| = \$(datadir)|' src/Makefile.in
}

build() {
  cd "$pkgname-$pkgver.orig"
  LDFLAGS='-lX11' ./configure prefix=/usr --enable-tray-icon
  make
}

package() {
  cd "$pkgname-$pkgver.orig"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
}
