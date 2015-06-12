# Maintainer: Jozef Riha <jose1711 at gmail dot com>
# Contributor: scrawl
# Contributor: Karro
# Contributor: zorun
# Contributor: virtuemood
# Contributor: ertua

pkgname=gosm
pkgver=0.09
pkgrel=6
pkgdesc="the Gtk OpenStreetMap Tool"
url="http://sourceforge.net/projects/gosm"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libwebkit' 'libsvg-cairo' 'curl' 'libpng12')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}.0.0.9.tar.gz" "gosm.desktop")
options=('!strip')
md5sums=('0401cf7022ec86b109bf5faa9291cb38'
         '585f1b5c37496815d7d7c1edc69ec2cb')

build() {
cd $srcdir/${pkgname}
sed -i '/<glib\/gthread.h>/d' */*.{h,c}
sed -i '/^CFLAGS/s/BUILD=0/BUILD=1/' Makefile
sed -i -e 's/dpkg-deb/echo dpkg-deb/' -e 's/rm -rf packages/echo /' -e 's/libpng/&12/' Makefile
sed -i -e 's/png.h/libpng12\/png.h/g' -e 's/png_infopp_NULL/NULL/' imageglue/imageglue.c
make
rm -r $srcdir/${pkgname}/packages 
mkdir -p $srcdir/${pkgname}/packages 
make deb
}

package() {
mkdir ${pkgdir}/usr
cd $srcdir/${pkgname}/packages/deb/usr
mv $srcdir/${pkgname}/packages/deb/usr "${pkgdir}/"
install -D -m644 $srcdir/gosm.desktop $pkgdir/usr/share/applications/gosm.desktop
}
