# $Id$
# Maintainer: Kresimir Pripuzic <kpripuzic@gmail.com>

pkgname=file-roller-tmp
pkgver=3.24.1
pkgrel=1
pkgdesc="The file-roller with an additional patch to put temporary files in /tmp instead of ~/.cache (and thus to reduce the amount of writes to SSDs)."
arch=(i686 x86_64)
license=(GPL)
depends=(gtk3 dconf libarchive file json-glib libnotify zip unzip)
makedepends=(intltool itstool docbook-xsl gnome-common git libnautilus-extension)
optdepends=('p7zip: 7z, arj, exe and encrypted zip files support'
            'unrar: better RAR archive support'
            'unace: ACE archive support'
            'lrzip: lrzip archive support')
groups=(gnome-extra)
provides=('file-roller')
conflicts=('file-roller')
_commit=e6ef6fa43a6d5d6e1509f122a206870adc113563  # tags/3.24.1^0
source=("git+https://git.gnome.org/browse/file-roller#commit=$_commit"
	tmp-as-temp.patch)
sha256sums=('SKIP'
	'753c6ee41772677b115f4178fe6384c21d8aa5d489a6074f659d5305736acf57')

pkgver() {
  cd ${pkgname:0:11}
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd ${pkgname:0:11}  
  NOCONFIGURE=1 ./autogen.sh

  #patch
  cd $srcdir/${pkgname:0:11}
  patch -Np0 -i ../tmp-as-temp.patch
}

build() {
  cd ${pkgname:0:11}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/$pkgname --disable-static --disable-schemas-compile
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${pkgname:0:11}
  make DESTDIR="$pkgdir" install
}
