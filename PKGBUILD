# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=amide  
pkgver=1.0.5
pkgrel=7
pkgdesc="Medical Imaging Data Examiner"
url="http://amide.sourceforge.net/packages.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dcmtk' 'xmedcon' 'libgnomecanvas' 'ffmpeg' 'gnome-vfs' 'gconf' 'gsl')
optdepends=('volpack: for volume rendering')
makedepends=('gnome-doc-utils' 'gtk-doc' 'intltool')
source=(http://downloads.sourceforge.net/project/$pkgname/amide/$pkgver/$pkgname-$pkgver.tgz gsl.patch alignment_mutual_information.patch)
md5sums=('8a9b89e3d3ec1bb3e390f202f4861a7c'
         '77737953dfcbd9eca4dd7699e79e0bca'
         'fb64f22d5519b38cd832f14f02a7bd39')
options=('!makeflags')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver/
  patch -Np1 < "$srcdir"/alignment_mutual_information.patch
  patch -Np1 < "$srcdir"/gsl.patch
}

build() {
  cd "$srcdir"/$pkgname-$pkgver/
  ./configure --prefix=/usr --disable-ffmpeg --enable-libdcmdata=no \
	      --enable-gtk-doc=yes --enable-amide-debug=no
  make
  ./configure --prefix=/usr --disable-ffmpeg --enable-libdcmdata \
	      --with-xmedcon-exec-prefix=/usr/bin --enable-amide-debug=no
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  sed -i 's+.png++' $pkgdir/usr/share/applications/amide.desktop
}
