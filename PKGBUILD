# $Id$
# Maintainer: Kresimir Pripuzic <kpripuzic@gmail.com>

pkgname=file-roller-tmp
pkgver=3.16.4
pkgrel=1
pkgdesc="The file-roller with an additional patch to put temporary files in /tmp instead of ~/.cache (and thus to reduce the amount of writes to SSDs)."
arch=('i686' 'x86_64')
license=('GPL')
depends=('desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'dconf' 'libarchive' 'file' 'json-glib' 'libnotify' 'zip' 'unzip')
makedepends=('intltool' 'pkg-config' 'libnautilus-extension' 'itstool' 'docbook-xsl')
optdepends=('p7zip: 7z, arj, exe and encrypted zip files support'
            'unrar: better RAR archive support'
            'unace: ACE archive support'
            'lrzip: lrzip archive support'
            'cdrkit: ISO image support')
groups=('gnome-extra')
provides=('file-roller')
conflicts=('file-roller')
options=('!emptydirs')
install=file-roller.install
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname:0:11}/${pkgver:0:4}/${pkgname:0:11}-$pkgver.tar.xz
        tmp-as-temp.patch)
sha256sums=('5455980b2c9c7eb063d2d65560ae7ab2e7f01b208ea3947e151680231c7a4185'
            '9556742b38c06f131f7d56eb72522e38402a85ec99904be73ccae228f5b9572f')

prepare() {
  cd ${pkgname:0:11}-$pkgver
  patch -Np1 -i ../tmp-as-temp.patch
}

build() {
  cd ${pkgname:0:11}-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/file-roller \
      --localstatedir=/var --disable-static \
      --disable-schemas-compile
  make
}

package() {
  cd ${pkgname:0:11}-$pkgver
  make DESTDIR="$pkgdir" install
}
