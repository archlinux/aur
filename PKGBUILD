# Maintainer: Stefano Capitani (Ste74) <capitani74atgmaildotcom
# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>

pkgname=brightside
pkgver=1.4.0
pkgrel=2
pkgdesc="A tool to set up hotcorners regardless of the WM or DE in use"
arch=('i686' 'x86_64')
url="http://linux.softpedia.com/get/Desktop-Environment/Tools/Brightside-3672.shtml"
license=('GPL2')
depends=('alsa-lib' 'gconf' 'libglade' 'libgnomeui' 'libwnck' 'popt' 'gnome-vfs-nosmb')
makedepends=('intltool')
install=$pkgname.install
source=('http://pkgs.fedoraproject.org/repo/pkgs/brightside/brightside-1.4.0.tar.bz2/df6dfe0ffbf110036fa1a5549b21e9c3/brightside-1.4.0.tar.bz2'
        'brightside-1.4.0-wnck.patch')
sha1sums=('39cc63fe01b175ca4cfc2ae23b8aadbf2b30e93c'
          '75952642c5d2e538b61bd5fedda3cca93e5c051c')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "$srcdir"/brightside-1.4.0-wnck.patch
  # gconf install path fix
  sed -i '/^schemadir =/s| = \$(sysconfdir)| = \$(datadir)|' src/Makefile.in
}

build() {
  cd "$pkgname-$pkgver"
  LDFLAGS='-lX11' ./configure prefix=/usr --enable-tray-icon
  make
}

package() {
  cd "$pkgname-$pkgver"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
}
